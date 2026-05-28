class CartQueries {
  static const cartFragment = '''
    fragment CartFields on Cart {
      id
      total_quantity
      applied_coupons {
        code
      }
      prices {
        subtotal_excluding_tax {
          value
          currency
        }
        applied_taxes {
          amount {
            value
            currency
          }
          label
        }
        discounts {
          amount {
            value
            currency
          }
          label
        }
        grand_total {
          value
          currency
        }
      }
      items {
        uid
        quantity
        product {
          sku
          name
          url_key
          thumbnail {
            url
          }
          stock_status
          only_x_left_in_stock
        }
        prices {
          price {
            value
            currency
          }
          row_total {
            value
            currency
          }
        }
        ... on ConfigurableCartItem {
          configurable_options {
            option_label
            value_label
          }
        }
      }
    }
  ''';

  static const createEmptyCart = '''
    mutation CreateEmptyCart {
      createEmptyCart
    }
  ''';

  static const createGuestCart = '''
    mutation CreateGuestCart {
      createGuestCart {
        cart {
          id
        }
      }
    }
  ''';

  static const customerCart = '''
    query CustomerCart {
      customerCart {
        ...CartFields
      }
    }
    $cartFragment
  ''';

  static const getCart = '''
    query GetCart(\$cartId: String!) {
      cart(cart_id: \$cartId) {
        ...CartFields
      }
    }
    $cartFragment
  ''';

  static const addSimpleProductsToCart = '''
    mutation AddSimpleProductsToCart(\$cartId: String!, \$cartItems: [SimpleProductCartItemInput!]!) {
      addSimpleProductsToCart(
        input: {
          cart_id: \$cartId
          cart_items: \$cartItems
        }
      ) {
        cart {
          ...CartFields
        }
      }
    }
    $cartFragment
  ''';

  static const addConfigurableProductsToCart = '''
    mutation AddConfigurableProductsToCart(\$cartId: String!, \$cartItems: [ConfigurableProductCartItemInput!]!) {
      addConfigurableProductsToCart(
        input: {
          cart_id: \$cartId
          cart_items: \$cartItems
        }
      ) {
        cart {
          ...CartFields
        }
      }
    }
    $cartFragment
  ''';

  static const updateCartItems = '''
    mutation UpdateCartItems(\$cartId: String!, \$cartItems: [CartItemUpdateInput!]!) {
      updateCartItems(
        input: {
          cart_id: \$cartId
          cart_items: \$cartItems
        }
      ) {
        cart {
          ...CartFields
        }
      }
    }
    $cartFragment
  ''';

  static const removeItemFromCart = '''
    mutation RemoveItemFromCart(\$cartId: String!, \$itemUid: ID!) {
      removeItemFromCart(
        input: {
          cart_id: \$cartId
          cart_item_uid: \$itemUid
        }
      ) {
        cart {
          ...CartFields
        }
      }
    }
    $cartFragment
  ''';

  static const applyCouponToCart = '''
    mutation ApplyCouponToCart(\$cartId: String!, \$couponCode: String!) {
      applyCouponToCart(
        input: {
          cart_id: \$cartId
          coupon_code: \$couponCode
        }
      ) {
        cart {
          ...CartFields
        }
      }
    }
    $cartFragment
  ''';

  static const removeCouponFromCart = '''
    mutation RemoveCouponFromCart(\$cartId: String!) {
      removeCouponFromCart(
        input: {
          cart_id: \$cartId
        }
      ) {
        cart {
          ...CartFields
        }
      }
    }
    $cartFragment
  ''';

  static const mergeCarts = '''
    mutation MergeCarts(\$sourceCartId: String!, \$destinationCartId: String!) {
      mergeCarts(
        source_cart_id: \$sourceCartId
        destination_cart_id: \$destinationCartId
      ) {
        ...CartFields
      }
    }
    $cartFragment
  ''';
}
