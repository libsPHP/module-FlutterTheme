# 🚀 Flutter Magento Plugin 2.0

用于 Magento 电子商务平台集成的统一 Flutter 库。2.0 版本消除了应用程序之间的代码重复，提供 200+ 功能来构建现代移动商务应用程序。

## 📱 屏幕截图

<div align="center">
  <img src="screenshots/main.jpg" alt="主页" width="250"/>
  <img src="screenshots/login.jpg" alt="登录页面" width="250"/>
  <img src="screenshots/signup.jpg" alt="注册页面" width="250"/>
</div>

<div align="center">
  <img src="screenshots/products.jpg" alt="产品页面" width="250"/>
  <img src="screenshots/cart.jpg" alt="购物车" width="250"/>
  <img src="screenshots/settings.jpg" alt="设置" width="250"/>
</div>

## ✨ 2.0 版本新功能

### 🎯 **统一架构**
- **消除重复**: 所有应用程序使用一个 API
- **模块化结构**: 只使用您需要的组件
- **类型安全**: 使用 Freezed 模型的强类型
- **一致性**: 所有应用程序中的相同方法

### 🔐 **高级身份验证**
- 带自动刷新的 JWT 令牌
- 使用 FlutterSecureStorage 的安全存储
- "记住我"支持
- 自动令牌验证
- 会话过期处理

### 🌐 **统一网络层**
- Dio + HTTP 客户端，带自动重试
- 互联网连接监控
- 自动错误处理
- 调试模式下的请求日志记录
- 响应缓存

### 🌍 **本地化系统**
- **45+ 种语言**开箱即用
- 自动系统区域设置检测
- 复数支持
- 阿拉伯语和希伯来语的 RTL 支持
- 自定义翻译

### 📱 **离线模式**
- 自动数据缓存
- 离线模式的操作队列
- SQLite + Hive 快速访问
- 网络恢复时自动同步
- 可配置的缓存策略

### 🎨 **状态管理**
- Provider + ChangeNotifier 模式
- 所有服务的现成提供程序
- 响应式 UI 更新
- 集中式状态管理

### 🛍️ **扩展电子商务功能**
- 完整的 Magento REST API 集成
- GraphQL 支持复杂查询
- 支持访客用户的购物车
- 多个列表的愿望清单
- 高级搜索和过滤

## 🚀 入门

### 安装

将依赖项添加到您的 `pubspec.yaml`:

```yaml
dependencies:
  flutter_magento: ^2.0.0
```

### 快速开始

```dart
import 'package:flutter_magento/flutter_magento.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MagentoProvider()),
        ChangeNotifierProxyProvider<MagentoProvider, AuthProvider>(
          create: (context) => AuthProvider(context.read<MagentoProvider>().auth),
          update: (context, magentoProvider, previous) => 
              previous ?? AuthProvider(magentoProvider.auth),
        ),
      ],
      child: MyApp(),
    ),
  );
}
```

## 📱 平台支持

- ✅ Android
- ✅ iOS
- ✅ Web
- ✅ Windows
- ✅ macOS
- ✅ Linux

## 🔒 安全功能

- JWT 令牌身份验证
- HTTPS 强制执行
- 输入验证和清理
- 安全令牌存储
- 速率限制支持
- CSRF 保护

## 📊 性能功能

- 请求缓存
- 图像优化
- 延迟加载支持
- 离线模式
- 后台同步
- 内存管理

## 🌍 本地化

此 README 提供多种语言版本：
- [English](README.md)
- [Русский](README_ru.md)
- [ไทย](README_th.md)
- [中文](README_cn.md) (当前)

## 🤝 贡献

1. Fork 仓库
2. 创建功能分支
3. 进行更改
4. 添加测试
5. 提交 pull request

## 📄 许可证

该项目在 MIT 许可证下获得许可 - 有关详细信息，请参阅 [LICENSE](LICENSE) 文件。

## 🆘 支持

- 📧 邮箱: support@nativemind.net
- 🐛 问题: [GitHub Issues](https://github.com/nativemind/flutter_magento/issues)
- 📚 文档: [Wiki](https://github.com/nativemind/flutter_magento/wiki)
- 💬 社区: [Discord](https://discord.gg/nativemind)

## 🙏 致谢

- Magento 团队提供出色的电子商务平台
- Flutter 团队提供令人惊叹的框架
- ScandiPWA 团队提供灵感和最佳实践
- 所有贡献者和社区成员

---

**由 NativeMind 团队用 ❤️ 制作**
