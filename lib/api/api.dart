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

  static Future<dynamic> updateAlbum(Map<String, dynamic> data) async {
    var result = await http.put(
      Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    return jsonDecode(result.body);
  }

  static Future<List<Album>> fetchAlbumList() async {
    var result = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));

    var jsonData = jsonDecode(result.body);
    List<Album> albums = AlbumList.fromMap(jsonData);
    return albums;
  }
}
