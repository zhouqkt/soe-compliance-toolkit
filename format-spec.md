# format-spec.md · 排版参数源（单一权威源）

> 本文件是套件 Markdown→Word 统一排版生成器 `scripts/md2docx_gbt.py` 的参数源。
> 所有正式 Word 文件按本文件参数渲染；用户可编辑本文件或复制为 `format-spec.<name>.md` 派生版本，
> 并在 `enterprise-profile.md` 的 `format_spec_path` 字段指向所需版本。
>
> 脚本按 section（## 样式名）读取参数；每行格式：`键: 值`。
> 未识别键忽略；缺失键回退脚本内置默认值。

---

## gongwen

> GB/T 9704-2012 公文格式（默认）

| 参数 | 值 |
|------|-----|
| title_font | FZXiaoBiaoSong-B05S |
| title_size | 22 |
| title_bold | false |
| h1_font | SimHei |
| h2_font | KaiTi_GB2312 |
| body_font | FangSong_GB2312 |
| body_size | 16 |
| body_line | 28 |
| table_size | 12 |
| margin_top | 3.7 |
| margin_bottom | 3.5 |
| margin_left | 2.8 |
| margin_right | 2.6 |

---

## court

> 最高人民法院诉讼文书样式（通用版）

| 参数 | 值 |
|------|-----|
| title_font | SimSun |
| title_size | 22 |
| title_bold | false |
| h1_font | SimSun |
| h2_font | SimSun |
| body_font | SimSun |
| body_size | 14 |
| body_line | 25 |
| table_size | 10.5 |
| margin_top | 2.54 |
| margin_bottom | 2.54 |
| margin_left | 3.17 |
| margin_right | 3.17 |

---

## 说明

- `body_line` 为固定行距（磅）；`margin_*` 单位为 cm；`*_size` 单位为 pt；`title_bold` 为 true/false
- 脚本解析示例：
  ```bash
  python3 scripts/md2docx_gbt.py input.md output.docx --type gongwen
  python3 scripts/md2docx_gbt.py input.md output.docx --type court
  ```
