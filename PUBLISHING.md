# Publishing to Packagist

This guide explains how to publish the NativeMind FlutterTheme module to Packagist.

## ✅ Prerequisites Completed

- ✅ Git repository created: `git@github.com:libsPHP/module-FlutterTheme.git`
- ✅ Initial commit pushed
- ✅ Version tag created: `v1.0.0`
- ✅ Tag pushed to GitHub
- ✅ composer.json configured with correct package name: `nativemind/module-flutter-theme`

## 🚀 Publishing Steps

### 1. Access Packagist

Go to: https://packagist.org/

### 2. Login/Register

- If you have an account, login
- If not, register a new account

### 3. Submit Package

1. Click **"Submit"** button (top right)
2. Enter repository URL:
   ```
   https://github.com/libsPHP/module-FlutterTheme
   ```
3. Click **"Check"** button
4. Packagist will validate the repository and composer.json
5. Click **"Submit"** to complete

### 4. Setup Auto-Update (Recommended)

To automatically update package on new releases:

1. Go to your package page on Packagist
2. Click **"Update"** button
3. Follow instructions to setup GitHub webhook

#### GitHub Webhook Setup:

1. Go to: https://github.com/libsPHP/module-FlutterTheme/settings/hooks
2. Click **"Add webhook"**
3. Enter Payload URL from Packagist (e.g., `https://packagist.org/api/github?username=YOUR_USERNAME`)
4. Set Content type: `application/json`
5. Select: "Just the push event"
6. Click **"Add webhook"**

## 📦 Installation After Publishing

Once published, users can install with:

```bash
composer require nativemind/module-flutter-theme
```

Or add to composer.json:

```json
{
    "require": {
        "nativemind/module-flutter-theme": "^1.0"
    }
}
```

## 🔄 Releasing New Versions

### Semantic Versioning

Follow [Semver](https://semver.org/):
- **MAJOR** (1.x.x) - Breaking changes
- **MINOR** (x.1.x) - New features, backward compatible
- **PATCH** (x.x.1) - Bug fixes, backward compatible

### Release Process

1. **Update CHANGELOG.md** with changes
   ```bash
   vim CHANGELOG.md
   ```

2. **Update version in composer.json** (optional, tag is primary)
   ```json
   {
       "version": "1.1.0"
   }
   ```

3. **Commit changes**
   ```bash
   git add .
   git commit -m "Release version 1.1.0"
   ```

4. **Create and push tag**
   ```bash
   git tag -a v1.1.0 -m "Version 1.1.0 - Description of changes"
   git push origin main
   git push origin v1.1.0
   ```

5. **Packagist will auto-update** (if webhook is setup)

### Manual Update on Packagist

If webhook is not setup:
1. Go to package page: https://packagist.org/packages/nativemind/module-flutter-theme
2. Click **"Update"** button

## 📊 Package Statistics

After publishing, you can see:
- Download statistics
- Dependent packages
- GitHub stars
- Issues

View at: https://packagist.org/packages/nativemind/module-flutter-theme

## 🏷️ Package Badges

Add to README.md:

```markdown
[![Latest Stable Version](https://poser.pugx.org/nativemind/module-flutter-theme/v/stable)](https://packagist.org/packages/nativemind/module-flutter-theme)
[![Total Downloads](https://poser.pugx.org/nativemind/module-flutter-theme/downloads)](https://packagist.org/packages/nativemind/module-flutter-theme)
[![License](https://poser.pugx.org/nativemind/module-flutter-theme/license)](https://packagist.org/packages/nativemind/module-flutter-theme)
```

## 📝 composer.json Validation

Before publishing, validate:

```bash
composer validate
```

Output should be:
```
./composer.json is valid
```

## 🔍 Package Information

- **Name:** nativemind/module-flutter-theme
- **Type:** magento2-module
- **License:** MIT
- **Repository:** https://github.com/libsPHP/module-FlutterTheme
- **Version:** 1.0.0

## ⚠️ Important Notes

1. **Package name** cannot be changed after publishing
2. **Tags** cannot be deleted from Packagist (only hidden)
3. **Always test** locally before creating release tags
4. **Keep CHANGELOG.md** updated for users
5. **Use semantic versioning** for compatibility

## 🔗 Useful Links

- Packagist: https://packagist.org/
- Package page: https://packagist.org/packages/nativemind/module-flutter-theme
- GitHub repo: https://github.com/libsPHP/module-FlutterTheme
- Semver: https://semver.org/
- Composer docs: https://getcomposer.org/doc/

## ✅ Current Status

- [x] Repository created on GitHub
- [x] composer.json configured
- [x] Initial release committed
- [x] Version 1.0.0 tagged
- [x] Code pushed to GitHub
- [ ] **TODO: Submit to Packagist** - Complete step 3 above
- [ ] **TODO: Setup GitHub webhook** - Complete step 4 above

---

After completing the TODO items above, the package will be live on Packagist! 🎉

