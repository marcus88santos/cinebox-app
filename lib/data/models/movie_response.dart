import 'package:cinebox_app/data/models/movie_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_response.g.dart';

@JsonSerializable()
class MovieResponse {
  final int page;
  final List<MovieItem> results;
  final int totalResults;
  final int totalPages;

  factory MovieResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseFromJson(json);

  MovieResponse({
    required this.page,
    required this.results,
    required this.totalResults,
    required this.totalPages,
  });

  Map<String, dynamic> toJson() => _$MovieResponseToJson(this);
}
