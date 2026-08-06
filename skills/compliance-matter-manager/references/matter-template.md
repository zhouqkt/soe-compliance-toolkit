# matter-template.md · 事项配置模板

> 事项级配置定义"这个事项用什么口径审查"。由合规事项管家（compliance-matter-manager）建档时生成，
> 优先级：matter.md > enterprise-profile.md > 默认值。

---

## 一、事项基本盘

```yaml
matter_slug:            # 事项编号（如：2026-001）
matter_name:            # 事项名称
matter_type:            # 类型：合同审查 / 贸易核查 / 国资交易 / 合规体检 / 采购审查 / 数据合规 / 劳动用工 / 境外投资 / 制度起草 / 其他
business_owner:         # 业务责任部门
compliance_owner:       # 合规责任人
created_date:           # 建档日期
due_date:               # 完成/整改期限
status:                 # 状态：进行中 / 待整改 / 已整改 / 已关闭
priority:               # 优先级：高 / 中 / 低
```

## 二、事项背景

```yaml
background: |           # 事项背景说明
  - 
related_documents: |    # 关联材料清单
  - 
```

## 三、事项级审查口径（覆盖全局）

```yaml
review_stance:          # 审查口径（从严 / 中性 / 务实），覆盖 enterprise-profile.md
risk_calibration:       # 风险偏好覆盖
focus_points: |         # 本事项重点审查项
  - 
```

## 四、审查结论与整改

```yaml
review_conclusion:      # 审查结论（合规 / 基本合规 / 不合规；绿 / 黄 / 红）
findings: |             # 发现问题清单
  - 
rectification: |        # 整改措施与责任人、时限
  - 
review_date:            # 审查日期
```

## 五、复盘记录

```yaml
reviews: |              # 复盘记录（时间、内容、结果）
  - 
```
