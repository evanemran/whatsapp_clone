import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/utils/AppColors.dart';
import 'package:whatsapp_clone/widgets/calls_widget.dart';
import 'package:whatsapp_clone/widgets/chats_widget.dart';
import 'package:whatsapp_clone/widgets/community_widget.dart';
import 'package:whatsapp_clone/widgets/status_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  late TabController _controller;
  int _selectedIndex = 0;
  var fabIcon = Icons.message;
  bool isSearchVisible = true;

  @override
  void initState() {
    super.initState();
    _controller = TabController(initialIndex: 1, length: 4, vsync: this);

    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.index;
        switch (_selectedIndex) {
          case 0:
            fabIcon = Icons.group;
            isSearchVisible = false;
            break;
          case 1:
            fabIcon = Icons.message;
            isSearchVisible = true;
            break;
          case 2:
            fabIcon = Icons.camera_alt;
            isSearchVisible = true;
            break;
          case 3:
            fabIcon = Icons.add_ic_call_outlined;
            isSearchVisible = true;
            break;
        }
      });
      // print("Selected Index: " + _controller.index.toString());
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.main,
          title: const Text(
            "WhatsApp",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Image.asset("assets/camera.png", width: 20, height: 20, color: Colors.white,)),
            Visibility(visible: isSearchVisible, child: IconButton(onPressed: () {}, icon: Image.asset("assets/search.png", width: 20, height: 20, color: Colors.white,))),
            PopupMenuButton(itemBuilder: (context) {
              return [
                const PopupMenuItem(child: Text("New group", style: TextStyle(color: Colors.black, fontSize: 16),)),
                const PopupMenuItem(child: Text("New broadcast", style: TextStyle(color: Colors.black, fontSize: 16),)),
                const PopupMenuItem(child: Text("Linked devices", style: TextStyle(color: Colors.black, fontSize: 16),)),
                const PopupMenuItem(child: Text("Starred messages", style: TextStyle(color: Colors.black, fontSize: 16),)),
                const PopupMenuItem(child: Text("Settings", style: TextStyle(color: Colors.black, fontSize: 16),)),
              ];
            })
          ],
          bottom: TabBar(
            controller: _controller,
            indicatorColor: Colors.white,
            tabs: const [
              SizedBox(height: 50, width: 30, child: Icon(Icons.groups, size: 24,),),
              Expanded(child: Tab(
                text: "CHATS",
              )),
              Tab(
                text: "STATUS",
              ),
              Tab(
                text: "CALLS",
              ),
            ],
          )),
      body: TabBarView(
          controller: _controller,
          children: const [
            CommunityWidget(),
            ChatWidget(),
            StatusWidget(),
            CallsWidget(),
          ]),
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.main,
          tooltip: '',
          child: Icon(fabIcon),
          onPressed: () {}),
    );
  }
}
