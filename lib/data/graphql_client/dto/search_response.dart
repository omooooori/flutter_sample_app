import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_response.freezed.dart';
part 'search_response.g.dart';

@freezed
class SearchResult with _$SearchResult {
  const factory SearchResult({
    required String id,
    required String masterName,
    required String masterTypeId,
    required int score,
  }) = _SearchResult;

  factory SearchResult.fromJson(Map<String, dynamic> json) =>
      _$SearchResultFromJson(json);
}

@freezed
class SearchResponse with _$SearchResponse {
  const factory SearchResponse({required List<SearchResult> search}) =
      _SearchResponse;

  factory SearchResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseFromJson(json);
}
