import 'package:conclase_movie_app/services/http_call.dart';
import 'package:flutter/material.dart';



class MyListPage extends StatefulWidget {
  const MyListPage({Key? key}) : super(key: key);

  @override
  State<MyListPage> createState() => _MyListPageState();
}

class _MyListPageState extends State<MyListPage> with MovieApi {
  // late Future<MovieModel> _movieList;

  // @override
  // void initState() {
  //   _movieList = getMovies();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        
        
        );
  }
}
