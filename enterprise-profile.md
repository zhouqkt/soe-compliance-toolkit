# enterprise-profile.md · 企业画像

> 由冷启动访谈（enterprise-onboarding）初始写入，用户可随时手工编辑或通过 customize 修改。
> 所有技能执行时读取本文件，实现按企业定制的审查口径。
> 事项级配置（matters/{slug}/matter.md）存在时，其字段覆盖本文件同名字段；优先级：matter.md > enterprise-profile.md > 默认值。

---

## 一、企业基本盘

```yaml
enterprise_name:        # 企业全称
enterprise_type:        # 央企 / 地方国企 / 金融国企 / 事业单位
enterprise_level:       # 层级：一级企业 / 二级企业 / 三级企业 / 上市公司
industry:               # 主要行业（如：供应链贸易、金融、能源、制造）
business_blocks: |      # 业务板块清单
  - 
  - 
parent_company:         # 上级单位（如有）
listed:                 # 是否上市：是 / 否
```

## 二、监管环境

```yaml
supervisor:             # 主管国资监管机构（如：省国资委 / 市国资委 / 集团）
applicable_regulations: |  # 适用监管文件清单
  - 《中央企业合规管理办法》（国资委令第46号）
  - 
specific_rules:         # 地方/行业特殊规定
```

## 三、制度与流程

```yaml
system_documents: |     # 企业现行制度清单
  - 
approval_flow:          # 主要审批流程说明（三重一大、合同审批等）
thresholds: |           # 金额阈值（三重一大、招标、国资交易等）
  - 
```

## 四、审查偏好

```yaml
risk_calibration:       # 风险偏好（一句话：稳健 / 审慎 / 进取）
reporting_style:        # 报告风格（正式 / 简洁 / 详实）
review_stance:          # 审查口径（从严 / 中性 / 务实）
sample_documents:       # 参考文书/报告样本路径
```

## 五、外部能力后端（能力槽映射）

```yaml
LAW.*:                  # 法律检索后端（北大法宝 / 元典 / 暂未配置）
BIZ.*:                  # 工商信息后端（企查查 / 天眼查 / 暂未配置）
SEARCH.*:               # 全网搜索后端
DOCX.*: md2docx_gbt.py  # Word 转换后端（套件内置脚本）
KB.*:                   # 知识库后端（本地目录 / Obsidian / 暂未配置）
```

## 六、排版绑定

```yaml
format_spec_path: format-spec.md   # 排版参数源（可指定 format-spec.<name>.md 派生版）
default_doc_type: gongwen          # 默认 Word 样式：gongwen（公文）/ court（法院文书）
```

---

## 事项级配置（Matter Profile）

事项级配置定义"这个事项用什么口径审查"。

- 路径：`matters/{slug}/matter.md`（由合规事项管家建档时生成，P1 启用）
- 覆盖规则：matter.md 有值字段覆盖本文件同名字段；优先级 matter.md > enterprise-profile.md > 默认值
