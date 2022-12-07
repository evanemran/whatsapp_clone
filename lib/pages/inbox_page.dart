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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.main,
        title: Row(
          children: [
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
            Text(widget.user.name)
          ],
        ),
        // leading: Padding(
        //   padding: const EdgeInsets.all(4),
        //   child: CircleAvatar(
        //     backgroundColor: Colors.white,
        //     radius: 20,
        //     child: ClipRRect(
        //       borderRadius: BorderRadius.circular(20.0),
        //       child: Image.asset(widget.user.photo, height: 40, width: 40, fit: BoxFit.cover),),
        //   ),
        // ),
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
                itemCount: widget.list.length,
                itemBuilder: (context, position) {
                  var item = widget.list[position];
                  if(item.type==0) {
                    return InkWell(
                      child: SentMessage(message: widget.list[position].text, time: widget.list[position].time,),
                    );
                  }
                  else {
                    return InkWell(
                      child: ReceivedMessage(message: widget.list[position].text, time: widget.list[position].time,),
                    );
                  }
                })),
            const Align(
              alignment: Alignment.bottomCenter,
              child: BottomBarWidget(),
            )
          ],
        ),
      ),
      // bottomNavigationBar: const BottomBarWidget(),
    );
  }
}
