---
name: compliance-hub
version: "0.1.0"
description: 国有企业法务合规工具箱入口——识别用户合规需求并路由到对应技能，提供合规管理体检清单与工作流编排。当用户请求涉及国资合规、法务审查、合规体系、合规体检、审查需求时自动激活。触发词：合规体检、合规审查、法务需求、合规管理、检查清单、有什么功能。
---

# 合规中枢（compliance-hub）

国有企业法务合规工具箱的入口技能。识别用户需求，路由到对应专项技能，并对合规管理体系建设提供体检框架。

## 前置（工作台机制）

1. **读取企业画像** `enterprise-profile.md`（不存在 → 提示运行 /enterprise-onboarding 完成配置）
2. **共享护栏** 见 `Expert.md`（四级溯源、通用铁律、能力槽协议、标准管线）
3. **法规核验闸门** 正式文件输出前必须过 /legal-verification（详见 Expert.md）
4. **排版输出** 转 Word 统一用 `scripts/md2docx_gbt.py`，参数源 `format-spec.md`

## 技能全景

| 板块 | 技能 | 一句话说明 |
|------|------|-----------|
| **配置** | /enterprise-onboarding | 企业画像冷启动访谈（写入 enterprise-profile.md） |
| **配置** | /customize | 单项修改配置（画像/排版参数） |
| **质控** | /legal-verification | 正式文件输出前法规核验闸门 |
| **质控** | /document-formatting | 转 Word 前排版校验闸门 |
| **输入** | /document-parse | PDF/扫描件/图片解析为 Markdown |
| **知识** | /compliance-knowledge-base | 合规知识库（法规库/审查案例/工作笔记） |
| **事项管理** | /compliance-matter-manager | 审查事项台账、整改跟踪、期限提醒、结案归档 |
| **复盘** | /compliance-review | 整改闭环复盘、专项/年度合规复盘 |
| 合规体系 | /rule-46-review | 依据国资委令第46号开展合规管理体系符合性审查 |
| 决策合规 | /triple-major-review | "三重一大"事项识别与决策程序审查 |
| 国资交易 | /asset-transaction-review | 依据国资委令第32号审查国有资产交易 |
| 关联交易 | /related-party-review | 关联方识别、关联交易认定与管控 |
| 贸易风控 | /trade-authenticity-check | 四流合一核验、融资性贸易与空转贸易识别 |
| 合同审查 | /contract-review | 采购、贸易、供应链金融合同合规审查 |
| 采购合规 | /procurement-review | 招标投标法、政府采购法符合性审查 |
| 境外投资 | /overseas-investment-review | 发改委11号令备案核准、国资委35号令审查 |
| 数据合规 | /data-compliance-review | 数据安全法、个保法、数据出境合规审查 |
| 劳动用工 | /labor-compliance-review | 劳动合同法、社保、工时休假、解除终止审查 |
| 公文写作 | /official-document-writing | 请示、报告、函、纪要等公文起草（GB/T 9704-2012） |
| 诉讼文书 | /litigation-document-writing | 起诉状、答辩状等诉讼文书起草 |
| 风险报告 | /compliance-report | 合规风险报告、专项检查报告生成 |

## 需求识别与路由

1. 用户明确提及专项需求（如"46号令体检"）→ 直接路由到对应技能
2. 关键词匹配：
   - 合规体系 / 合规管理办法 / 合规管理制度 → /rule-46-review
   - 三重一大 / 重大决策 / 大额资金 / 重要人事 → /triple-major-review
   - 国有资产交易 / 股权转让 / 资产评估 / 产权交易 → /asset-transaction-review
   - 关联交易 / 关联方 / 利益输送 → /related-party-review
   - 贸易真实性 / 融资性贸易 / 空转贸易 / 四流合一 → /trade-authenticity-check
   - 合同审查 / 合同风险 / 条款审查 → /contract-review
   - 招标 / 采购合规 / 政府采购 → /procurement-review
   - 境外投资 / 海外投资 / 走出去 / ODI → /overseas-investment-review
   - 数据合规 / 数据安全 / 个人信息 / 数据出境 / 等保 → /data-compliance-review
   - 劳动用工 / 劳动合同 / 劳动争议 / 社保 / 解除劳动合同 → /labor-compliance-review
   - 请示 / 报告 / 函 / 会议纪要 / 公文 → /official-document-writing
   - 起诉状 / 答辩状 / 诉讼文书 → /litigation-document-writing
   - 风险报告 / 检查报告 / 整改报告 → /compliance-report
   - 配置 / 重新配置 / 初始化 / 企业画像 → /enterprise-onboarding
   - 修改配置 / 改参数 / 改排版 → /customize
   - 核验法规 / 核验引用 / 核验法条 → /legal-verification
   - 事项台账 / 建档 / 整改跟踪 / 待办 / 期限 / 结案 → /compliance-matter-manager
   - 复盘 / 整改复查 / 复检 / 年度合规总结 / 回头看 → /compliance-review
   - 解析文档 / PDF转文本 / 提取内容 / 扫描件 → /document-parse
   - 排版校验 / 格式检查 / 检查格式 → /document-formatting
   - 知识库 / 沉淀 / 检索法规 / 查案例 / 保存经验 → /compliance-knowledge-base
3. 需求不明确 → 询问企业性质（央企/地方国企/金融国企）、所属层级、业务板块、审查对象

## 合规管理体检清单（46号令视角）

当用户请求"合规体检"或"合规体系建设评估"时，按以下维度逐项检查：

### 一、合规管理组织体系
- [ ] 是否建立合规管理委员会（或明确决策层合规职责）
- [ ] 是否设置首席合规官或合规管理负责人
- [ ] 是否明确合规管理部门（牵头部门）及职责
- [ ] 业务部门、职能部门合规职责是否落实到岗位
- [ ] 是否配备专（兼）职合规管理人员

### 二、合规管理制度体系
- [ ] 是否制定合规管理基本制度（合规管理办法）
- [ ] 是否制定重点领域专项合规指引（市场交易、合同管理、财务税收、安全环保、知识产权、数据合规等）
- [ ] 制度是否覆盖全部业务领域和管理环节
- [ ] 制度是否及时根据法律法规变化修订

### 三、合规管理运行机制
- [ ] 合规风险识别评估是否定期开展（建议每年至少一次）
- [ ] 重大决策事项合规审查是否嵌入决策流程
- [ ] 合规风险预警与报告机制是否建立
- [ ] 违规事件处理与整改闭环是否落实
- [ ] 合规考核是否纳入绩效考核体系

### 四、合规文化
- [ ] 领导层合规承诺与示范
- [ ] 全员合规培训是否定期开展
- [ ] 合规举报渠道是否畅通

## 典型工作流编排

| 场景 | 技能序列 |
|------|---------|
| 合规管理体系年度体检 | rule-46-review → compliance-report（出具体检报告） |
| 重大投资决策合规把关 | triple-major-review → asset-transaction-review（涉国资交易时）→ compliance-report |
| 贸易业务真实性专项检查 | trade-authenticity-check → contract-review（审查相关合同）→ compliance-report |
| 起草合规管理制度 | rule-46-review（对照46号令要求）→ official-document-writing（起草制度文本） |
| 收到监管检查通知 | compliance-report（自查报告）→ official-document-writing（回函/报告） |

## 执行规则

1. 只路由和引导，不越权替代专项技能产出
2. 涉及具体法规条文时，优先调用法律检索能力槽核验现行有效性；未接入时标注待核验
3. 审查结论必须区分"合规/待整改/风险提示"三档，并说明依据
4. 涉密材料提示用户线下处理，不在对话中留存敏感信息

## 输出规范

- 体检类输出：结构化清单（逐项 合规/部分合规/不合规/不适用 + 依据 + 整改建议）
- 审查类输出：审查意见书（审查事项 → 审查依据 → 风险点 → 结论建议）
- 所有输出标注"辅助审查意见，最终以合规管理部门和专业法律意见为准"


## 输出前闸门（强制）

正式文件（审查意见书、核查意见、体检报告、制度文本、报告等）交付前，须过 /legal-verification 法规核验闸门（详见 Expert.md），核验全部法规、条文、监管文件引用；未核验的引用标注 `[L4-法规待核验]`，不得静默放行。

## Word 输出规范（统一）

所有正式 Word 文件统一使用套件脚本 `scripts/md2docx_gbt.py` 生成（GB/T 9704-2012 公文格式）：

```bash
python3 scripts/md2docx_gbt.py input.md output.docx --type gongwen
```

- 先输出 Markdown 供确认，确认后转 Word
- 脚本支持标记：`#`标题、`##`节标题、`|`表格、`>>`右对齐落款、`-`列表
- 文件命名：`{文种/事项}_{日期}.docx`
