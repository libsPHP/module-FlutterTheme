// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResponse _$SearchResponseFromJson(Map<String, dynamic> json) =>
    SearchResponse(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCount: (json['totalCount'] as num?)?.toInt(),
      currentPage: (json['currentPage'] as num?)?.toInt(),
      pageSize: (json['pageSize'] as num?)?.toInt(),
      availableFilters: (json['availableFilters'] as List<dynamic>?)
          ?.map((e) => SearchFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      suggestions: (json['suggestions'] as List<dynamic>?)
          ?.map((e) => SearchSuggestion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchResponseToJson(SearchResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('items', instance.items?.map((e) => e.toJson()).toList());
  writeNotNull('totalCount', instance.totalCount);
  writeNotNull('currentPage', instance.currentPage);
  writeNotNull('pageSize', instance.pageSize);
  writeNotNull('availableFilters',
      instance.availableFilters?.map((e) => e.toJson()).toList());
  writeNotNull(
      'suggestions', instance.suggestions?.map((e) => e.toJson()).toList());
  return val;
}

SearchSuggestion _$SearchSuggestionFromJson(Map<String, dynamic> json) =>
    SearchSuggestion(
      text: json['text'] as String?,
      type: json['type'] as String?,
      frequency: (json['frequency'] as num?)?.toInt(),
      url: json['url'] as String?,
    );

Map<String, dynamic> _$SearchSuggestionToJson(SearchSuggestion instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('text', instance.text);
  writeNotNull('type', instance.type);
  writeNotNull('frequency', instance.frequency);
  writeNotNull('url', instance.url);
  return val;
}

SearchFilter _$SearchFilterFromJson(Map<String, dynamic> json) => SearchFilter(
      field: json['field'] as String?,
      value: json['value'] as String?,
      label: json['label'] as String?,
      type: json['type'] as String?,
      options:
          (json['options'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$SearchFilterToJson(SearchFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('field', instance.field);
  writeNotNull('value', instance.value);
  writeNotNull('label', instance.label);
  writeNotNull('type', instance.type);
  writeNotNull('options', instance.options);
  return val;
}

SearchAnalytics _$SearchAnalyticsFromJson(Map<String, dynamic> json) =>
    SearchAnalytics(
      totalSearches: (json['totalSearches'] as num).toInt(),
      popularQueries: (json['popularQueries'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      searchTrends: (json['searchTrends'] as List<dynamic>)
          .map((e) => SearchTrend.fromJson(e as Map<String, dynamic>))
          .toList(),
      conversionRate: (json['conversionRate'] as num).toDouble(),
    );

Map<String, dynamic> _$SearchAnalyticsToJson(SearchAnalytics instance) =>
    <String, dynamic>{
      'totalSearches': instance.totalSearches,
      'popularQueries': instance.popularQueries,
      'searchTrends': instance.searchTrends.map((e) => e.toJson()).toList(),
      'conversionRate': instance.conversionRate,
    };

SearchTrend _$SearchTrendFromJson(Map<String, dynamic> json) => SearchTrend(
      period: json['period'] as String,
      searchCount: (json['searchCount'] as num).toInt(),
      growthRate: (json['growthRate'] as num).toDouble(),
    );

Map<String, dynamic> _$SearchTrendToJson(SearchTrend instance) =>
    <String, dynamic>{
      'period': instance.period,
      'searchCount': instance.searchCount,
      'growthRate': instance.growthRate,
    };

FilterableAttribute _$FilterableAttributeFromJson(Map<String, dynamic> json) =>
    FilterableAttribute(
      code: json['code'] as String?,
      label: json['label'] as String?,
      type: json['type'] as String?,
      options: (json['options'] as List<dynamic>?)
          ?.map((e) => AttributeOption.fromJson(e as Map<String, dynamic>))
          .toList(),
      isMultiSelect: json['isMultiSelect'] as bool?,
    );

Map<String, dynamic> _$FilterableAttributeToJson(FilterableAttribute instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('code', instance.code);
  writeNotNull('label', instance.label);
  writeNotNull('type', instance.type);
  writeNotNull('options', instance.options?.map((e) => e.toJson()).toList());
  writeNotNull('isMultiSelect', instance.isMultiSelect);
  return val;
}

AttributeOption _$AttributeOptionFromJson(Map<String, dynamic> json) =>
    AttributeOption(
      value: json['value'] as String?,
      label: json['label'] as String?,
      count: (json['count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AttributeOptionToJson(AttributeOption instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('value', instance.value);
  writeNotNull('label', instance.label);
  writeNotNull('count', instance.count);
  return val;
}

PriceRange _$PriceRangeFromJson(Map<String, dynamic> json) => PriceRange(
      minPrice: (json['minPrice'] as num).toDouble(),
      maxPrice: (json['maxPrice'] as num).toDouble(),
      priceSteps: (json['priceSteps'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$PriceRangeToJson(PriceRange instance) =>
    <String, dynamic>{
      'minPrice': instance.minPrice,
      'maxPrice': instance.maxPrice,
      'priceSteps': instance.priceSteps,
    };

AvailabilityFilter _$AvailabilityFilterFromJson(Map<String, dynamic> json) =>
    AvailabilityFilter(
      code: json['code'] as String,
      label: json['label'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$AvailabilityFilterToJson(AvailabilityFilter instance) =>
    <String, dynamic>{
      'code': instance.code,
      'label': instance.label,
      'value': instance.value,
    };

FilterCombination _$FilterCombinationFromJson(Map<String, dynamic> json) =>
    FilterCombination(
      name: json['name'] as String,
      filters: (json['filters'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      isShared: json['isShared'] as bool?,
    );

Map<String, dynamic> _$FilterCombinationToJson(FilterCombination instance) {
  final val = <String, dynamic>{
    'name': instance.name,
    'filters': instance.filters,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('createdAt', instance.createdAt?.toIso8601String());
  writeNotNull('isShared', instance.isShared);
  return val;
}

SearchRequest _$SearchRequestFromJson(Map<String, dynamic> json) =>
    SearchRequest(
      query: json['query'] as String,
      filters: json['filters'] as Map<String, dynamic>?,
      page: (json['page'] as num?)?.toInt() ?? 1,
      pageSize: (json['pageSize'] as num?)?.toInt() ?? 20,
      sortBy: json['sortBy'] as String?,
      sortOrder: json['sortOrder'] as String?,
    );

Map<String, dynamic> _$SearchRequestToJson(SearchRequest instance) {
  final val = <String, dynamic>{
    'query': instance.query,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('filters', instance.filters);
  val['page'] = instance.page;
  val['pageSize'] = instance.pageSize;
  writeNotNull('sortBy', instance.sortBy);
  writeNotNull('sortOrder', instance.sortOrder);
  return val;
}

SearchFilterRequest _$SearchFilterRequestFromJson(Map<String, dynamic> json) =>
    SearchFilterRequest(
      field: json['field'] as String,
      value: json['value'] as String,
      operator: json['operator'] as String?,
    );

Map<String, dynamic> _$SearchFilterRequestToJson(SearchFilterRequest instance) {
  final val = <String, dynamic>{
    'field': instance.field,
    'value': instance.value,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('operator', instance.operator);
  return val;
}
