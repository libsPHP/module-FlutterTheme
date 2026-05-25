class CategoryQueries {
  static const categoryTree = '''
    query GetCategoryTree(\$parentId: String) {
      categories(filters: { parent_id: { eq: \$parentId } }) {
        items {
          uid
          name
          description
          image
          product_count
          level
          url_path
          url_key
          include_in_menu
          position
          children {
            uid
            name
            description
            image
            product_count
            level
            url_path
            url_key
            include_in_menu
            position
            children {
              uid
              name
              description
              image
              product_count
              level
              url_path
              url_key
              include_in_menu
              position
            }
          }
        }
      }
    }
  ''';

  static const categoryById = '''
    query GetCategory(\$uid: String!) {
      categories(filters: { category_uid: { eq: \$uid } }) {
        items {
          uid
          name
          description
          image
          product_count
          level
          url_path
          url_key
          include_in_menu
          position
          breadcrumbs {
            category_uid
            category_name
            category_url_path
          }
        }
      }
    }
  ''';

  static const productsByCategory = '''
    query GetProductsByCategory(
      \$categoryUid: String!,
      \$pageSize: Int!,
      \$currentPage: Int!,
      \$sort: ProductAttributeSortInput,
      \$filter: ProductAttributeFilterInput
    ) {
      products(
        filter: { category_uid: { eq: \$categoryUid } },
        sort: \$sort,
        pageSize: \$pageSize,
        currentPage: \$currentPage
      ) {
        items {
          id
          sku
          name
          thumbnail {
            url
            label
          }
          price_range {
            minimum_price {
              regular_price { value currency }
              final_price { value currency }
            }
          }
          stock_status
          review_count
          rating_summary
          __typename
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
}
