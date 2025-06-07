// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchRequestImpl _$$SearchRequestImplFromJson(Map<String, dynamic> json) =>
    _$SearchRequestImpl(
      query: json['query'] as String,
      masterTypeId: json['masterTypeId'] as String?,
    );

Map<String, dynamic> _$$SearchRequestImplToJson(_$SearchRequestImpl instance) =>
    <String, dynamic>{
      'query': instance.query,
      'masterTypeId': instance.masterTypeId,
    };
