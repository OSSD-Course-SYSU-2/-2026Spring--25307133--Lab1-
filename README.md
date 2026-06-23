# 📱 MBTI 职业性格测试应用

基于 HarmonyOS 开发的 MBTI 职业性格测试应用，支持多端部署和自由流转。

## 🎯 功能特性

- **📝 28题MBTI问卷** - 完整的自评式性格测试
- **📊 16种人格分析** - INTJ、INTP、ENTJ、ENTP 等完整类型
- **📱 多端部署** - 一次开发，自动适配手机、平板、折叠屏
- **🔄 自由流转** - 保存答题进度，跨设备继续填写
- **🎨 响应式布局** - 不同屏幕尺寸自动调整字体和间距

## 🛠️ 技术栈

- **开发工具**: DevEco Studio
- **语言**: ArkTS
- **SDK**: API 9+
- **架构**: 单页面应用 + 组件化

## 📁 项目结构
entry/src/main/ets/
├── common/
│ └── BreakpointSystem.ets # 断点系统，多端适配
├── entryability/
│ └── EntryAbility.ets # 应用入口
├── model/
│ └── QuestionnaireModel.ets # 问卷数据模型与MBTI算法
├── pages/
│ ├── QuestionnairePageResponsive.ets # 问卷填写页面
│ └── ResultPageResponsive.ets # 结果展示页面
└── service/
└── ContinuationService.ets # 流转服务

## 🚀 运行方式

1. 使用 DevEco Studio 打开项目
2. 连接 HarmonyOS 设备或启动模拟器
3. 点击 Run 运行

## 📊 MBTI 维度说明

| 维度 | 选项A | 选项B |
|------|-------|-------|
| 精力来源 | E (外向) | I (内向) |
| 信息收集 | N (直觉) | S (实感) |
| 决策方式 | F (情感) | T (思考) |
| 生活态度 | J (判断) | P (感知) |

## 🧩 多端适配

| 设备类型 | 字体大小 | 布局宽度 |
|----------|----------|----------|
| 手机 (sm) | 18px | 90% |
| 平板 (md) | 20px | 80% |
| 折叠屏 (lg) | 24px | 70% |

## 📝 开发日志

- 2026-06-16: 项目初始化，完成基础问卷功能
- 2026-06-20: 集成28题MBTI问卷与16种人格分析
- 2026-06-21: 添加多端部署（响应式布局）
- 2026-06-21: 添加自由流转（进度保存与恢复）
- 2026-06-23: 项目上传至 GitHub

---

**HarmonyOS 应用开发课程项目** 
