# Fastlane for Flutter Magento Marketplace Example

This directory contains fastlane configuration for automating the release process of the marketplace example app.

## Setup

### 1. Install fastlane

```bash
# Using RubyGems
sudo gem install fastlane -NV

# Or using Homebrew
brew install fastlane
```

### 2. Configure Appfile

Edit `Appfile` and set your:
- `app_identifier` - Your app's bundle ID
- `apple_id` - Your Apple ID email
- `itc_team_id` - App Store Connect Team ID  
- `team_id` - Developer Portal Team ID

### 3. Install dependencies

```bash
cd ios
bundle install
fastlane update_fastlane
```

## Available Lanes

### iOS

#### TestFlight Beta Release
```bash
fastlane ios beta
```
- Builds the app
- Increments build number
- Uploads to TestFlight
- Creates git tag

#### App Store Release
```bash
fastlane ios release
```
- Builds for production
- Uploads to App Store
- Submits metadata and screenshots
- Creates git tag

#### Build Debug
```bash
fastlane ios build_debug
```
- Builds debug version for testing

#### Run Tests
```bash
fastlane ios test
```
- Runs unit and UI tests

#### Screenshots
```bash
fastlane ios screenshots
```
- Takes screenshots for App Store

### Android

#### Play Store Internal Testing
```bash
fastlane android beta
```
- Builds AAB bundle
- Uploads to Play Console (internal track)
- Creates git tag

#### Play Store Production
```bash
fastlane android release
```
- Builds production AAB
- Uploads to Play Store
- Includes metadata and screenshots

#### Build APK
```bash
fastlane android build_apk
```
- Builds release APK for manual distribution

## Workflow

### TestFlight Release

1. Ensure code is ready and tested
2. Update version in `pubspec.yaml`
3. Run fastlane:
```bash
cd ios
fastlane beta
```
4. Check TestFlight for the new build
5. Add release notes in App Store Connect
6. Submit for review

### Production Release

1. Complete TestFlight testing
2. Update CHANGELOG.md
3. Run production lane:
```bash
cd ios
fastlane release
```
4. Monitor App Store Connect for processing
5. Submit for App Store review

## Configuration Files

- `Fastfile` - Lane definitions
- `Appfile` - App credentials
- `Deliverfile` - Metadata configuration
- `Snapfile` - Screenshot automation

## Environment Variables

You can set these in `.env` file:

```env
FASTLANE_USER=your-apple-id@example.com
FASTLANE_PASSWORD=your-password
FASTLANE_APPLE_APPLICATION_SPECIFIC_PASSWORD=app-specific-password
FASTLANE_TEAM_ID=your-team-id
```

## Tips

- Use `--verbose` flag for detailed output
- Test with `--dry_run` before actual releases
- Keep credentials secure (use `.env` file, not version control)
- Review generated IPA/AAB before uploading

## Troubleshooting

### Code Signing Issues
```bash
fastlane match development
fastlane match appstore
```

### Build Failures
```bash
# Clean Flutter build
flutter clean
flutter pub get

# Clean Xcode
cd ios
xcodebuild clean
```

### Certificate Issues
```bash
# Refresh certificates
fastlane match nuke development
fastlane match nuke distribution
```

## Documentation

- [Fastlane Docs](https://docs.fastlane.tools)
- [Flutter + Fastlane](https://docs.fastlane.tools/getting-started/cross-platform/flutter/)
- [App Store Distribution](https://developer.apple.com/documentation/xcode/distributing-your-app-for-beta-testing-and-releases)

## Support

For issues specific to this marketplace example, contact:
- 📧 contact@nativemind.net
- 🐛 GitLab Issues

---

**Note**: Before first use, configure your Apple Developer account and App Store Connect properly.

