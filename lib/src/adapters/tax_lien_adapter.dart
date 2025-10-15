import 'dart:convert';
import 'custom_attributes_adapter.dart';
import '../models/product_models.dart';
import 'validation_result.dart';

/// Tax Lien custom attributes model
class TaxLienAttributes {
  // Basic tax lien information
  final String? parcelId;
  final double? taxAmount;
  final double? interestRate;
  final String? county;
  final String? state;
  final String? zipCode;

  // Property information
  final String? address;
  final String? city;
  final String? propertyType; // residential, commercial, land
  final double? assessedValue;
  final double? lotSize;
  final int? yearBuilt;
  final int? bedrooms;
  final double? bathrooms;
  final double? squareFeet;

  // Tax lien specific
  final DateTime? auctionDate;
  final DateTime? saleDate;
  final DateTime? redemptionDeadline;
  final String? status; // available, pending, sold, redeemed, foreclosed
  final String? ownerName;
  final String? ownerContact;

  // Financial details
  final double? openingBid;
  final double? currentBid;
  final double? premiumAmount;
  final double? penaltyAmount;
  final double? totalAmount;
  final String? paymentTerms;

  // Additional metadata
  final String? legalDescription;
  final List<String>? liens; // Other liens on property
  final List<String>? attachments; // Document URLs
  final Map<String, dynamic>? metadata; // Flexible metadata

  // Market data
  final double? marketValue;
  final double? rentEstimate;
  final String? neighborhood;
  final double? schoolRating;
  final double? crimeIndex;

  TaxLienAttributes({
    this.parcelId,
    this.taxAmount,
    this.interestRate,
    this.county,
    this.state,
    this.zipCode,
    this.address,
    this.city,
    this.propertyType,
    this.assessedValue,
    this.lotSize,
    this.yearBuilt,
    this.bedrooms,
    this.bathrooms,
    this.squareFeet,
    this.auctionDate,
    this.saleDate,
    this.redemptionDeadline,
    this.status,
    this.ownerName,
    this.ownerContact,
    this.openingBid,
    this.currentBid,
    this.premiumAmount,
    this.penaltyAmount,
    this.totalAmount,
    this.paymentTerms,
    this.legalDescription,
    this.liens,
    this.attachments,
    this.metadata,
    this.marketValue,
    this.rentEstimate,
    this.neighborhood,
    this.schoolRating,
    this.crimeIndex,
  });

  factory TaxLienAttributes.fromJson(Map<String, dynamic> json) {
    return TaxLienAttributes(
      parcelId: json['parcel_id'] as String?,
      taxAmount: _parseDouble(json['tax_amount']),
      interestRate: _parseDouble(json['interest_rate']),
      county: json['county'] as String?,
      state: json['state'] as String?,
      zipCode: json['zip_code'] as String?,
      address: json['address'] as String?,
      city: json['city'] as String?,
      propertyType: json['property_type'] as String?,
      assessedValue: _parseDouble(json['assessed_value']),
      lotSize: _parseDouble(json['lot_size']),
      yearBuilt: json['year_built'] as int?,
      bedrooms: json['bedrooms'] as int?,
      bathrooms: _parseDouble(json['bathrooms']),
      squareFeet: _parseDouble(json['square_feet']),
      auctionDate: _parseDateTime(json['auction_date']),
      saleDate: _parseDateTime(json['sale_date']),
      redemptionDeadline: _parseDateTime(json['redemption_deadline']),
      status: json['status'] as String?,
      ownerName: json['owner_name'] as String?,
      ownerContact: json['owner_contact'] as String?,
      openingBid: _parseDouble(json['opening_bid']),
      currentBid: _parseDouble(json['current_bid']),
      premiumAmount: _parseDouble(json['premium_amount']),
      penaltyAmount: _parseDouble(json['penalty_amount']),
      totalAmount: _parseDouble(json['total_amount']),
      paymentTerms: json['payment_terms'] as String?,
      legalDescription: json['legal_description'] as String?,
      liens: _parseStringList(json['liens']),
      attachments: _parseStringList(json['attachments']),
      metadata: json['metadata'] as Map<String, dynamic>?,
      marketValue: _parseDouble(json['market_value']),
      rentEstimate: _parseDouble(json['rent_estimate']),
      neighborhood: json['neighborhood'] as String?,
      schoolRating: _parseDouble(json['school_rating']),
      crimeIndex: _parseDouble(json['crime_index']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'parcel_id': parcelId,
      'tax_amount': taxAmount,
      'interest_rate': interestRate,
      'county': county,
      'state': state,
      'zip_code': zipCode,
      'address': address,
      'city': city,
      'property_type': propertyType,
      'assessed_value': assessedValue,
      'lot_size': lotSize,
      'year_built': yearBuilt,
      'bedrooms': bedrooms,
      'bathrooms': bathrooms,
      'square_feet': squareFeet,
      'auction_date': auctionDate?.toIso8601String(),
      'sale_date': saleDate?.toIso8601String(),
      'redemption_deadline': redemptionDeadline?.toIso8601String(),
      'status': status,
      'owner_name': ownerName,
      'owner_contact': ownerContact,
      'opening_bid': openingBid,
      'current_bid': currentBid,
      'premium_amount': premiumAmount,
      'penalty_amount': penaltyAmount,
      'total_amount': totalAmount,
      'payment_terms': paymentTerms,
      'legal_description': legalDescription,
      'liens': liens,
      'attachments': attachments,
      'metadata': metadata,
      'market_value': marketValue,
      'rent_estimate': rentEstimate,
      'neighborhood': neighborhood,
      'school_rating': schoolRating,
      'crime_index': crimeIndex,
    };
  }

  static double? _parseDouble(dynamic value) {
    if (value == null) return null;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) return double.tryParse(value);
    return null;
  }

  static DateTime? _parseDateTime(dynamic value) {
    if (value == null) return null;
    if (value is DateTime) return value;
    if (value is String) return DateTime.tryParse(value);
    return null;
  }

  static List<String>? _parseStringList(dynamic value) {
    if (value == null) return null;
    if (value is List) return value.cast<String>();
    if (value is String) {
      try {
        final decoded = json.decode(value);
        if (decoded is List) return decoded.cast<String>();
      } catch (_) {
        return value.split(',').map((s) => s.trim()).toList();
      }
    }
    return null;
  }
}

/// Tax Lien Custom Attributes Adapter for Flutter Magento
class TaxLienAdapter extends CustomAttributesAdapter<TaxLienAttributes> {
  @override
  List<String> get supportedAttributeCodes => [
    // Basic
    'parcel_id',
    'tax_amount',
    'interest_rate',
    'county',
    'state',
    'zip_code',
    // Property
    'address',
    'city',
    'property_type',
    'assessed_value',
    'lot_size',
    'year_built',
    'bedrooms',
    'bathrooms',
    'square_feet',
    // Tax lien specific
    'auction_date',
    'sale_date',
    'redemption_deadline',
    'status',
    'owner_name',
    'owner_contact',
    // Financial
    'opening_bid',
    'current_bid',
    'premium_amount',
    'penalty_amount',
    'total_amount',
    'payment_terms',
    // Additional
    'legal_description',
    'liens',
    'attachments',
    'metadata',
    // Market
    'market_value',
    'rent_estimate',
    'neighborhood',
    'school_rating',
    'crime_index',
  ];

  @override
  TaxLienAttributes fromCustomAttributes(List<CustomAttribute> attributes) {
    final attrMap = {
      for (var attr in attributes) attr.attributeCode: attr.value,
    };

    return TaxLienAttributes(
      parcelId: attrMap['parcel_id'],
      taxAmount: _parseDouble(attrMap['tax_amount']),
      interestRate: _parseDouble(attrMap['interest_rate']),
      county: attrMap['county'],
      state: attrMap['state'],
      zipCode: attrMap['zip_code'],
      address: attrMap['address'],
      city: attrMap['city'],
      propertyType: attrMap['property_type'],
      assessedValue: _parseDouble(attrMap['assessed_value']),
      lotSize: _parseDouble(attrMap['lot_size']),
      yearBuilt: _parseInt(attrMap['year_built']),
      bedrooms: _parseInt(attrMap['bedrooms']),
      bathrooms: _parseDouble(attrMap['bathrooms']),
      squareFeet: _parseDouble(attrMap['square_feet']),
      auctionDate: _parseDateTime(attrMap['auction_date']),
      saleDate: _parseDateTime(attrMap['sale_date']),
      redemptionDeadline: _parseDateTime(attrMap['redemption_deadline']),
      status: attrMap['status'],
      ownerName: attrMap['owner_name'],
      ownerContact: attrMap['owner_contact'],
      openingBid: _parseDouble(attrMap['opening_bid']),
      currentBid: _parseDouble(attrMap['current_bid']),
      premiumAmount: _parseDouble(attrMap['premium_amount']),
      penaltyAmount: _parseDouble(attrMap['penalty_amount']),
      totalAmount: _parseDouble(attrMap['total_amount']),
      paymentTerms: attrMap['payment_terms'],
      legalDescription: attrMap['legal_description'],
      liens: _parseStringList(attrMap['liens']),
      attachments: _parseStringList(attrMap['attachments']),
      metadata: _parseJsonMap(attrMap['metadata']),
      marketValue: _parseDouble(attrMap['market_value']),
      rentEstimate: _parseDouble(attrMap['rent_estimate']),
      neighborhood: attrMap['neighborhood'],
      schoolRating: _parseDouble(attrMap['school_rating']),
      crimeIndex: _parseDouble(attrMap['crime_index']),
    );
  }

  @override
  List<CustomAttribute> toCustomAttributes(TaxLienAttributes model) {
    final attributes = <CustomAttribute>[];

    void addIfNotNull(String code, dynamic value) {
      if (value != null) {
        attributes.add(
          CustomAttribute(attributeCode: code, value: value.toString()),
        );
      }
    }

    addIfNotNull('parcel_id', model.parcelId);
    addIfNotNull('tax_amount', model.taxAmount);
    addIfNotNull('interest_rate', model.interestRate);
    addIfNotNull('county', model.county);
    addIfNotNull('state', model.state);
    addIfNotNull('zip_code', model.zipCode);
    addIfNotNull('address', model.address);
    addIfNotNull('city', model.city);
    addIfNotNull('property_type', model.propertyType);
    addIfNotNull('assessed_value', model.assessedValue);
    addIfNotNull('lot_size', model.lotSize);
    addIfNotNull('year_built', model.yearBuilt);
    addIfNotNull('bedrooms', model.bedrooms);
    addIfNotNull('bathrooms', model.bathrooms);
    addIfNotNull('square_feet', model.squareFeet);
    addIfNotNull('auction_date', model.auctionDate?.toIso8601String());
    addIfNotNull('sale_date', model.saleDate?.toIso8601String());
    addIfNotNull(
      'redemption_deadline',
      model.redemptionDeadline?.toIso8601String(),
    );
    addIfNotNull('status', model.status);
    addIfNotNull('owner_name', model.ownerName);
    addIfNotNull('owner_contact', model.ownerContact);
    addIfNotNull('opening_bid', model.openingBid);
    addIfNotNull('current_bid', model.currentBid);
    addIfNotNull('premium_amount', model.premiumAmount);
    addIfNotNull('penalty_amount', model.penaltyAmount);
    addIfNotNull('total_amount', model.totalAmount);
    addIfNotNull('payment_terms', model.paymentTerms);
    addIfNotNull('legal_description', model.legalDescription);

    if (model.liens != null) {
      attributes.add(
        CustomAttribute(
          attributeCode: 'liens',
          value: json.encode(model.liens),
        ),
      );
    }

    if (model.attachments != null) {
      attributes.add(
        CustomAttribute(
          attributeCode: 'attachments',
          value: json.encode(model.attachments),
        ),
      );
    }

    if (model.metadata != null) {
      attributes.add(
        CustomAttribute(
          attributeCode: 'metadata',
          value: json.encode(model.metadata),
        ),
      );
    }

    addIfNotNull('market_value', model.marketValue);
    addIfNotNull('rent_estimate', model.rentEstimate);
    addIfNotNull('neighborhood', model.neighborhood);
    addIfNotNull('school_rating', model.schoolRating);
    addIfNotNull('crime_index', model.crimeIndex);

    return attributes;
  }

  @override
  ValidationResult validate(TaxLienAttributes model) {
    final errors = <String>[];

    // Required fields
    if (model.parcelId == null || model.parcelId!.isEmpty) {
      errors.add('Parcel ID is required');
    }

    // Tax amount validation
    if (model.taxAmount != null && model.taxAmount! < 0) {
      errors.add('Tax amount must be non-negative');
    }

    // Interest rate validation
    if (model.interestRate != null) {
      if (model.interestRate! < 0 || model.interestRate! > 100) {
        errors.add('Interest rate must be between 0 and 100');
      }
    }

    // Date validation
    if (model.auctionDate != null && model.redemptionDeadline != null) {
      if (model.redemptionDeadline!.isBefore(model.auctionDate!)) {
        errors.add('Redemption deadline must be after auction date');
      }
    }

    // Assessed value validation
    if (model.assessedValue != null && model.assessedValue! < 0) {
      errors.add('Assessed value must be non-negative');
    }

    // Year built validation
    if (model.yearBuilt != null) {
      final currentYear = DateTime.now().year;
      if (model.yearBuilt! < 1700 || model.yearBuilt! > currentYear + 1) {
        errors.add('Year built must be between 1700 and ${currentYear + 1}');
      }
    }

    // Status validation
    if (model.status != null) {
      const validStatuses = [
        'available',
        'pending',
        'sold',
        'redeemed',
        'foreclosed',
      ];
      if (!validStatuses.contains(model.status!.toLowerCase())) {
        errors.add(
          'Invalid status. Must be one of: ${validStatuses.join(", ")}',
        );
      }
    }

    return ValidationResult(isValid: errors.isEmpty, errors: errors);
  }

  @override
  U? getAttributeValue<U>(List<CustomAttribute> attributes, String code) {
    final attr = attributes.firstWhere(
      (attr) => attr.attributeCode == code,
      orElse: () => const CustomAttribute(attributeCode: '', value: ''),
    );

    if (attr.value.isEmpty) return null;

    // Type conversion
    if (U == String) return attr.value as U?;
    if (U == int) return int.tryParse(attr.value) as U?;
    if (U == double) return double.tryParse(attr.value) as U?;
    if (U == bool) return (attr.value.toLowerCase() == 'true') as U?;
    if (U == DateTime) return DateTime.tryParse(attr.value) as U?;

    return null;
  }

  @override
  Map<String, dynamic> buildSearchFilters(TaxLienAttributes model) {
    final filters = <String, dynamic>{};

    if (model.state != null) filters['state'] = model.state;
    if (model.county != null) filters['county'] = model.county;
    if (model.city != null) filters['city'] = model.city;
    if (model.status != null) filters['status'] = model.status;
    if (model.propertyType != null)
      filters['property_type'] = model.propertyType;

    // Range filters
    if (model.taxAmount != null) {
      filters['tax_amount'] = {'gteq': model.taxAmount.toString()};
    }

    if (model.interestRate != null) {
      filters['interest_rate'] = {'gteq': model.interestRate.toString()};
    }

    return filters;
  }

  // Helper methods
  static double? _parseDouble(String? value) {
    if (value == null) return null;
    return double.tryParse(value);
  }

  static int? _parseInt(String? value) {
    if (value == null) return null;
    return int.tryParse(value);
  }

  static DateTime? _parseDateTime(String? value) {
    if (value == null) return null;
    return DateTime.tryParse(value);
  }

  static List<String>? _parseStringList(String? value) {
    if (value == null) return null;
    try {
      final decoded = json.decode(value);
      if (decoded is List) return decoded.cast<String>();
    } catch (_) {
      return value.split(',').map((s) => s.trim()).toList();
    }
    return null;
  }

  static Map<String, dynamic>? _parseJsonMap(String? jsonString) {
    if (jsonString == null) return null;
    try {
      return json.decode(jsonString) as Map<String, dynamic>;
    } catch (e) {
      return null;
    }
  }
}
