# Authentication & Authorization

> Client-Facing Documentation  
> Last Updated: March 1, 2026  
> Version: 1.0

---

## What This Feature Does

The Authentication system allows users to securely log in to their Magento store account, register new accounts, and stay logged in across app sessions. It handles all security tokens automatically so users don't have to worry about sessions expiring during shopping.

**Key Benefits**:
- Secure login with email and password
- Stay logged in automatically (Remember Me)
- New users can register directly in the app
- Automatic session refresh - no interruptions while shopping

---

## How It Works

**In Simple Terms:**

Think of authentication like a hotel key card system:

1. **Login** = Getting your room key at check-in
   - You show your ID (email/password)
   - Front desk verifies and gives you a key card (token)
   - Key card works for your stay (session)

2. **Token Refresh** = Extending your hotel stay
   - Before your key expires, system automatically extends it
   - You don't need to go back to front desk
   - Your stay continues uninterrupted

3. **Remember Me** = Hotel remembers your preferences
   - Next visit, you're recognized as a returning guest
   - No need to show ID again
   - You're already checked in

4. **Logout** = Checking out
   - You return your key card
   - Room is secured
   - Next guest needs their own key

---

## Key Benefits

- **🔐 Secure Storage**: Your login tokens are encrypted and stored safely on your device
- **⚡ Auto-Refresh**: Sessions renew automatically - no sudden logouts during checkout
- **💾 Remember Me**: Stay logged in across app restarts on trusted devices
- **🆕 Easy Registration**: Create account in seconds without leaving the app
- **📱 Works Everywhere**: Same login works on iOS, Android, Web, and desktop

---

## Quick Example

### Example Scenario: First Time Login

**Goal**: Log in to your existing Magento store account

**Steps**:
1. Open the app and tap "Login"
2. Enter your email: `your@email.com`
3. Enter your password
4. Toggle "Remember Me" if you want to stay logged in
5. Tap "Sign In"

**Result**: You're logged in! Your account data, cart, and orders are now accessible.

---

### Example Scenario: New User Registration

**Goal**: Create a new account

**Steps**:
1. Tap "Register" on login screen
2. Fill in:
   - Email address
   - Password (min 8 characters)
   - First Name
   - Last Name
3. Tap "Create Account"

**Result**: Account created! You're automatically logged in and ready to shop.

---

### Example Scenario: Stay Logged In

**Goal**: Enable automatic login on app restart

**Steps**:
1. On login screen, toggle "Remember Me" ON
2. Login with your credentials
3. Close the app completely
4. Reopen the app later

**Result**: You're still logged in! No need to enter password again.

---

## Common Questions

### Is my password stored on my device?
**No!** Only encrypted security tokens are stored. Your actual password is only sent to Magento's secure server during login.

### What happens if I forget to logout on a public device?
For security, always logout on public/shared devices. If you forget, you can remotely logout from all sessions in your account settings on the Magento website.

### How long does a login session last?
Sessions typically last 24 hours, but the app automatically refreshes your token before it expires, so you stay logged in seamlessly.

### Can I be logged in on multiple devices?
Yes! You can be logged in on your phone, tablet, and computer simultaneously. Each device has its own secure token.

### What if I get a "Token Expired" error?
This is rare, but if it happens:
1. Don't worry - your data is safe
2. Simply login again with your credentials
3. If using "Remember Me", this shouldn't happen

### Is my payment information stored?
No. Authentication only handles your login session. Payment information is processed separately through Magento's secure payment gateways.

---

## Error Messages Explained

| Message | What It Means | What To Do |
|---------|---------------|------------|
| "Invalid email or password" | Credentials don't match | Check spelling, reset password if needed |
| "No internet connection" | Device is offline | Connect to WiFi/cellular and retry |
| "Account is locked" | Too many failed attempts | Wait 30 minutes or contact support |
| "Network error" | Server unreachable | Check connection, try again later |

---

## Security Tips

✅ **DO**:
- Enable "Remember Me" only on your personal devices
- Use a strong, unique password
- Logout from public/shared devices
- Update your password regularly

❌ **DON'T**:
- Share your password with anyone
- Use the same password as other sites
- Stay logged in on public computers
- Ignore "suspicious activity" warnings

---

## Getting Started

### First Time Setup:

1. **Download** the app from your app store
2. **Open** the app
3. **Choose**:
   - "Login" if you have an account
   - "Register" if you're new
4. **Enter** your details
5. **Start** shopping!

### Quick Tips:
- Toggle "Remember Me" for automatic login
- Access your profile from the bottom navigation
- View orders in the Profile tab
- Logout in Settings when needed

---

## What's Next

**Future Enhancements** (planned):
- 🍎 Biometric login (Face ID, Touch ID)
- 🔐 Two-factor authentication
- 🌐 Social login (Google, Facebook, Apple)
- 📧 Password reset via email

---

## Need Help?

### Common Issues:

**Can't remember password?**
→ Use "Forgot Password" on the Magento website to reset

**Account locked?**
→ Wait 30 minutes or contact store support

**Login not working?**
→ Check internet connection, verify credentials, try again

### Contact Support:
- Email: support@yourstore.com
- Phone: 1-800-STORE-HELP
- Hours: Mon-Fri 9AM-6PM EST

---

**Note for Users**: This documentation focuses on practical usage. For technical implementation details, see the development documentation in `04-implementation-log.md`.

---

**Last Updated**: March 1, 2026  
**Version**: 1.0  
**Platform**: Flutter Magento v4.4.0
