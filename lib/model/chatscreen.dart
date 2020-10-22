import 'package:flutter/material.dart';
import 'package:whatsapp_demo/model/messagelist.dart';
import 'package:whatsapp_demo/model/user_model.dart';

class ChatScreen extends StatefulWidget {
  final User user;

  ChatScreen({this.user});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  _chatBubble(Message message, bool isMe, bool isSameUser) {
    if (isMe) {
      return Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topRight,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.80,
              ),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Text(
                message.text,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          !isSameUser
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      message.time,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black45,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                )
              : Container(
                  child: null,
                ),
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.80,
              ),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xffECE5DD),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      color: Colors.white.withOpacity(0), spreadRadius: 2),
                ],
              ),
              child: Text(
                message.text,
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
            ),
          ),
          !isSameUser
              ? Row(
                  children: <Widget>[
                    Text(
                      message.time,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black45,
                      ),
                    ),
                  ],
                )
              : Container(
                  child: null,
                ),
        ],
      );
    }
  }

  _sendMessageArea() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      height: 70,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.emoji_symbols),
            onPressed: () {},
            iconSize: 20,
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration.collapsed(
                hintText: 'Send a message..',
              ),
              textCapitalization: TextCapitalization.sentences,
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            iconSize: 20,
            color: Theme.of(context).primaryColor,
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.attach_file_sharp),
            onPressed: () {},
            iconSize: 20,
          ),
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: () {},
          ),
          SizedBox(
            width: 5.0,
          ),
          Container(
            width: 50.0,
            height: 50.0,
            child: Icon(Icons.mic),
            decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(100.0)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int prevUserId;
    return Scaffold(
        backgroundColor: Color(0xFFF6F6F6),
        appBar: AppBar(
          brightness: Brightness.dark,
          centerTitle: true,
          titleSpacing: -15.0,
          title: ListTile(
            leading: CircleAvatar(
              radius: 15.0,
              backgroundImage: AssetImage("assets/assets/Profile.png"),
            ),
            title: Text(
              widget.user.name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text("Last seen today at 5:11 pm"),
          ),
          actions: <Widget>[
            Icon(Icons.videocam),
            SizedBox(
              width: 25.0,
            ),
            Icon(Icons.call),
            SizedBox(
              width: 25.0,
            ),
            Icon(Icons.more_vert)
          ],
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                reverse: true,
                padding: EdgeInsets.all(20),
                itemCount: messages.length,
                itemBuilder: (BuildContext context, int index) {
                  final Message message = messages[index];
                  final bool isMe = message.sender.id == currentUser.id;
                  final bool isSameUser = prevUserId == message.sender.id;
                  prevUserId = message.sender.id;
                  return _chatBubble(message, isMe, isSameUser);
                },
              ),
            ),
            _sendMessageArea(),
          ],
        ));
  }
}
