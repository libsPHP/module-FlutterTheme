class AuthQueries {
  static const generateToken = '''
    mutation GenerateCustomerToken(\$email: String!, \$password: String!) {
      generateCustomerToken(email: \$email, password: \$password) {
        token
      }
    }
  ''';

  static const createCustomer = '''
    mutation CreateCustomer(\$input: CustomerCreateInput!) {
      createCustomer(input: \$input) {
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

  static const requestPasswordReset = '''
    mutation RequestPasswordResetEmail(\$email: String!) {
      requestPasswordResetEmail(email: \$email)
    }
  ''';

  static const resetPassword = '''
    mutation ResetPassword(\$email: String!, \$resetPasswordToken: String!, \$newPassword: String!) {
      resetPassword(
        email: \$email
        resetPasswordToken: \$resetPasswordToken
        newPassword: \$newPassword
      )
    }
  ''';

  static const revokeToken = '''
    mutation RevokeCustomerToken {
      revokeCustomerToken {
        result
      }
    }
  ''';
}
