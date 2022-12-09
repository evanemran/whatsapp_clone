import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/message_model.dart';
import 'package:whatsapp_clone/models/user_model.dart';
import 'package:whatsapp_clone/utils/AppColors.dart';
import 'package:whatsapp_clone/widgets/recieved_message_widget.dart';
import 'package:whatsapp_clone/widgets/sent_message_widget.dart';

import '../widgets/bottom_bar_widget.dart';

class InboxPage extends StatefulWidget {
  const InboxPage({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  State<InboxPage> createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  final ScrollController scrollController = ScrollController();
  List<Message> list = [
    Message("Hi!. I need a help from you regarding last lecture.", 1, "08:47 pm", false, false, ""),
    Message("Hey, sure. I have the notes. how can i help you?", 0, "08:52 pm", true, false, ""),
    Message("I didn't understand the Knapsack algorithm", 1, "08:55 pm", true, false, ""),
    Message("Can you help me to understand the simulation?", 1, "08:56 pm", true, false, ""),
    Message("It's not that complicated. You can call me and I can show you that.", 0, "09:25 pm", true, false, ""),
    Message("Alright, calling you rn.", 1, "09:30 pm", true, false, ""),
    Message("In a Call", 2, "09:30 pm", true, false, ""),
    Message("Send me the photo", 2, "09:30 pm", true, false, ""),
    Message("Here it is", 0, "09:30 pm", true, true, "assets/knapsack.png"),
    Message("Thank you so much for helping. ", 1, "10:47 pm", true, false, ""),
    Message("Mention not. Will you attend tomorrow's lecture?.", 0, "10:50 pm", true, false, ""),
    Message("Yes!", 1, "11:01 pm", true, false, ""),
    Message("Aren't you coming???", 1, "11:02 pm", true, false, ""),
    Message("No, I have an important meeting that time. Can you please take the notes for me.", 0, "11:58 pm", true, false, ""),
    Message("Alright I'll do that. ", 1, "08:47 pm", true, false, ""),
    Message("Thanks a lot. ", 0, "12:30 am", true, false, ""),
  ];


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
                itemCount: list.length,
                itemBuilder: (context, position) {
                  var item = list[position];
                  if(item.type==0) {
                    return InkWell(
                      child: SentMessage(message: list[position]),
                    );
                  }
                  else {
                    return InkWell(
                      child: ReceivedMessage(message: list[position]),
                    );
                  }
                })),
            Align(
              alignment: Alignment.bottomCenter,
              child: BottomBarWidget(onCLicked: (text) {
                setState(() {
                  list.add(Message(text, 0, "Just now", true, false, ""));
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
