# Vishakha Devi Styles 🎨

Три уникальных стилевых варианта для NativeMind FlutterTheme, каждый с собственной эстетикой и целевой аудиторией.

## 📋 Обзор вариантов

### Style A - Elegant & Feminine 🌸
**Элегантная женская эстетика**

**Описание:**
- Пастельные тона с dusty rose в качестве основного цвета
- Мягкие градиенты и плавные переходы
- Serif шрифты для заголовков (Playfair Display)
- Золотые акценты для премиальности
- Романтичная и утонченная атмосфера

**Целевая аудитория:**
- Женская одежда премиум-сегмента
- Аксессуары и украшения
- Косметика и парфюмерия
- Свадебные товары
- Товары для дома в классическом стиле

**Цветовая палитра:**
```css
Primary:   #D4A5A5 (Dusty Rose)
Accent:    #C5A3BD (Mauve)
Gold:      #D4AF37 (Gold)
Success:   #A8C5A0 (Soft Green)
```

**Характерные особенности:**
- Скругленные углы (16px border-radius)
- Тени с розовым оттенком
- Плавные анимации (0.4s+)
- Декоративные линии с золотым градиентом
- Кнопки с круглыми краями (30px)

---

### Style B - Modern Minimal ⚫
**Современный минималистичный стиль**

**Описание:**
- Монохромная палитра: черный, белый, серый
- Четкие геометрические формы
- Sans-serif шрифты (Inter)
- Акцент на типографику
- Чистый и профессиональный вид

**Целевая аудитория:**
- Современная городская одежда
- Унисекс fashion
- Технологичные товары
- Минималистичные аксессуары
- Профессиональная одежда

**Цветовая палитра:**
```css
Primary:   #1A1A1A (Rich Black)
Accent:    #C9A66B (Warm Gold)
Success:   #4CAF50 (Clean Green)
```

**Характерные особенности:**
- Прямые углы (0-2px border-radius)
- Строгие границы
- Быстрые переходы (0.2-0.3s)
- Монохромные изображения с эффектом desaturation
- Uppercase текст
- Геометрические кнопки с hover-эффектом заполнения

---

### Style C - Bold & Vibrant 🌈
**Яркий молодежный стиль**

**Описание:**
- Яркие контрастные цвета
- Градиенты и радужные акценты
- Игривая типографика (Poppins, Fredoka One)
- Анимации и интерактивность
- Энергичная и веселая атмосфера

**Целевая аудитория:**
- Молодежная мода
- Спортивная одежда
- Детские товары
- Уличная мода (streetwear)
- Товары для активного образа жизни

**Цветовая палитра:**
```css
Primary:   #FF6B6B (Coral Red)
Accent 1:  #4ECDC4 (Turquoise)
Accent 2:  #FFE66D (Sunny Yellow)
Accent 3:  #FF6BA6 (Hot Pink)
Accent 4:  #9B59B6 (Purple)
```

**Характерные особенности:**
- Большие скругления (24px border-radius)
- Градиентные границы и текст
- Emoji и иконки
- Анимации при hover (масштабирование, вращение)
- Кнопки с round краями (50px)
- Эффект "float" на карточках товаров

---

## 🚀 Как использовать

### Метод 1: Замена основного fallback.css

Выберите нужный стиль и замените основной файл:

```bash
# Style A - Elegant
cp view/frontend/web/css/vishakha-devi-a.css view/frontend/web/css/fallback.css

# Style B - Minimal
cp view/frontend/web/css/vishakha-devi-b.css view/frontend/web/css/fallback.css

# Style C - Vibrant
cp view/frontend/web/css/vishakha-devi-c.css view/frontend/web/css/fallback.css
```

### Метод 2: Подключение в layout XML

В `view/frontend/layout/default.xml`:

```xml
<head>
    <!-- Выберите один из вариантов -->
    
    <!-- Style A -->
    <css src="NativeMind_FlutterTheme::css/vishakha-devi-a.css"/>
    
    <!-- Style B -->
    <css src="NativeMind_FlutterTheme::css/vishakha-devi-b.css"/>
    
    <!-- Style C -->
    <css src="NativeMind_FlutterTheme::css/vishakha-devi-c.css"/>
</head>
```

### Метод 3: Условное подключение через админ-панель

Добавьте в `etc/adminhtml/system.xml`:

```xml
<field id="vishakha_style" translate="label" type="select" sortOrder="50">
    <label>Vishakha Devi Style</label>
    <source_model>NativeMind\FlutterTheme\Model\Config\Source\VishakhaStyle</source_model>
    <comment>Choose design style for fallback version</comment>
</field>
```

## 🎨 Кастомизация

### Изменение цветовой схемы

Отредактируйте CSS переменные в начале файла:

```css
:root {
    /* Измените эти значения на свои */
    --vd-primary: #YOUR_COLOR;
    --vd-accent: #YOUR_COLOR;
    /* ... */
}
```

### Настройка шрифтов

```css
:root {
    --vd-font-heading: 'Your Font', serif;
    --vd-font-body: 'Your Font', sans-serif;
}
```

Не забудьте подключить шрифты в `<head>`:
```html
<link href="https://fonts.googleapis.com/css2?family=Your+Font" rel="stylesheet">
```

## 📊 Сравнительная таблица

| Характеристика | Style A | Style B | Style C |
|---------------|---------|---------|---------|
| Цветовая гамма | Пастель | Монохром | Яркие цвета |
| Border Radius | 16-30px | 0-2px | 24-50px |
| Шрифты | Serif+Sans | Sans | Sans+Display |
| Анимации | Плавные | Быстрые | Динамичные |
| Тени | Мягкие | Четкие | Яркие |
| Целевая аудитория | Женщины 25-45 | Унисекс 25-40 | Молодежь 16-30 |
| Стиль | Романтика | Минимализм | Энергия |
| Премиальность | Высокая | Средняя | Молодежная |

## 🔄 Переключение между стилями

Для тестирования разных стилей без перезагрузки:

```javascript
// В консоли браузера
const styles = [
    '/static/frontend/Vendor/Theme/en_US/NativeMind_FlutterTheme/css/vishakha-devi-a.css',
    '/static/frontend/Vendor/Theme/en_US/NativeMind_FlutterTheme/css/vishakha-devi-b.css',
    '/static/frontend/Vendor/Theme/en_US/NativeMind_FlutterTheme/css/vishakha-devi-c.css'
];

function switchStyle(index) {
    const link = document.querySelector('link[href*="vishakha"]');
    if (link) link.href = styles[index];
}

// Переключение
switchStyle(0); // Style A
switchStyle(1); // Style B
switchStyle(2); // Style C
```

## 💡 Рекомендации по выбору

### Выбирайте Style A если:
- ✅ Продаете женскую одежду или аксессуары
- ✅ Нужна премиальная атмосфера
- ✅ Целевая аудитория ценит элегантность
- ✅ Товары имеют высокую стоимость
- ✅ Важна романтичная эстетика

### Выбирайте Style B если:
- ✅ Нужен универсальный стиль
- ✅ Продукция для мужчин и женщин
- ✅ Акцент на качестве и функциональности
- ✅ Современная городская эстетика
- ✅ Минималистичный подход к дизайну

### Выбирайте Style C если:
- ✅ Молодежная целевая аудитория
- ✅ Спортивная или casual одежда
- ✅ Нужна энергичная атмосфера
- ✅ Интерактивность важна
- ✅ Яркие цвета соответствуют бренду

## 🛠️ Техническая информация

### Поддержка браузеров
- Chrome/Edge 90+
- Firefox 88+
- Safari 14+
- Opera 76+

### CSS Features
- CSS Variables (Custom Properties)
- CSS Grid
- Flexbox
- Gradients
- Transforms & Transitions
- Animations
- `backdrop-filter` (для Style A)

### Размер файлов
- Style A: ~12KB (minified)
- Style B: ~10KB (minified)
- Style C: ~14KB (minified)

### Performance
Все стили оптимизированы для:
- Быстрой загрузки
- Плавной анимации (60fps)
- Минимального reflow
- GPU acceleration

## 📝 Лицензия

MIT License - свободно используйте и модифицируйте под свои нужды.

## 🤝 Поддержка

Вопросы и предложения: contact@nativemind.net

---

**Created with ❤️ by NativeMind**

