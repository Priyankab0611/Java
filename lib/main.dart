import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_demo/Screens/CommonScreen.dart';
import 'package:whatsapp_demo/tabs/Calls.dart';
import 'package:whatsapp_demo/tabs/Camera.dart';
import 'package:whatsapp_demo/tabs/Chats.dart';
import 'package:whatsapp_demo/tabs/Status.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  bool issearch = false;
  var _tabController;
  var _popupvalue;
  var _tabs = <Widget>[
    Tab(
      icon: Icon(
        Icons.camera_alt,
      ),
    ),
    Tab(
      text: ("CHATS"),
    ),
    Tab(
      text: ("STATUS"),
    ),
    Tab(
      text: ("CALLS"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        initialIndex: 1,
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            elevation: 8,
            title: !issearch
                ? Text(
                    'Whatsapp ',
                  )
                : TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        hintText: 'Search Here',
                        hintStyle: TextStyle(color: Colors.white)),
                  ),
            backgroundColor: const Color(0xff12807E),
            bottom: TabBar(
              tabs: _tabs,
              controller: _tabController,
            ),
            actions: <Widget>[
              issearch
                  ? IconButton(
                      icon: Icon(Icons.cancel),
                      onPressed: () {
                        setState(() {
                          this.issearch = false;
                        });
                      },
                    )
                  : IconButton(
                      icon: Icon(
                        Icons.search,
                      ),
                      onPressed: () {
                        setState(() {
                          this.issearch = true;
                        });
                      },
                    ),
              PopupMenuButton(
                onSelected: (value) {
                  Get.to(CommonScreen(
                    title: value,
                  ));
                },
                itemBuilder: (context) {
                  return customPopupMenu(_tabController.index);
                },
              )
            ],
          ),
          body: new TabBarView(
            controller: _tabController,
            children: <Widget>[
              new Camera(),
              new Chats(),
              new Status(),
              new Calls(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    _tabController =
        TabController(length: _tabs.length, vsync: this, initialIndex: 1);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}

List<PopupMenuItem> customPopupMenu(var controller) {
  switch (controller) {
    case 1:
      return <PopupMenuItem>[
        PopupMenuItem(
          child: Text('New Group'),
          value: 'New Group',
        ),
        PopupMenuItem(
          child: Text('New Broadcast'),
          value: 'New Broadcast',
        ),
        PopupMenuItem(
          child: Text('WhatsApp Web'),
          value: 'WhatsApp Web',
        ),
        PopupMenuItem(
          child: Text('Starred messages'),
          value: 'Starred messages',
        ),
        PopupMenuItem(
          child: Text('Settings'),
          value: 'Settings',
        )
      ];
      break;
    case 2:
      return <PopupMenuItem>[
        PopupMenuItem(
          child: Text('Status privacy'),
          value: 'Status privacy',
        ),
        PopupMenuItem(
          child: Text('Settings'),
          value: 'Settings',
        )
      ];
      break;
    case 3:
      return <PopupMenuItem>[
        PopupMenuItem(
          child: Text('Clear call log'),
          value: 'Clear call log',
        ),
        PopupMenuItem(
          child: Text('Settings'),
          value: 'Settings',
        )
      ];
      break;
    default:
      return <PopupMenuItem>[
        PopupMenuItem(
          child: Text('Error'),
          value: 'Error',
        )
      ];
  }
}
