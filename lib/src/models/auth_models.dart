import 'customer_models.dart';

/// Authentication response model
class AuthResponse {
  final String accessToken;
  final String refreshToken;
  final String tokenType;
  final int expiresIn;
  final Customer customer;

  const AuthResponse({
    required this.accessToken,
    required this.refreshToken,
    required this.tokenType,
    required this.expiresIn,
    required this.customer,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      tokenType: json['tokenType'] as String,
      expiresIn: json['expiresIn'] as int,
      customer: Customer.fromJson(json['customer'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'tokenType': tokenType,
      'expiresIn': expiresIn,
      'customer': customer.toJson(),
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AuthResponse &&
        other.accessToken == accessToken &&
        other.refreshToken == refreshToken &&
        other.tokenType == tokenType &&
        other.expiresIn == expiresIn &&
        other.customer == customer;
  }

  @override
  int get hashCode {
    return accessToken.hashCode ^
        refreshToken.hashCode ^
        tokenType.hashCode ^
        expiresIn.hashCode ^
        customer.hashCode;
  }

  @override
  String toString() {
    return 'AuthResponse(accessToken: $accessToken, refreshToken: $refreshToken, tokenType: $tokenType, expiresIn: $expiresIn, customer: $customer)';
  }
}


/// Customer creation request model
class CustomerCreateRequest {
  final String email;
  final String password;
  final String firstname;
  final String lastname;
  final String? middlename;
  final String? prefix;
  final String? suffix;
  final String? dateOfBirth;
  final String? taxvat;
  final String? gender;
  final bool? isSubscribed;
  final List<Address>? addresses;

  const CustomerCreateRequest({
    required this.email,
    required this.password,
    required this.firstname,
    required this.lastname,
    this.middlename,
    this.prefix,
    this.suffix,
    this.dateOfBirth,
    this.taxvat,
    this.gender,
    this.isSubscribed,
    this.addresses,
  });

  factory CustomerCreateRequest.fromJson(Map<String, dynamic> json) {
    return CustomerCreateRequest(
      email: json['email'] as String,
      password: json['password'] as String,
      firstname: json['firstname'] as String,
      lastname: json['lastname'] as String,
      middlename: json['middlename'] as String?,
      prefix: json['prefix'] as String?,
      suffix: json['suffix'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      taxvat: json['taxvat'] as String?,
      gender: json['gender'] as String?,
      isSubscribed: json['isSubscribed'] as bool?,
      addresses: json['addresses'] != null 
          ? (json['addresses'] as List).map((e) => Address.fromJson(e as Map<String, dynamic>)).toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'firstname': firstname,
      'lastname': lastname,
      'middlename': middlename,
      'prefix': prefix,
      'suffix': suffix,
      'dateOfBirth': dateOfBirth,
      'taxvat': taxvat,
      'gender': gender,
      'isSubscribed': isSubscribed,
      'addresses': addresses?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CustomerCreateRequest &&
        other.email == email &&
        other.password == password &&
        other.firstname == firstname &&
        other.lastname == lastname &&
        other.middlename == middlename &&
        other.prefix == prefix &&
        other.suffix == suffix &&
        other.dateOfBirth == dateOfBirth &&
        other.taxvat == taxvat &&
        other.gender == gender &&
        other.isSubscribed == isSubscribed &&
        other.addresses == addresses;
  }

  @override
  int get hashCode {
    return email.hashCode ^
        password.hashCode ^
        firstname.hashCode ^
        lastname.hashCode ^
        middlename.hashCode ^
        prefix.hashCode ^
        suffix.hashCode ^
        dateOfBirth.hashCode ^
        taxvat.hashCode ^
        gender.hashCode ^
        isSubscribed.hashCode ^
        addresses.hashCode;
  }

  @override
  String toString() {
    return 'CustomerCreateRequest(email: $email, password: [HIDDEN], firstname: $firstname, lastname: $lastname, middlename: $middlename, prefix: $prefix, suffix: $suffix, dateOfBirth: $dateOfBirth, taxvat: $taxvat, gender: $gender, isSubscribed: $isSubscribed, addresses: $addresses)';
  }
}

/// Customer update request model
class CustomerUpdateRequest {
  final String? firstname;
  final String? lastname;
  final String? middlename;
  final String? prefix;
  final String? suffix;
  final String? dateOfBirth;
  final String? taxvat;
  final String? gender;
  final bool? isSubscribed;
  final List<Address>? addresses;

  const CustomerUpdateRequest({
    this.firstname,
    this.lastname,
    this.middlename,
    this.prefix,
    this.suffix,
    this.dateOfBirth,
    this.taxvat,
    this.gender,
    this.isSubscribed,
    this.addresses,
  });

  factory CustomerUpdateRequest.fromJson(Map<String, dynamic> json) {
    return CustomerUpdateRequest(
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      middlename: json['middlename'] as String?,
      prefix: json['prefix'] as String?,
      suffix: json['suffix'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      taxvat: json['taxvat'] as String?,
      gender: json['gender'] as String?,
      isSubscribed: json['isSubscribed'] as bool?,
      addresses: json['addresses'] != null 
          ? (json['addresses'] as List).map((e) => Address.fromJson(e as Map<String, dynamic>)).toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstname': firstname,
      'lastname': lastname,
      'middlename': middlename,
      'prefix': prefix,
      'suffix': suffix,
      'dateOfBirth': dateOfBirth,
      'taxvat': taxvat,
      'gender': gender,
      'isSubscribed': isSubscribed,
      'addresses': addresses?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CustomerUpdateRequest &&
        other.firstname == firstname &&
        other.lastname == lastname &&
        other.middlename == middlename &&
        other.prefix == prefix &&
        other.suffix == suffix &&
        other.dateOfBirth == dateOfBirth &&
        other.taxvat == taxvat &&
        other.gender == gender &&
        other.isSubscribed == isSubscribed &&
        other.addresses == addresses;
  }

  @override
  int get hashCode {
    return firstname.hashCode ^
        lastname.hashCode ^
        middlename.hashCode ^
        prefix.hashCode ^
        suffix.hashCode ^
        dateOfBirth.hashCode ^
        taxvat.hashCode ^
        gender.hashCode ^
        isSubscribed.hashCode ^
        addresses.hashCode;
  }

  @override
  String toString() {
    return 'CustomerUpdateRequest(firstname: $firstname, lastname: $lastname, middlename: $middlename, prefix: $prefix, suffix: $suffix, dateOfBirth: $dateOfBirth, taxvat: $taxvat, gender: $gender, isSubscribed: $isSubscribed, addresses: $addresses)';
  }
}

/// Password change request model
class PasswordChangeRequest {
  final String currentPassword;
  final String newPassword;

  const PasswordChangeRequest({
    required this.currentPassword,
    required this.newPassword,
  });

  factory PasswordChangeRequest.fromJson(Map<String, dynamic> json) {
    return PasswordChangeRequest(
      currentPassword: json['currentPassword'] as String,
      newPassword: json['newPassword'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'currentPassword': currentPassword,
      'newPassword': newPassword,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PasswordChangeRequest &&
        other.currentPassword == currentPassword &&
        other.newPassword == newPassword;
  }

  @override
  int get hashCode {
    return currentPassword.hashCode ^ newPassword.hashCode;
  }

  @override
  String toString() {
    return 'PasswordChangeRequest(currentPassword: [HIDDEN], newPassword: [HIDDEN])';
  }
}

/// Password reset request model
class PasswordResetRequest {
  final String email;

  const PasswordResetRequest({required this.email});

  factory PasswordResetRequest.fromJson(Map<String, dynamic> json) {
    return PasswordResetRequest(
      email: json['email'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PasswordResetRequest && other.email == email;
  }

  @override
  int get hashCode => email.hashCode;

  @override
  String toString() => 'PasswordResetRequest(email: $email)';
}

/// Social login request model
class SocialLoginRequest {
  final String provider;
  final String token;
  final String? email;
  final String? firstname;
  final String? lastname;

  const SocialLoginRequest({
    required this.provider,
    required this.token,
    this.email,
    this.firstname,
    this.lastname,
  });

  factory SocialLoginRequest.fromJson(Map<String, dynamic> json) {
    return SocialLoginRequest(
      provider: json['provider'] as String,
      token: json['token'] as String,
      email: json['email'] as String?,
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'provider': provider,
      'token': token,
      'email': email,
      'firstname': firstname,
      'lastname': lastname,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SocialLoginRequest &&
        other.provider == provider &&
        other.token == token &&
        other.email == email &&
        other.firstname == firstname &&
        other.lastname == lastname;
  }

  @override
  int get hashCode {
    return provider.hashCode ^
        token.hashCode ^
        email.hashCode ^
        firstname.hashCode ^
        lastname.hashCode;
  }

  @override
  String toString() {
    return 'SocialLoginRequest(provider: $provider, token: [HIDDEN], email: $email, firstname: $firstname, lastname: $lastname)';
  }
}

/// Token refresh request model
class TokenRefreshRequest {
  final String refreshToken;

  const TokenRefreshRequest({required this.refreshToken});

  factory TokenRefreshRequest.fromJson(Map<String, dynamic> json) {
    return TokenRefreshRequest(
      refreshToken: json['refreshToken'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'refreshToken': refreshToken,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TokenRefreshRequest && other.refreshToken == refreshToken;
  }

  @override
  int get hashCode => refreshToken.hashCode;

  @override
  String toString() => 'TokenRefreshRequest(refreshToken: [HIDDEN])';
}

/// Session information model
class SessionInfo {
  final String sessionId;
  final DateTime createdAt;
  final DateTime expiresAt;
  final bool isValid;
  final String? customerId;
  final String? cartId;

  const SessionInfo({
    required this.sessionId,
    required this.createdAt,
    required this.expiresAt,
    required this.isValid,
    this.customerId,
    this.cartId,
  });

  factory SessionInfo.fromJson(Map<String, dynamic> json) {
    return SessionInfo(
      sessionId: json['sessionId'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      expiresAt: DateTime.parse(json['expiresAt'] as String),
      isValid: json['isValid'] as bool,
      customerId: json['customerId'] as String?,
      cartId: json['cartId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sessionId': sessionId,
      'createdAt': createdAt.toIso8601String(),
      'expiresAt': expiresAt.toIso8601String(),
      'isValid': isValid,
      'customerId': customerId,
      'cartId': cartId,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SessionInfo &&
        other.sessionId == sessionId &&
        other.createdAt == createdAt &&
        other.expiresAt == expiresAt &&
        other.isValid == isValid &&
        other.customerId == customerId &&
        other.cartId == cartId;
  }

  @override
  int get hashCode {
    return sessionId.hashCode ^
        createdAt.hashCode ^
        expiresAt.hashCode ^
        isValid.hashCode ^
        customerId.hashCode ^
        cartId.hashCode;
  }

  @override
  String toString() {
    return 'SessionInfo(sessionId: $sessionId, createdAt: $createdAt, expiresAt: $expiresAt, isValid: $isValid, customerId: $customerId, cartId: $cartId)';
  }
}
