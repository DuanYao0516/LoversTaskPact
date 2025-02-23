```
TaskPact/
│
├── frontend/                # 前端代码目录
│   ├── lib/                 # Flutter 应用主目录
│   │   ├── main.dart        # Flutter 应用入口文件
│   │   ├── models/          # 数据模型目录
│   │   │   ├── task_model.dart # 任务数据模型
│   │   │   └── user_model.dart # 用户数据模型
│   │   ├── screens/         # 页面目录
│   │   │   ├── home_screen.dart # 首页
│   │   │   ├── task_list_screen.dart # 任务列表页
│   │   │   └── user_profile_screen.dart # 用户资料页
│   │   ├── widgets/         # 自定义组件目录
│   │   │   ├── task_card.dart # 任务卡片组件
│   │   │   └── user_avatar.dart # 用户头像组件
│   │   ├── services/        # 服务层目录
│   │   │   ├── api_service.dart # API 服务逻辑
│   │   │   └── auth_service.dart # 认证服务逻辑
│   │   └── utils/           # 工具函数目录
│   │       ├── constants.dart # 常量定义
│   │       └── helpers.dart # 辅助函数
│   ├── android/             # Android 项目目录（Flutter 自动生成）
│   ├── ios/                 # iOS 项目目录（Flutter 自动生成）
│   └── pubspec.yaml         # Flutter 项目依赖配置文件
```