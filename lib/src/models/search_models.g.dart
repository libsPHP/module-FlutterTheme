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

Map<String, dynamic> _$SearchResponseToJson(
  SearchResponse instance,
) => <String, dynamic>{
  if (instance.items?.map((e) => e.toJson()).toList() case final value?)
    'items': value,
  if (instance.totalCount case final value?) 'totalCount': value,
  if (instance.currentPage case final value?) 'currentPage': value,
  if (instance.pageSize case final value?) 'pageSize': value,
  if (instance.availableFilters?.map((e) => e.toJson()).toList()
      case final value?)
    'availableFilters': value,
  if (instance.suggestions?.map((e) => e.toJson()).toList() case final value?)
    'suggestions': value,
};

SearchSuggestion _$SearchSuggestionFromJson(Map<String, dynamic> json) =>
    SearchSuggestion(
      text: json['text'] as String?,
      type: json['type'] as String?,
      frequency: (json['frequency'] as num?)?.toInt(),
      url: json['url'] as String?,
    );

Map<String, dynamic> _$SearchSuggestionToJson(SearchSuggestion instance) =>
    <String, dynamic>{
      if (instance.text case final value?) 'text': value,
      if (instance.type case final value?) 'type': value,
      if (instance.frequency case final value?) 'frequency': value,
      if (instance.url case final value?) 'url': value,
    };

SearchFilter _$SearchFilterFromJson(Map<String, dynamic> json) => SearchFilter(
  field: json['field'] as String?,
  value: json['value'] as String?,
  label: json['label'] as String?,
  type: json['type'] as String?,
  options: (json['options'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$SearchFilterToJson(SearchFilter instance) =>
    <String, dynamic>{
      if (instance.field case final value?) 'field': value,
      if (instance.value case final value?) 'value': value,
      if (instance.label case final value?) 'label': value,
      if (instance.type case final value?) 'type': value,
      if (instance.options case final value?) 'options': value,
    };

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

Map<String, dynamic> _$FilterableAttributeToJson(
  FilterableAttribute instance,
) => <String, dynamic>{
  if (instance.code case final value?) 'code': value,
  if (instance.label case final value?) 'label': value,
  if (instance.type case final value?) 'type': value,
  if (instance.options?.map((e) => e.toJson()).toList() case final value?)
    'options': value,
  if (instance.isMultiSelect case final value?) 'isMultiSelect': value,
};

AttributeOption _$AttributeOptionFromJson(Map<String, dynamic> json) =>
    AttributeOption(
      value: json['value'] as String?,
      label: json['label'] as String?,
      count: (json['count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AttributeOptionToJson(AttributeOption instance) =>
    <String, dynamic>{
      if (instance.value case final value?) 'value': value,
      if (instance.label case final value?) 'label': value,
      if (instance.count case final value?) 'count': value,
    };

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

Map<String, dynamic> _$FilterCombinationToJson(FilterCombination instance) =>
    <String, dynamic>{
      'name': instance.name,
      'filters': instance.filters,
      if (instance.createdAt?.toIso8601String() case final value?)
        'createdAt': value,
      if (instance.isShared case final value?) 'isShared': value,
    };

SearchRequest _$SearchRequestFromJson(Map<String, dynamic> json) =>
    SearchRequest(
      query: json['query'] as String,
      filters: json['filters'] as Map<String, dynamic>?,
      page: (json['page'] as num?)?.toInt() ?? 1,
      pageSize: (json['pageSize'] as num?)?.toInt() ?? 20,
      sortBy: json['sortBy'] as String?,
      sortOrder: json['sortOrder'] as String?,
    );

Map<String, dynamic> _$SearchRequestToJson(SearchRequest instance) =>
    <String, dynamic>{
      'query': instance.query,
      if (instance.filters case final value?) 'filters': value,
      'page': instance.page,
      'pageSize': instance.pageSize,
      if (instance.sortBy case final value?) 'sortBy': value,
      if (instance.sortOrder case final value?) 'sortOrder': value,
    };

SearchFilterRequest _$SearchFilterRequestFromJson(Map<String, dynamic> json) =>
    SearchFilterRequest(
      field: json['field'] as String,
      value: json['value'] as String,
      operator: json['operator'] as String?,
    );

Map<String, dynamic> _$SearchFilterRequestToJson(
  SearchFilterRequest instance,
) => <String, dynamic>{
  'field': instance.field,
  'value': instance.value,
  if (instance.operator case final value?) 'operator': value,
};
