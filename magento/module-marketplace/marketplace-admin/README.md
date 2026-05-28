# Marketplace Admin - Microservice

React + TypeScript admin panel for NativeMind Marketplace Magento module.

## Features

- 📊 **Dashboard** - Statistics and charts
- 👥 **Seller Management** - Approve, reject, manage sellers
- 📦 **Product Management** - View and manage products
- ⭐ **Review Management** - Moderate reviews
- 💬 **Message Center** - Customer-seller communication
- 🔍 **Search & Filters** - Find anything quickly
- 📈 **Analytics** - Sales and performance metrics

## Tech Stack

- **React 18** - UI framework
- **TypeScript** - Type safety
- **Vite** - Build tool
- **Tailwind CSS** - Styling
- **Shadcn/ui** - UI components
- **React Query** - Data fetching and caching
- **Recharts** - Charts and graphs
- **React Router** - Navigation

## Prerequisites

- Node.js 18+
- npm or yarn or bun
- Magento 2.4+ with NativeMind_Marketplace module

## Installation

```bash
# Install dependencies
npm install

# or with yarn
yarn install

# or with bun
bun install
```

## Configuration

Edit `vite.config.ts` to set your Magento API URL:

```typescript
server: {
  proxy: {
    '/rest': {
      target: 'https://your-magento-site.com',
      changeOrigin: true,
    },
  },
}
```

## Development

```bash
# Start dev server
npm run dev

# App will be available at http://localhost:3001
```

## Build

```bash
# Build for production
npm run build

# Preview production build
npm run preview
```

## Deployment

### Option 1: Serve with Magento

Copy built files to Magento public directory:

```bash
npm run build
cp -r dist/* ../pub/marketplace-admin/
```

Access at: `https://your-magento-site.com/marketplace-admin/`

### Option 2: Standalone Server

Deploy `dist/` folder to any static hosting:

- Vercel
- Netlify
- AWS S3 + CloudFront
- Nginx
- Apache

### Option 3: Docker

```dockerfile
FROM node:18-alpine as build
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

FROM nginx:alpine
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
```

## Project Structure

```
marketplace-admin/
├── src/
│   ├── components/
│   │   ├── layout/
│   │   │   ├── Layout.tsx
│   │   │   ├── Header.tsx
│   │   │   └── Sidebar.tsx
│   │   ├── dashboard/
│   │   │   ├── Dashboard.tsx
│   │   │   ├── StatsCard.tsx
│   │   │   └── SellerChart.tsx
│   │   ├── sellers/
│   │   │   ├── SellersList.tsx
│   │   │   ├── ApprovalQueue.tsx
│   │   │   └── SellerForm.tsx
│   │   ├── products/
│   │   │   └── ProductsList.tsx
│   │   └── reviews/
│   │       └── ReviewsList.tsx
│   ├── services/
│   │   └── magentoApiService.ts
│   ├── types/
│   │   └── marketplace.ts
│   ├── lib/
│   │   └── utils.ts
│   ├── App.tsx
│   └── main.tsx
├── package.json
├── vite.config.ts
└── tsconfig.json
```

## API Endpoints Used

### Admin Endpoints
- `GET /rest/V1/marketplace/admin/stats` - Get statistics
- `GET /rest/V1/marketplace/admin/sellers/pending` - Get pending sellers
- `POST /rest/V1/marketplace/admin/sellers/:id/approve` - Approve seller
- `POST /rest/V1/marketplace/admin/sellers/:id/reject` - Reject seller
- `POST /rest/V1/marketplace/admin/sellers/bulk-approve` - Bulk approve
- `POST /rest/V1/marketplace/admin/sellers/bulk-reject` - Bulk reject

### Standard Endpoints
- `GET /rest/V1/marketplace/sellers` - Get all sellers
- `GET /rest/V1/marketplace/products` - Get all products
- `GET /rest/V1/marketplace/reviews` - Get all reviews

## Authentication

Uses Magento admin token authentication:

```typescript
// Login
const token = await magentoApi.login('admin_username', 'admin_password')
localStorage.setItem('admin_token', token)
```

## Environment Variables

Create `.env.local`:

```env
VITE_MAGENTO_URL=https://your-magento-site.com
VITE_API_TIMEOUT=30000
```

## Features Checklist

- [x] Dashboard with statistics
- [x] Seller approval queue
- [x] Bulk operations
- [x] Product list
- [x] Review management
- [ ] Seller form (create/edit)
- [ ] Product form
- [ ] Advanced search
- [ ] Export functionality
- [ ] Email notifications
- [ ] Activity log viewer
- [ ] Configuration panel

## Troubleshooting

### CORS Errors

Ensure CORS plugin is enabled in Magento module.

### API 401 Errors

Check admin token is valid and not expired.

### Build Errors

Clear node_modules and reinstall:

```bash
rm -rf node_modules package-lock.json
npm install
```

## License

NativeMindNONC License

## Support

For issues, open a ticket on GitLab.

