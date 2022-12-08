import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/message_model.dart';
import 'package:whatsapp_clone/models/user_model.dart';
import 'package:whatsapp_clone/utils/AppColors.dart';
import 'package:whatsapp_clone/widgets/recieved_message_widget.dart';
import 'package:whatsapp_clone/widgets/sent_message_widget.dart';

import '../widgets/bottom_bar_widget.dart';

class InboxPage extends StatefulWidget {
  const InboxPage({Key? key, required this.user, required this.list}) : super(key: key);

  final User user;
  final List<Message> list;

  @override
  State<InboxPage> createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  final ScrollController scrollController = ScrollController();
  void scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 300),
      );
    });
  }
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.main,
        leadingWidth: 80,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Row(
              children: [
                const Icon(Icons.arrow_back, color: Colors.white, size: 24,),
                const SizedBox(width: 4,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,4,4,4),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 20,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset(widget.user.photo, height: 40, width: 40, fit: BoxFit.cover),),
                  ),
                ),
              ],
            ),
          ),
        ),
        title: InkWell(
          onTap: () {

          },
          child: Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.user.name),
                  Text("Last seen ${widget.user.lastOnline}", style: const TextStyle(color: Colors.white70, fontSize: 12),),
                ],
              ),
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.videocam_sharp, color: Colors.white,)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.call, color: Colors.white,)),
          PopupMenuButton(itemBuilder: (context) {
            return [
              const PopupMenuItem(child: Text("View Contact", style: TextStyle(color: Colors.black, fontSize: 16),)),
              const PopupMenuItem(child: Text("Media, links and docs", style: TextStyle(color: Colors.black, fontSize: 16),)),
              const PopupMenuItem(child: Text("Search", style: TextStyle(color: Colors.black, fontSize: 16),)),
              const PopupMenuItem(child: Text("Mute notifications", style: TextStyle(color: Colors.black, fontSize: 16),)),
              const PopupMenuItem(child: Text("Disappearing messages", style: TextStyle(color: Colors.black, fontSize: 16),)),
              const PopupMenuItem(child: Text("Wallpaper", style: TextStyle(color: Colors.black, fontSize: 16),)),
              const PopupMenuItem(child: Text("More", style: TextStyle(color: Colors.black, fontSize: 16),)),
            ];
          })
        ],
      ),
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/background.png"),
              fit: BoxFit.cover,
            ),
          ),
        child: Column(
          children: [
            Expanded(child: ListView.builder(
                controller: scrollController,
                itemCount: widget.list.length,
                itemBuilder: (context, position) {
                  var item = widget.list[position];
                  if(item.type==0) {
                    return InkWell(
                      child: SentMessage(message: widget.list[position]),
                    );
                  }
                  else {
                    return InkWell(
                      child: ReceivedMessage(message: widget.list[position]),
                    );
                  }
                })),
            Align(
              alignment: Alignment.bottomCenter,
              child: BottomBarWidget(onCLicked: (text) {
                setState(() {
                  widget.list.add(Message(text, 0, "Just now", true, false, ""));
                  scrollToBottom();
                });
              },),
            )
          ],
        ),
      ),
      // bottomNavigationBar: const BottomBarWidget(),
    );
  }
}
