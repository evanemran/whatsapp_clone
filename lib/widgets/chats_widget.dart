import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/message_model.dart';
import 'package:whatsapp_clone/models/user_model.dart';
import 'package:whatsapp_clone/pages/inbox_page.dart';
import 'package:whatsapp_clone/utils/AppColors.dart';
import 'package:whatsapp_clone/widgets/user_dialog.dart';

import '../models/chat_model.dart';

class ChatWidget extends StatefulWidget {
  const ChatWidget({Key? key}) : super(key: key);

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {

  List<Message> mList = [
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
    // Message("Hi!. I need a help from you regarding last lecture.", 1, "08:47 pm", true),
    // Message("Hi!. I need a help from you regarding last lecture.", 1, "08:47 pm", true),
    // Message("Hi!. I need a help from you regarding last lecture.", 1, "08:47 pm", true),
    // Message("Hi!. I need a help from you regarding last lecture.", 1, "08:47 pm", true),
    // Message("Hi!. I need a help from you regarding last lecture.", 1, "08:47 pm", true),
  ];

  List<User> chatList = [
    User(0, "Alex", "2 hour ago", "900978459", "assets/alex.png", "Hey there! I am using WhatsApp.",),
    User(0, "Natasha", "2 hour ago", "900978459", "assets/natasha.png", "Hey there! I am using WhatsApp.",),
    User(0, "Maria", "2 hour ago", "900978459", "assets/maria.png", "Hey there! I am using WhatsApp.", ),
    User(0, "Bruce", "2 hour ago", "900978459", "assets/alex.png", "Hey there! I am using WhatsApp.", ),
    User(0, "Alex", "2 hour ago", "900978459", "assets/alex.png", "Hey there! I am using WhatsApp.", ),
    User(0, "Alex", "2 hour ago", "900978459", "assets/alex.png", "Hey there! I am using WhatsApp.", ),
    User(0, "Alex", "2 hour ago", "900978459", "assets/alex.png", "Hey there! I am using WhatsApp.", ),
    User(0, "Alex", "2 hour ago", "900978459", "assets/alex.png", "Hey there! I am using WhatsApp.", ),
    User(0, "Alex", "2 hour ago", "900978459", "assets/alex.png", "Hey there! I am using WhatsApp.", ),
    User(0, "Alex", "2 hour ago", "900978459", "assets/alex.png", "Hey there! I am using WhatsApp.", ),
    User(0, "Alex", "2 hour ago", "900978459", "assets/alex.png", "Hey there! I am using WhatsApp.", ),
    User(0, "Alex", "2 hour ago", "900978459", "assets/alex.png", "Hey there! I am using WhatsApp.", ),
    User(0, "Alex", "2 hour ago", "900978459", "assets/alex.png", "Hey there! I am using WhatsApp.", ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: chatList.length,
        itemBuilder: (context, position) {
          var item = chatList[position];
          var ind = Random().nextInt(mList.length-1);
          return InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => InboxPage(user: item, list: mList)));
            },
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 25,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25.0),
                      child: InkWell(onTap: () {
                        showGeneralDialog(
                          context: context,
                          pageBuilder: (ctx, a1, a2) {
                            return Container();
                          },
                          transitionBuilder: (ctx, a1, a2, child) {
                            var curve = Curves.easeInOut.transform(a1.value);
                            return Transform.scale(
                              scale: curve,
                              child: UserDialog(user: item,),
                            );
                          },
                          transitionDuration: const Duration(milliseconds: 300),
                        );
                      }, child: Image.asset(item.photo, height: 60, width: 60, fit: BoxFit.cover),),),
                  ),
                  const SizedBox(width: 10,),
                  Expanded(child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(child: Text(item.name, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),)),
                          Text(mList[ind].time, style: TextStyle(color: (mList[ind].type==1 && !mList[ind].isRead) ? Colors.green : Colors.black45, fontSize: 14),)
                        ],
                      ),
                      const SizedBox(height: 8,),
                      Row(
                        children: [
                          Visibility(visible: mList[ind].type==0, child: Padding(padding: const EdgeInsets.only(right: 8), child: Image.asset("assets/read.png", color: mList[ind].isRead ? Colors.blue : Colors.black45, height: 16, width: 16,),)),
                          Expanded(child: Text(mList[ind].text, maxLines: 1, style: const TextStyle(color: Colors.black45, fontWeight: FontWeight.normal, fontSize: 16,),)),
                          const SizedBox(width: 8,),
                          Visibility(visible: !mList[ind].isRead && mList[ind].type==1,child: const CircleAvatar(backgroundColor: Colors.green, radius: 10 ,child: Text("2", style: TextStyle(color: Colors.white, fontSize: 14),),),)
                        ],
                      )
                    ],
                  ))
                ],
              ),
            ),
          );


          /*return ListTile(
            title: Text(item.name.toString(), style: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
            subtitle: Text(item.message, style: const TextStyle(color: Colors.black45, fontSize: 16, fontWeight: FontWeight.normal),),
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 30,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Image.asset(item.image, height: 80, width: 80, fit: BoxFit.cover),),
            ),
          );*/
        });
  }
}
