#!/usr/bin/env bash
# =============================================================================
# SOE Compliance Toolkit · 一键安装脚本
# 用法:
#   bash install.sh                # 完整安装（推荐）：克隆仓库到本地 + 注册技能
#   bash install.sh --skills-only # 仅注册技能（仓库已在本地）
#
# 支持平台:
#   - Hermes      ~/.hermes/profiles/<profile>/skills/
#   - Claude Code ~/.claude/skills/
#   - Cursor      ~/.cursor/skills/  （如存在）
# =============================================================================
set -euo pipefail

REPO_URL="https://github.com/zhouqkt/soe-compliance-toolkit.git"
SUITE_NAME="soe-compliance-toolkit"
SKILLS_DIR="skills"
MODE="${1:-full}"

info()  { printf '\033[0;34m[INFO]\033[0m %s\n' "$*"; }
ok()    { printf '\033[0;32m[ OK ]\033[0m %s\n' "$*"; }
warn()  { printf '\033[0;33m[WARN]\033[0m %s\n' "$*"; }
die()   { printf '\033[0;31m[FAIL]\033[0m %s\n' "$*"; exit 1; }

# ---------- 1. 定位仓库目录 ----------
if [ "$MODE" = "--skills-only" ]; then
    SUITE_DIR="$(pwd)"
    [ -d "$SUITE_DIR/$SKILLS_DIR" ] || die "当前目录不是套件根目录（未找到 skills/）"
    info "使用当前目录作为套件根目录: $SUITE_DIR"
else
    SUITE_DIR="$HOME/$SUITE_NAME"
    if [ ! -d "$SUITE_DIR/$SKILLS_DIR" ]; then
        info "克隆仓库到 $SUITE_DIR ..."
        git clone --depth 1 "$REPO_URL" "$SUITE_DIR" || die "克隆失败（网络受限时请手动下载 zip 解压到 $SUITE_DIR）"
    else
        info "仓库已存在: $SUITE_DIR"
    fi
fi

# ---------- 2. 检测平台并安装技能 ----------
installed=0
targets=()

# Hermes
if [ -d "$HOME/.hermes" ]; then
    # 当前 profile 优先
    if [ -n "${HERMES_PROFILE:-}" ] && [ -d "$HOME/.hermes/profiles/$HERMES_PROFILE" ]; then
        targets+=("$HOME/.hermes/profiles/$HERMES_PROFILE/skills/compliance")
    elif [ -d "$HOME/.hermes/profiles" ]; then
        profile=$(ls "$HOME/.hermes/profiles" 2>/dev/null | head -1)
        if [ -n "$profile" ]; then
            targets+=("$HOME/.hermes/profiles/$profile/skills/compliance")
        fi
    fi
    [ ${#targets[@]} -eq 0 ] && targets+=("$HOME/.hermes/skills/compliance")
fi

# Claude Code
[ -d "$HOME/.claude" ] && targets+=("$HOME/.claude/skills")

# Cursor
[ -d "$HOME/.cursor" ] && targets+=("$HOME/.cursor/skills")

if [ ${#targets[@]} -eq 0 ]; then
    warn "未检测到支持的 Agent 平台，技能已保留在 $SUITE_DIR/$SKILLS_DIR，请手动复制"
fi

for target in "${targets[@]}"; do
    mkdir -p "$target"
    n=0
    for skill in "$SUITE_DIR/$SKILLS_DIR"/*/; do
        [ -d "$skill" ] || continue
        name="$(basename "$skill")"
        cp -R "$skill" "$target/$name"
        n=$((n+1))
    done
    ok "已注册 $n 个技能到 $target"
    installed=$((installed+n))
done

# ---------- 3. 提示 ----------
echo
ok "安装完成（共注册 $installed 个技能）"
echo "----------------------------------------"
echo "套件根目录: $SUITE_DIR"
echo "  - Expert.md / format-spec.md / enterprise-profile.example.md"
echo "  - scripts/md2docx_gbt.py（统一排版）"
echo
echo "首次使用：在你的 Agent 中运行 /enterprise-onboarding 完成企业画像配置"
echo "注意事项："
echo "  - matters/、knowledge-base/、enterprise-profile.md 为本地数据，不会随仓库分发"
echo "  - 需要 Git 环境；如网络受限，可手动下载仓库 zip 后使用 --skills-only 模式"
