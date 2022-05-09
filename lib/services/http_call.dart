import 'dart:convert';
import 'package:conclase_movie_app/model/search_model.dart';
import 'package:conclase_movie_app/model/trending_movie_model.dart';
import 'package:conclase_movie_app/model/upcoming_movie_model.dart';
import 'package:http/http.dart';
import '../const/key.dart';

mixin MovieApi {
  var data = [];
  List<SearchModel> results = [];
  // Future<MovieModel> getMovies() async {
  //   Response response = await get(Uri.parse(movieURL));
  //   if (response.statusCode == 200) {
  //     var body = jsonDecode(response.body);
  //     var movieList = MovieModel.fromJson(body);
  //     return movieList;
  //   } else {
  //     throw "Unable to retrieve posts.";
  //   }
  // }

  Future<UpcomingMoviesModel> getUpcomingMovies() async {
    Response response = await get(Uri.parse(upcomingMovieURL));
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      var upcomingMovieList = UpcomingMoviesModel.fromJson(body);
      return upcomingMovieList;
    } else {
      throw "Unable to retrieve posts.";
    }
  }

  Future<TrendingMovieModel> trendingMovies() async {
    Response response = await get(Uri.parse(movieURL));
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      var trendingMovieList = TrendingMovieModel.fromJson(body);
      return trendingMovieList;
    } else {
      throw "Unable to retrieve posts.";
    }
  }

  Future<List<String>> moviesSugesstions({String? query}) async {
    String url = "$searchMoviesURL&query=$query";

    final response = await get(Uri.parse(url));
    final body = json.decode(response.body);

    return body.map<String>((json) {
      final name = json['name'];

      return '$name';
    }).toList();
  }

  Future<SearchModel> searchMovies({String? name}) async {
    String url = "$searchMoviesURL&query=$name";

    final response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      return SearchModel.fromJson(jsonDecode(response.body));
    } else {
      throw '${response.body}: Error: could not search movies';
    }
  }
}
