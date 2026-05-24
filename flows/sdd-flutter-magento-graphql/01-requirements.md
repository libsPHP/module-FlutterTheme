# Requirements: flutter_magento_graphql

> Version: 1.0
> Status: APPROVED
> Last Updated: 2026-05-24

## Problem Statement

Magento 2 / Adobe Commerce provides a comprehensive GraphQL API that is more efficient than REST for mobile apps. Flutter developers need a transport implementation that handles GraphQL specifics: batching, fragments, error parsing, and Magento-specific headers.

## User Stories

### Primary

**As a** Flutter developer
**I want** a GraphQL transport implementing `MagentoTransport`
**So that** I can use Magento's GraphQL API without writing raw queries

**As a** Flutter developer
**I want** automatic header injection for store context
**So that** multi-store requests work correctly

**As a** Flutter developer
**I want** proper GraphQL error parsing
**So that** Magento-specific errors become typed `MagentoException`s

### Secondary

**As a** Flutter developer
**I want** query caching support
**So that** I can reduce network calls for repeated queries

**As a** Flutter developer
**I want** persisted queries support
**So that** I can optimize production performance

## Acceptance Criteria

### Must Have

1. **Given** a Magento GraphQL endpoint
   **When** `GraphQlMagentoTransport` is configured
   **Then** it implements full `MagentoTransport` interface

2. **Given** `MagentoStoreContext` with store/currency/locale
   **When** any GraphQL request is made
   **Then** proper headers (Store, Content-Currency, Accept-Language) are included

3. **Given** GraphQL returns errors array
   **When** response is parsed
   **Then** errors are mapped to appropriate `MagentoException` types

4. **Given** customer is authenticated
   **When** token is in `MagentoAuthStorage`
   **Then** Authorization header is automatically included

### Should Have

- Query batching for multiple simultaneous requests
- Response caching with configurable TTL
- Logging decorator for debugging

### Won't Have (This Iteration)

- WebSocket subscriptions
- File uploads via GraphQL multipart
- Automatic query generation (use explicit queries)

## Constraints

- **Technical**: Must depend only on flutter_magento_core + graphql_flutter or gql
- **Platform**: Support all Flutter platforms
- **Dependencies**: Use established GraphQL client library

## Open Questions

- [x] Use graphql_flutter or ferry? → Use graphql package (no Flutter dependency in core)

## References

- Magento GraphQL documentation
- flutter_magento_core transport interface
