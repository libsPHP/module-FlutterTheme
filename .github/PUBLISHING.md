# Publishing to pub.dev

## Setup

### 1. Get pub.dev credentials

Run locally:
```bash
dart pub login
```

After authenticating, find your credentials file:
- **Linux/macOS**: `~/.config/dart/pub-credentials.json`
- **Windows**: `%APPDATA%\dart\pub-credentials.json`

### 2. Add GitHub Secret

1. Go to your repository → Settings → Secrets and variables → Actions
2. Click "New repository secret"
3. Name: `PUB_CREDENTIALS`
4. Value: Paste the entire contents of `pub-credentials.json`

Example content:
```json
{
  "accessToken": "ya29.xxx",
  "refreshToken": "1//xxx",
  "tokenEndpoint": "https://accounts.google.com/o/oauth2/token",
  "scopes": ["openid", "https://www.googleapis.com/auth/userinfo.email"],
  "expiration": 1234567890000
}
```

## Workflows

### Manual Publish (`publish.yml`)

Triggered by:
- Push tag `v*` (e.g., `v1.0.0`)
- Manual workflow dispatch

Options:
- `packages`: Comma-separated list or "all"
- `dry_run`: Test without publishing

### Auto Publish on Change (`publish-on-change.yml`)

Automatically publishes packages when their `pubspec.yaml` version changes on push to main/master.

## Publishing Order

Packages are published in dependency order:

```
1. flutter_magento_core (no deps)
   │
   ├─→ 2a. flutter_magento_catalog
   ├─→ 2b. flutter_magento_auth
   ├─→ 2c. flutter_magento_cart
   ├─→ 2d. flutter_magento_profile
   ├─→ 2e. flutter_magento_localizations
   ├─→ 2f. flutter_magento_offline
   ├─→ 2g. flutter_magento_blockchain
   │
   ├─→ 3. flutter_magento_ui (needs localizations)
   ├─→ 4. flutter_magento_marketplace (needs catalog, cart)
   ├─→ 5. flutter_magento_riverpod (needs auth, catalog, cart, profile)
   │
   └─→ 6. flutter_magento (umbrella, needs all)
```

## Troubleshooting

### "Version already exists"
The package version is already on pub.dev. Bump the version in `pubspec.yaml`.

### "Token expired"
Re-run `dart pub login` and update the `PUB_CREDENTIALS` secret.

### "Package not found"
Wait 1-2 minutes after publishing a dependency. pub.dev indexing takes time.

## Version Bump Script

```bash
# Bump patch version for a package
cd packages/flutter_magento_core
# Edit pubspec.yaml version
# Update CHANGELOG.md
git add .
git commit -m "chore(core): bump to 1.0.1"
git push
```
