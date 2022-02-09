import 'dart:convert';

import 'package:flutter_tutorial/models/album.dart';
import 'package:http/http.dart' as http;

class Api {
  static Future<Album> fetchAlbum() async {
    var result = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

    var jsonData = jsonDecode(result.body);
    Album album = Album.fromMap(jsonData);
    return album;
  }
}
