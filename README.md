# flutter_study

一个学习flutter的演示项目。

## 项目结构介绍
```
.
├── android                    # 安卓的原生程序
├── ios                        # IOS的原生程序
├── assets                     # 资源文件/字体/图片等
├── test                       # 测试文件                                   
├── lib                        # flutter开发目录
│   ├── main.dart              # flutter的入口文件
│   ├── common                 # 项目级的公共的组件/工具,不仅适用本项目
│   └── ui                     # 页面文件
│       ├── common             # 页面用到的公共的工具，仅适用本项目
│       ├── widgets            # 公共的组件
│       ├── service            # 调用服务端获取数据
│           ├── dao            # 各功能的DAO,获取该功能的相关数据
│           └── model          # 各功能的数据的model,转换成对象,方便使用
│       └── pages              # 项目的各个页面
│           ├──  child         # 各个子功能的页面
│           │       ├──  list # 列表功能的页面
│           └──  login         # 登录页面
└── pubspec.yaml                # flutter的配置文件
```
