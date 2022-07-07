import 'dart:convert';
import 'dart:io';
import 'package:conclase_movie_app/model/search_model.dart';
import 'package:conclase_movie_app/model/trending_movie_model.dart';
import 'package:conclase_movie_app/model/upcoming_movie_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../const/key.dart';

mixin MovieApi {
  var data = [];
  List<SearchModel> results = [];
  static http.Client client = http.Client();

  Future<UpcomingMoviesModel> getUpcomingMovies() async {
    try {
      Response response = await client.get(Uri.parse(upcomingMovieURL));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var upcomingMovieList = UpcomingMoviesModel.fromJson(body);
        return upcomingMovieList;
      } else {
        throw "Unable to retrieve posts.";
      }
    } on SocketException {
      throw 'You are not connected to the internet';
    } catch (e) {
      throw e.toString();
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

  Future<SearchModel> searchMovies({String? query}) async {
    String url = "$searchMoviesURL&query=$query";
    try {
      final response = await get(Uri.parse(url));
      if (response.statusCode == 200) {
        return SearchModel.fromJson(jsonDecode(response.body));
      } else {
        throw '${response.body}: Error: could not search movies';
      }
    } on SocketException {
      throw 'You are not connected to the internet';
    } catch (e) {
      throw e.toString();
    }
  }
}
