class CustomerQueries {
  static const getCustomer = '''
    query GetCustomer {
      customer {
        id
        email
        firstname
        lastname
        date_of_birth
        gender
        taxvat
        group_id
        store_id
        website_id
        created_at
        default_shipping
        default_billing
      }
    }
  ''';

  static const updateCustomer = '''
    mutation UpdateCustomer(\$input: CustomerUpdateInput!) {
      updateCustomerV2(input: \$input) {
        customer {
          id
          email
          firstname
          lastname
          date_of_birth
          gender
          taxvat
          group_id
          store_id
          website_id
          created_at
          default_shipping
          default_billing
        }
      }
    }
  ''';

  static const getAddresses = '''
    query GetAddresses {
      customer {
        addresses {
          id
          firstname
          lastname
          street
          city
          region {
            region_code
            region_id
            region
          }
          postcode
          country_code
          telephone
          company
          default_shipping
          default_billing
        }
      }
    }
  ''';

  static const createAddress = '''
    mutation CreateAddress(\$input: CustomerAddressInput!) {
      createCustomerAddress(input: \$input) {
        id
        firstname
        lastname
        street
        city
        region {
          region_code
          region_id
          region
        }
        postcode
        country_code
        telephone
        company
        default_shipping
        default_billing
      }
    }
  ''';

  static const updateAddress = '''
    mutation UpdateAddress(\$id: Int!, \$input: CustomerAddressInput!) {
      updateCustomerAddress(id: \$id, input: \$input) {
        id
        firstname
        lastname
        street
        city
        region {
          region_code
          region_id
          region
        }
        postcode
        country_code
        telephone
        company
        default_shipping
        default_billing
      }
    }
  ''';

  static const deleteAddress = '''
    mutation DeleteAddress(\$id: Int!) {
      deleteCustomerAddress(id: \$id)
    }
  ''';

  static const changePassword = '''
    mutation ChangePassword(\$currentPassword: String!, \$newPassword: String!) {
      changeCustomerPassword(
        currentPassword: \$currentPassword
        newPassword: \$newPassword
      ) {
        email
      }
    }
  ''';
}
