import 'package:conclase_movie_app/screen/my_list_page/my_list_page.dart';
import 'package:flutter/material.dart';

import '../movie_page/movie_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xff0D0F14),
        appBar: AppBar(
          elevation: 0,
          bottom: const TabBar(indicatorColor: Color(0xffF3AC4A), tabs: [
            Tab(text: 'Movies'),
            Tab(text: 'My List'),
          ]),
        ),
        body: const TabBarView(children: [
          MoviePage(),
          MyListPage(),
        ]),
      ),
    );
  }
}
