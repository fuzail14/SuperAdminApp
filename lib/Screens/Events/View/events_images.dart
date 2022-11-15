import 'package:flutter/material.dart';
import '../../../Constants/constants.dart';

class EventImages extends StatefulWidget {
  const EventImages({Key? key}) : super(key: key);
  @override
  State<EventImages> createState() => _EventImagesState();
}

class _EventImagesState extends State<EventImages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Images'),
        backgroundColor: primaryColor,
      ),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 10,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.teal[100],
            child: const Text("image here"),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.teal[200],
            child: const Text('image here'),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.teal[300],
            child: const Text('image here'),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.teal[400],
            child: const Text('Who scream'),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.teal[500],
            child: const Text('Revolution is coming...'),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.teal[600],
            child: const Text('Revolution, they...'),
          ),
        ],
      ),
    );
  }
}
