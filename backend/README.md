```
TaskPact/
│
├── backend/                 # 后端代码目录
│   ├── app/                 # Flask 应用主目录
│   │   ├── __init__.py      # Flask 应用初始化文件
│   │   ├── models/          # 数据库模型目录
│   │   │   ├── __init__.py  # 模型初始化文件
│   │   │   ├── task.py      # 任务模型定义
│   │   │   └── user.py      # 用户模型定义
│   │   ├── routes/          # 路由目录
│   │   │   ├── __init__.py  # 路由初始化文件
│   │   │   ├── task_routes.py # 任务相关路由
│   │   │   └── user_routes.py # 用户相关路由
│   │   ├── services/        # 服务层目录
│   │   │   ├── __init__.py  # 服务初始化文件
│   │   │   ├── task_service.py # 任务服务逻辑
│   │   │   └── user_service.py # 用户服务逻辑
│   │   ├── utils/           # 工具函数目录
│   │   │   ├── __init__.py  # 工具初始化文件
│   │   │   └── helpers.py   # 辅助函数
│   │   └── config.py        # 配置文件
│   ├── migrations/          # 数据库迁移目录（使用 Flask-Migrate）
│   ├── tests/               # 测试目录
│   │   ├── __init__.py      # 测试初始化文件
│   │   ├── test_task_routes.py # 任务路由测试
│   │   └── test_user_routes.py # 用户路由测试
│   └── run.py               # 后端启动文件
```