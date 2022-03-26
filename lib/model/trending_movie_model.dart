// To parse this JSON data, do
//
//     final trendingMovieModel = trendingMovieModelFromJson(jsonString);

import 'dart:convert';

TrendingMovieModel trendingMovieModelFromJson(String str) =>
    TrendingMovieModel.fromJson(json.decode(str));

String trendingMovieModelToJson(TrendingMovieModel data) =>
    json.encode(data.toJson());

class TrendingMovieModel {
  TrendingMovieModel({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  final int page;
  final List<TrendingResult> results;
  final int totalPages;
  final int totalResults;

  factory TrendingMovieModel.fromJson(Map<String, dynamic> json) =>
      TrendingMovieModel(
        page: json["page"],
        results: List<TrendingResult>.from(
            json["results"].map((x) => TrendingResult.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}

class TrendingResult {
  TrendingResult({
    required this.originalLanguage,
    required this.posterPath,
    required this.firstAirDate,
    required this.id,
    required this.overview,
    required this.voteCount,
    required this.voteAverage,
    required this.genreIds,
    required this.name,
    required this.backdropPath,
    required this.originalName,
    required this.originCountry,
    required this.popularity,
    required this.mediaType,
    required this.originalTitle,
    required this.video,
    required this.releaseDate,
    required this.title,
    required this.adult,
  });

  final String? originalLanguage;
  final String posterPath;
  final DateTime? firstAirDate;
  final int? id;
  final String? overview;
  final int? voteCount;
  final double voteAverage;
  final List<int> genreIds;
  final String? name;
  final String? backdropPath;
  final String? originalName;
  final String? originCountry;
  final double? popularity;
  final String? mediaType;
  final String? originalTitle;
  final bool? video;
  final String? releaseDate;
  final String title;
  final bool adult;

  factory TrendingResult.fromJson(Map<String, dynamic> json) => TrendingResult(
        originalLanguage: json["original_language"],
        posterPath: json["poster_path"],
        firstAirDate: json["first_air_date"],
        id: json["id"],
        overview: json["overview"],
        voteCount: json["vote_count"],
        voteAverage: json["vote_average"].toDouble(),
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        name: json["name"],
        backdropPath: json["backdrop_path"],
        originalName: json["original_name"],
        originCountry: json["origin_country"],
        popularity: json["popularity"].toDouble(),
        mediaType: json["media_type"],
        originalTitle: json["original_title"],
        video: json["video"],
        releaseDate: json["release_date"],
        title: json["title"],
        adult: json["adult"],
      );

  Map<String, dynamic> toJson() => {
        "original_language": originalLanguage,
        "poster_path": posterPath,
        "first_air_date": firstAirDate,
        // "${firstAirDate.year.toString().padLeft(4, '0')}-${firstAirDate.month.toString().padLeft(2, '0')}-${firstAirDate.day.toString().padLeft(2, '0')}",
        "id": id,
        "overview": overview,
        "vote_count": voteCount,
        "vote_average": voteAverage,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "name": name,
        "backdrop_path": backdropPath,
        "original_name": originalName,
        "origin_country": originCountry,
        "popularity": popularity,
        "media_type": mediaType,
        "original_title": originalTitle,
        "video": video,
        "release_date": releaseDate,
        // "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "title": title,
        "adult": adult,
      };
}

// enum MediaType { TV, MOVIE }

// final mediaTypeValues =
//     EnumValues({"movie": MediaType.MOVIE, "tv": MediaType.TV});

// class EnumValues<T> {
//   Map<String, T> map;
//   Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     if (reverseMap == null) {
//       reverseMap = map.map((k, v) => new MapEntry(v, k));
//     }
//     return reverseMap;
//   }
// }
