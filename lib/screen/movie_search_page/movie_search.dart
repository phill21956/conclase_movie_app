import 'package:conclase_movie_app/model/search_model.dart';
import 'package:conclase_movie_app/services/http_call.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'widgets/build_result_widget.dart';

class SearchMovies extends SearchDelegate {
  final MovieApi movieApi = Get.put(MovieApi());

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
              showSuggestions(context);
            }
          })
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => close(context, null),
      );

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<SearchModel>(
        future: movieApi.searchMovies(query: query),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(
                child: Text('Loading'),
              );
            default:
              if (snapshot.hasError) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Error searching for movie!',
                    style: TextStyle(fontSize: 20.sp),
                  ),
                );
              } else if (snapshot.data!.results.isEmpty) {
                return buildNoSuggestions();
              } else {
                List<Result>? data = snapshot.data!.results;
                return BuildResults(data: data);
              }
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<SearchModel>(
      future: movieApi.searchMovies(query: query),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text('Your search field may be empty'),
          );
        }
        if (snapshot.data?.results == null) {
          return const Center(child: Text('Your search returned nothing'));
          // ErrorListState(text: 'Your search returned nothing');
        }
        return ListView.builder(
          itemCount: snapshot.data?.results.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(snapshot.data!.results[index].title),
              onTap: () {
                query = snapshot.data!.results[index].title;
                showResults(context);
              },
            );
          },
        );
      },
    );
  }

  Widget buildNoSuggestions() => const Center(
        child: Text(
          'No suggestions!',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      );
}
