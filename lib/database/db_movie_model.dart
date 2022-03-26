class Movie {
  int? id;
  final String title;
  final String image;
  final double ratings;

  bool isChecked;

  Movie(
      {this.id,
      required this.title,
      required this.image,
      required this.ratings,
      required this.isChecked});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'ratings': ratings.toString(),
      'isChecked': isChecked ? 1 : 0,
    };
  }

  @override
  String toString() {
    return 'Todo(id : $id, title: $title, image: $image, ratings: $ratings, isChecked: $isChecked)';
  }
}
