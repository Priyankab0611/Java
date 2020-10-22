import 'package:flutter/material.dart';

class CommonScreen extends StatefulWidget {
  final title;
  CommonScreen({this.title});
  @override
  _CommonScreenState createState() => _CommonScreenState();
}

class _CommonScreenState extends State<CommonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[800],
        title: Text(widget.title ?? 'Settings'),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add_photo_alternate),
      //   onPressed: () {},
      // ),
    );
  }
}
