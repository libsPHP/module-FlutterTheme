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

Map<String, dynamic> _$SearchResponseToJson(SearchResponse instance) =>
    <String, dynamic>{
      'items': ?instance.items?.map((e) => e.toJson()).toList(),
      'totalCount': ?instance.totalCount,
      'currentPage': ?instance.currentPage,
      'pageSize': ?instance.pageSize,
      'availableFilters': ?instance.availableFilters
          ?.map((e) => e.toJson())
          .toList(),
      'suggestions': ?instance.suggestions?.map((e) => e.toJson()).toList(),
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
      'text': ?instance.text,
      'type': ?instance.type,
      'frequency': ?instance.frequency,
      'url': ?instance.url,
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
      'field': ?instance.field,
      'value': ?instance.value,
      'label': ?instance.label,
      'type': ?instance.type,
      'options': ?instance.options,
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
  'code': ?instance.code,
  'label': ?instance.label,
  'type': ?instance.type,
  'options': ?instance.options?.map((e) => e.toJson()).toList(),
  'isMultiSelect': ?instance.isMultiSelect,
};

AttributeOption _$AttributeOptionFromJson(Map<String, dynamic> json) =>
    AttributeOption(
      value: json['value'] as String?,
      label: json['label'] as String?,
      count: (json['count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AttributeOptionToJson(AttributeOption instance) =>
    <String, dynamic>{
      'value': ?instance.value,
      'label': ?instance.label,
      'count': ?instance.count,
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
      'createdAt': ?instance.createdAt?.toIso8601String(),
      'isShared': ?instance.isShared,
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
      'filters': ?instance.filters,
      'page': instance.page,
      'pageSize': instance.pageSize,
      'sortBy': ?instance.sortBy,
      'sortOrder': ?instance.sortOrder,
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
  'operator': ?instance.operator,
};
