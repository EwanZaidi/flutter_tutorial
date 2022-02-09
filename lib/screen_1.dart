import 'package:flutter/material.dart';
import 'package:flutter_tutorial/api/api.dart';
import 'package:flutter_tutorial/models/album.dart';

class ScreenOne extends StatefulWidget {
  final int counter;

  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  ScreenOne({required this.counter});

  @override
  _ScreenOneState createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  int _counter = 0;
  List<String> title = [
    'title 1',
    'title 2',
    'title 3',
    'title 4',
    'title 5',
    'title 6'
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _counter = widget.counter;
    fetchData();
  }

  fetchData() async {
    Album result = await Api.fetchAlbum(); // 1
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.backpack),
        title: const Text("Screen 1"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context, _counter);
            },
            icon: const Icon(Icons.ac_unit),
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisSpacing: 20, crossAxisSpacing: 15),
        itemCount: title.length,
        itemBuilder: (BuildContext ctx, index) {
          return Container(
            alignment: Alignment.center,
            child: Text(title[index]),
            decoration: BoxDecoration(
                color: Colors.amber, borderRadius: BorderRadius.circular(15)),
          );
        },
      ),
    );
  }
}
