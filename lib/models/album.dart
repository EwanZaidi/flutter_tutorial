class Album {
  int userId;
  int id;
  String title;

  Album({required this.userId, required this.id, required this.title});

  static Album fromMap(Map<String, dynamic> data) {
    final Album album =
        Album(userId: data['userId'], id: data['id'], title: data['title']);

    return album;
  }
}

class AlbumList {}
