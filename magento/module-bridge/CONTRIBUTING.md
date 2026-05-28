# Contributing to NativeMind FlutterTheme

Thank you for considering contributing to FlutterTheme! This document outlines the process and guidelines.

## 🤝 How to Contribute

### Reporting Bugs

If you find a bug, please create an issue with:

- **Clear title** describing the bug
- **Steps to reproduce** the issue
- **Expected behavior** vs actual behavior
- **Environment details** (Magento version, PHP version, browser)
- **Screenshots or logs** if applicable

### Suggesting Features

For feature requests:

- **Describe the feature** and its use case
- **Explain why** it would be useful
- **Provide examples** if possible

### Pull Requests

1. **Fork** the repository
2. **Create a branch** for your feature/fix
   ```bash
   git checkout -b feature/your-feature-name
   ```
3. **Make your changes** following our coding standards
4. **Test thoroughly** on a clean Magento installation
5. **Commit** with clear messages
   ```bash
   git commit -m "Add: Description of your changes"
   ```
6. **Push** to your fork
   ```bash
   git push origin feature/your-feature-name
   ```
7. **Create a Pull Request** with detailed description

## 📝 Coding Standards

### PHP Code

Follow Magento 2 coding standards:

```php
<?php
/**
 * Short description
 *
 * @category    NativeMind
 * @package     NativeMind_FlutterTheme
 */

namespace NativeMind\FlutterTheme\Block;

class YourClass
{
    /**
     * Method description
     *
     * @param string $param
     * @return bool
     */
    public function yourMethod(string $param): bool
    {
        // Code here
    }
}
```

### JavaScript

Use ES6+ standards:

```javascript
/**
 * Function description
 */
function yourFunction() {
    // Use const/let instead of var
    const variable = 'value';
    
    // Use arrow functions
    const callback = () => {
        // Code here
    };
}
```

### CSS

Use modern CSS with clear naming:

```css
/* Component: Component name */
.component-name {
    property: value;
}

.component-name__element {
    property: value;
}

.component-name--modifier {
    property: value;
}
```

## 🧪 Testing

Before submitting:

1. **Install module** on clean Magento 2.4+
2. **Test basic functionality:**
   - Module installs without errors
   - Admin configuration works
   - Flutter version loads correctly
   - Fallback version works
   - Crawler detection works
3. **Test on multiple browsers:**
   - Chrome
   - Firefox
   - Safari
   - Edge
4. **Verify SEO:**
   - Structured data is valid
   - HTML fallback is complete
   - Meta tags are correct

## 📚 Documentation

When adding features:

- Update **README.md** with new configuration/usage
- Add entries to **CHANGELOG.md**
- Update **INSTALL.md** if installation changes
- Add inline code comments for complex logic
- Update admin config descriptions

## 🔍 Code Review

Your PR will be reviewed for:

- **Code quality** and standards compliance
- **Functionality** and testing
- **Performance** impact
- **Security** considerations
- **Documentation** completeness
- **Backward compatibility**

## 💡 Development Tips

### Local Development Setup

```bash
# Clone your fork
git clone https://github.com/your-username/module-flutter-theme.git

# Create development branch
git checkout -b develop

# Link to Magento installation
ln -s $(pwd) /path/to/magento/app/code/NativeMind/FlutterTheme

# Enable module
cd /path/to/magento
php bin/magento module:enable NativeMind_FlutterTheme
php bin/magento setup:upgrade
```

### Testing Changes

```bash
# Clear cache after changes
php bin/magento cache:flush

# Redeploy static content
php bin/magento setup:static-content:deploy -f

# Check for PHP errors
php bin/magento dev:profiler:enable
```

### Debugging

Enable developer mode:
```bash
php bin/magento deploy:mode:set developer
```

Check logs:
```bash
tail -f var/log/system.log
tail -f var/log/exception.log
```

## 🎨 Feature Development Guidelines

### Adding New Detection Rules

Extend `Helper/Data.php`:

```php
protected const CRAWLER_PATTERNS = [
    'googlebot',
    'your-new-bot',  // Add here
];
```

### Adding New Configuration Options

1. Add to `etc/config.xml` (default values)
2. Add to `etc/adminhtml/system.xml` (admin fields)
3. Add getter method in `Helper/DataInterface.php`
4. Implement in `Helper/Data.php`

### Adding New Templates

1. Create template in `view/frontend/templates/`
2. Add block class in `Block/`
3. Register in layout XML `view/frontend/layout/`
4. Add CSS in `view/frontend/web/css/`

## 🔐 Security

- **Never commit** sensitive data (API keys, passwords)
- **Validate and escape** all user input
- **Use prepared statements** for database queries
- **Follow OWASP** security guidelines
- Report security issues privately to contact@nativemind.net

## 📜 License

By contributing, you agree that your contributions will be licensed under the MIT License.

## 🙏 Recognition

Contributors will be:

- Listed in CHANGELOG.md
- Credited in release notes
- Added to contributors list

## 📞 Questions?

- **Email:** contact@nativemind.net
- **Discussion:** Use GitHub Discussions
- **Chat:** Join our community (link in README)

---

Thank you for making FlutterTheme better! 🎉

