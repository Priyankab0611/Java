import 'package:flutter/material.dart';
import 'package:whatsapp_demo/repo/callsrepo.dart';

class Calls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return SingleItemCallPage();
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: const Color(0xff12807E),
            child: Icon(
              Icons.add_call,
              color: Colors.white,
            ),
          ),
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: const Color(0xff12807E),
            child: Icon(
              Icons.video_call_rounded,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
