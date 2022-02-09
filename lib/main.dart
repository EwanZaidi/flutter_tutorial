import 'package:flutter/material.dart';
import 'package:flutter_tutorial/api/api.dart';
import 'package:flutter_tutorial/models/album.dart';
import 'package:flutter_tutorial/screen/auth_selection.dart';
import 'package:flutter_tutorial/screen_1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var abc = "def";
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: abc,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  TextEditingController _titleController = TextEditingController();
  List<Album> _albums = [];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void updateAlbum() async {
    String title = _titleController.text;
    Map<String, dynamic> data = {'title': title};
    var result = await Api.updateAlbum(data);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllAlbum();
  }

  void getAllAlbum() async {
    _albums.addAll(await Api.fetchAlbumList());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        // physics: ClampingScrollPhysics(),
        itemCount: _albums.length,
        itemBuilder: (context, int index) {
          return Row(
            children: [
              Text((index + 1).toString()),
              const SizedBox(
                width: 20,
              ),
              Flexible(
                child: Text(
                  _albums[index].title,
                  maxLines: 2,
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: updateAlbum,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
