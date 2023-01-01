import 'package:conclase_movie_app/model/upcoming_movie_model.dart';
import 'package:conclase_movie_app/services/http_call.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

MovieApi movieApi = MovieApi();
final greetingsProvider = Provider<dynamic>((ref) {
  return '';
});

final movieProvider = FutureProvider<UpcomingMoviesModel>((ref) async{
  return movieApi.getUpcomingMovies();
});

