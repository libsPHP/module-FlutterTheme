import 'customer.dart';

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
@freezed
class PasswordChangeRequest with _$PasswordChangeRequest {
  const factory PasswordChangeRequest({
    required String currentPassword,
    required String newPassword,
  }) = _PasswordChangeRequest;

  factory PasswordChangeRequest.fromJson(Map<String, dynamic> json) =>
      _$PasswordChangeRequestFromJson(json);
}

/// Password reset request model
@freezed
class PasswordResetRequest with _$PasswordResetRequest {
  const factory PasswordResetRequest({required String email}) =
      _PasswordResetRequest;

  factory PasswordResetRequest.fromJson(Map<String, dynamic> json) =>
      _$PasswordResetRequestFromJson(json);
}

/// Social login request model
@freezed
class SocialLoginRequest with _$SocialLoginRequest {
  const factory SocialLoginRequest({
    required String provider,
    required String token,
    String? email,
    String? firstname,
    String? lastname,
  }) = _SocialLoginRequest;

  factory SocialLoginRequest.fromJson(Map<String, dynamic> json) =>
      _$SocialLoginRequestFromJson(json);
}

/// Token refresh request model
@freezed
class TokenRefreshRequest with _$TokenRefreshRequest {
  const factory TokenRefreshRequest({required String refreshToken}) =
      _TokenRefreshRequest;

  factory TokenRefreshRequest.fromJson(Map<String, dynamic> json) =>
      _$TokenRefreshRequestFromJson(json);
}

/// Session information model
@freezed
class SessionInfo with _$SessionInfo {
  const factory SessionInfo({
    required String sessionId,
    required DateTime createdAt,
    required DateTime expiresAt,
    required bool isValid,
    String? customerId,
    String? cartId,
  }) = _SessionInfo;

  factory SessionInfo.fromJson(Map<String, dynamic> json) =>
      _$SessionInfoFromJson(json);
}
