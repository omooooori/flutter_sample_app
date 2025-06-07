import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_request.freezed.dart';
part 'search_request.g.dart';

@freezed
class SearchRequest with _$SearchRequest {
  const factory SearchRequest({required String query, String? masterTypeId}) =
      _SearchRequest;

  factory SearchRequest.fromJson(Map<String, dynamic> json) =>
      _$SearchRequestFromJson(json);
}
