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
@freezed
class CustomerCreateRequest with _$CustomerCreateRequest {
  const factory CustomerCreateRequest({
    required String email,
    required String password,
    required String firstname,
    required String lastname,
    String? middlename,
    String? prefix,
    String? suffix,
    String? dateOfBirth,
    String? taxvat,
    String? gender,
    bool? isSubscribed,
    List<Address>? addresses,
  }) = _CustomerCreateRequest;

  factory CustomerCreateRequest.fromJson(Map<String, dynamic> json) =>
      _$CustomerCreateRequestFromJson(json);
}

/// Customer update request model
@freezed
class CustomerUpdateRequest with _$CustomerUpdateRequest {
  const factory CustomerUpdateRequest({
    String? firstname,
    String? lastname,
    String? middlename,
    String? prefix,
    String? suffix,
    String? dateOfBirth,
    String? taxvat,
    String? gender,
    bool? isSubscribed,
    List<Address>? addresses,
  }) = _CustomerUpdateRequest;

  factory CustomerUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$CustomerUpdateRequestFromJson(json);
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
