class ProductQueries {
  static const productSummaryFragment = '''
    fragment ProductSummaryFields on ProductInterface {
      id
      sku
      name
      thumbnail {
        url
        label
      }
      price_range {
        minimum_price {
          regular_price {
            value
            currency
          }
          final_price {
            value
            currency
          }
        }
      }
      stock_status
      review_count
      rating_summary
      __typename
    }
  ''';

  static const search = '''
    $productSummaryFragment

    query SearchProducts(
      \$search: String,
      \$filter: ProductAttributeFilterInput,
      \$sort: ProductAttributeSortInput,
      \$pageSize: Int!,
      \$currentPage: Int!
    ) {
      products(
        search: \$search,
        filter: \$filter,
        sort: \$sort,
        pageSize: \$pageSize,
        currentPage: \$currentPage
      ) {
        items {
          ...ProductSummaryFields
        }
        total_count
        page_info {
          current_page
          page_size
          total_pages
        }
        aggregations {
          attribute_code
          label
          options {
            label
            value
            count
          }
        }
      }
    }
  ''';

  static const productById = '''
    query GetProductById(\$id: Int!) {
      products(filter: { id: { eq: \$id } }) {
        items {
          id
          sku
          name
          url_key
          description { html }
          short_description { html }
          meta_title
          meta_description
          price_range {
            minimum_price {
              regular_price { value currency }
              final_price { value currency }
            }
            maximum_price {
              regular_price { value currency }
              final_price { value currency }
            }
          }
          media_gallery { url label position disabled }
          stock_status
          review_count
          rating_summary
          __typename
          ... on ConfigurableProduct {
            configurable_options {
              attribute_uid
              attribute_code
              label
              values { uid label swatch_data { value } }
            }
            variants {
              product { sku stock_status price_range { minimum_price { final_price { value currency } } } }
              attributes { code label value_index }
            }
          }
          related_products { id sku name thumbnail { url } price_range { minimum_price { final_price { value currency } } } stock_status __typename }
        }
      }
    }
  ''';

  static const productDetails = '''
    query GetProductDetails(\$sku: String!) {
      products(filter: { sku: { eq: \$sku } }) {
        items {
          id
          sku
          name
          description {
            html
          }
          short_description {
            html
          }
          url_key
          meta_title
          meta_description
          price_range {
            minimum_price {
              regular_price { value currency }
              final_price { value currency }
            }
            maximum_price {
              regular_price { value currency }
              final_price { value currency }
            }
          }
          media_gallery {
            url
            label
            position
            disabled
          }
          stock_status
          review_count
          rating_summary
          __typename
          ... on ConfigurableProduct {
            configurable_options {
              attribute_code
              label
              values {
                uid
                label
                swatch_data {
                  value
                  ... on ImageSwatchData { thumbnail }
                  ... on ColorSwatchData { value }
                }
              }
            }
            variants {
              product {
                sku
                stock_status
                price_range {
                  minimum_price {
                    final_price { value currency }
                  }
                }
              }
              attributes {
                code
                label
                value_index
              }
            }
          }
          ... on BundleProduct {
            items {
              uid
              title
              required
              type
              options {
                uid
                label
                quantity
                price
                is_default
              }
            }
          }
          ... on GroupedProduct {
            items {
              qty
              position
              product {
                id
                sku
                name
                price_range {
                  minimum_price {
                    final_price { value currency }
                  }
                }
                stock_status
                __typename
              }
            }
          }
          related_products {
            id sku name
            thumbnail { url }
            price_range {
              minimum_price {
                final_price { value currency }
              }
            }
            stock_status
            __typename
          }
          upsell_products {
            id sku name
            thumbnail { url }
            price_range {
              minimum_price {
                final_price { value currency }
              }
            }
            stock_status
            __typename
          }
          crosssell_products {
            id sku name
            thumbnail { url }
            price_range {
              minimum_price {
                final_price { value currency }
              }
            }
            stock_status
            __typename
          }
        }
      }
    }
  ''';
}
