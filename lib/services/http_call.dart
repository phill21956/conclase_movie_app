import 'dart:convert';

import 'package:http/http.dart';

import '../const/key.dart';
import '../model/movie_model.dart';

mixin MovieApi {
  Future<MovieModel> getMovies() async {
    Response response = await get(Uri.parse(movieURL));
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);

      var movieList = MovieModel.fromJson(body);
      return movieList;
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}





// Future<List<MovieModel>> getMovies() async {
//   Response response = await get(Uri.parse(movieURL));
//   try {
//     if (response.statusCode == 200) {
//       List<dynamic> body = jsonDecode(response.body);

//       List<MovieModel> movieList = body
//           .map(
//             (dynamic item) => MovieModel.fromJson(item),
//           )
//           .toList();
//       return movieList;
//     }
//   } catch (e) {
//     throw 'Unable to retrieve posts';
//   }
//   return [];
// }
