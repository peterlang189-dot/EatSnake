# EatSnake

EatSnake 是一个 SwiftUI iOS 贪吃蛇 App 工程，同时保留可测试的词库核心模块。当前版本包含：

- 贪吃蛇棋盘、方向控制、开始/暂停、重开、分数和最佳分
- 贪吃蛇核心规则测试：吃食物、增长、撞墙、撞身体、禁止反向
- 内置 TOEIC 商务、办公、差旅、财务和客服场景词库
- 单词卡片学习流程
- 显示释义和例句翻译
- “认识 / 不认识”反馈
- 基于熟悉度和难度的复习间隔
- 本地 JSON 学习进度持久化
- 今日学习进度和掌握数量
- Swift Testing 自动化单元测试
- XCUITest UI 自动化测试示例

## 目录

- `Sources/WordWiseCore`: 可测试的核心模型、复习算法、进度存储
- `Sources/WordWiseCore/SnakeGame.swift`: 贪吃蛇核心规则
- `Sources/WordWiseCore/TOEICVocabulary.swift`: TOEIC 词库数据
- `Tests/WordWiseCoreTests`: Swift Testing 单元测试
- `App/WordWiseApp`: SwiftUI iOS App 源码
- `App/WordWiseAppUITests`: XCUITest 示例
- `project.yml`: XcodeGen 项目描述

## 运行单元测试

```bash
swift test --scratch-path .build
```

## 在 Xcode 中运行 App

当前仓库提供 `project.yml`，安装 XcodeGen 后生成 Xcode 项目：

```bash
xcodegen generate
open WordWise.xcodeproj
```

然后选择 `WordWiseApp` scheme，在 iOS 17+ 模拟器运行。

## 运行 UI 测试

在完整 Xcode 环境中：

```bash
xcodebuild test \
  -project WordWise.xcodeproj \
  -scheme WordWiseApp \
  -destination 'platform=iOS Simulator,name=iPhone 16'
```
