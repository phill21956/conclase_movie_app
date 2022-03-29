class Movie {
  int? id;
  final String title;
  final String movieOverview;
  final String image;
  final double? ratings;

  bool isChecked;

  Movie(
      {this.id,
      required this.title,
      required this.movieOverview,
      required this.image,
      this.ratings,
      required this.isChecked});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'title2': movieOverview,
      'image': image,
      'ratings': ratings.toString(),
      'isChecked': isChecked ? 1 : 0,
    };
  }

  @override
  String toString() {
    return 'movie(id : $id, title: $title, title: $movieOverview, image: $image, ratings: $ratings, isChecked: $isChecked)';
  }
}
