# Requirements: Cart Management

> Version: 1.0 (Retrospective)  
> Status: APPROVED  
> Last Updated: March 1, 2026

---

## Problem Statement

**Problem**: Пользователям необходима возможность добавлять товары в корзину, управлять количеством и оформлять заказы в e-commerce приложении.

**Why it matters**:
- Корзина - центральный элемент любого e-commerce приложения
- Пользователи ожидают возможность сохранить корзину между сессиями
- Guest users (неавторизованные) тоже должны иметь корзину
- Синхронизация корзины между устройствами важна для конверсии

---

## User Stories

### Primary

**As a** покупатель  
**I want** добавлять товары в корзину  
**So that** покупать их

**As a** покупатель  
**I want** изменять количество товаров в корзине  
**So that** корректировать заказ

**As a** покупатель  
**I want** удалять товары из корзины  
**So that** отказываться от ненужных товаров

**As a** покупатель  
**I want** видеть общую сумму корзины  
**So that** контролировать бюджет

### Secondary

**As a** guest пользователь  
**I want** иметь корзину без регистрации  
**So that** делать покупки быстрее

**As a** зарегистрированный пользователь  
**I want** чтобы корзина сохранялась между сессиями  
**So that** продолжать покупки позже

---

## Acceptance Criteria

### Must Have

1. **Given** пользователь открыл страницу товара  
   **When** нажал "Add to Cart"  
   **Then** товар добавляется, счетчик корзины обновляется

2. **Given** товар есть в корзине  
   **When** пользователь увеличил количество  
   **Then** количество обновляется, сумма пересчитывается

3. **Given** товар есть в корзине  
   **When** пользователь нажал "Remove"  
   **Then** товар удаляется из корзины

4. **Given** корзина пуста  
   **When** пользователь открыл корзину  
   **Then** показывается сообщение "Cart is empty"

### Should Have

- Guest cart support
- Cart persistence across sessions
- Automatic totals calculation

### Won't Have (This Iteration)

- Discount codes
- Gift cards
- Multiple carts
- Cart sharing

---

## Constraints

### Technical
- Интеграция с Magento 2.x REST API
- Поддержка guest и customer корзин
- Синхронизация при логине

### Performance
- Add to cart < 1 second
- Cart total updates in real-time

---

## Approval

- [x] Reviewed by: AI Assistant (Retrospective)
- [x] Approved on: March 1, 2026
