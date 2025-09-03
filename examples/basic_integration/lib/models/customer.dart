class Customer {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String? middleName;
  final String? prefix;
  final String? suffix;
  final String? dateOfBirth;
  final String? taxVat;
  final String? gender;
  final bool isSubscribed;
  final String createdAt;
  final String updatedAt;

  Customer({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    this.middleName,
    this.prefix,
    this.suffix,
    this.dateOfBirth,
    this.taxVat,
    this.gender,
    required this.isSubscribed,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json['id'] ?? 0,
      email: json['email'] ?? '',
      firstName: json['firstname'] ?? '',
      lastName: json['lastname'] ?? '',
      middleName: json['middlename'],
      prefix: json['prefix'],
      suffix: json['suffix'],
      dateOfBirth: json['dob'],
      taxVat: json['taxvat'],
      gender: json['gender'],
      isSubscribed: json['is_subscribed'] ?? false,
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'firstname': firstName,
      'lastname': lastName,
      'middlename': middleName,
      'prefix': prefix,
      'suffix': suffix,
      'dob': dateOfBirth,
      'taxvat': taxVat,
      'gender': gender,
      'is_subscribed': isSubscribed,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  String get fullName => '$firstName $lastName'.trim();
  
  String get displayName {
    if (prefix != null && suffix != null) {
      return '$prefix $firstName $lastName $suffix';
    } else if (prefix != null) {
      return '$prefix $firstName $lastName';
    } else if (suffix != null) {
      return '$firstName $lastName $suffix';
    }
    return fullName;
  }
}

