import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/utils/AppColors.dart';

import '../models/call_model.dart';

class CallsWidget extends StatefulWidget {
  const CallsWidget({Key? key}) : super(key: key);

  @override
  State<CallsWidget> createState() => _CallsWidgetState();
}

class _CallsWidgetState extends State<CallsWidget> {
  List<CallModel> cList = [
    CallModel("Natasha", "Today 12:01 am", "assets/natasha.png", true, false),
    CallModel("Alex", "Yesterday 09:21 pm", "assets/alex.png", false, false),
    CallModel("Maria", "Yesterday 07:13 am", "assets/maria.png", false, true),
    CallModel("Natasha", "Today 12:01 am", "assets/natasha.png", true, false),
    CallModel("Natasha", "Today 12:01 am", "assets/natasha.png", true, true),
    CallModel("Natasha", "Today 12:01 am", "assets/natasha.png", true, false),
    CallModel("Natasha", "Today 12:01 am", "assets/natasha.png", true, false),
    CallModel("Natasha", "Today 12:01 am", "assets/natasha.png", true, false),
    CallModel("Natasha", "Today 12:01 am", "assets/natasha.png", true, false),
    CallModel("Natasha", "Today 12:01 am", "assets/natasha.png", true, false),
    CallModel("Natasha", "Today 12:01 am", "assets/natasha.png", true, false),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            //Navigator.of(context).push(MaterialPageRoute(builder: (context) => InboxPage(user: item, list: mList)));
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.main,
                  radius: 27,
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: Image.asset("assets/link.png",
                      height: 20, width: 20, fit: BoxFit.fitWidth, color: Colors.white,),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Center(
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Expanded(
                              child: Text(
                            "Create call link",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          )),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: const [
                          Expanded(
                              child: Text(
                            "Share a link for your WhatsApp call",
                            maxLines: 1,
                            style: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                            ),
                          )),
                        ],
                      )
                    ],
                  ),
                ))
              ],
            ),
          ),
        ),
        const Padding(padding: EdgeInsets.fromLTRB(16, 8, 8, 8), child: Text("Recent", style: TextStyle(color: Colors.black45, fontSize: 16, fontWeight: FontWeight.bold),),),
        Expanded(child: ListView.builder(
            itemCount: cList.length,
            itemBuilder: (context, position) {
              var item = cList[position];

              return InkWell(
                onTap: () {
                  //Navigator.of(context).push(MaterialPageRoute(builder: (context) => InboxPage(user: item, list: mList)));
                },
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.green,
                        radius: 25,
                        child: Padding(
                          padding: const EdgeInsets.all(0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25.0),
                            child: Image.asset(item.image, height: 60, width: 60, fit: BoxFit.cover),),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Expanded(child: Center(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(child: Text(item.name, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),)),
                              ],
                            ),
                            const SizedBox(height: 8,),
                            Row(
                              children: [
                                Icon(item.isIncoming ? Icons.call_received : Icons.call_made, color: item.isIncoming ? Colors.red : Colors.green, size: 16,),
                                const SizedBox(width: 4,),
                                Expanded(child: Text(item.time, maxLines: 1, style: const TextStyle(color: Colors.black45, fontWeight: FontWeight.normal, fontSize: 14,),)),
                              ],
                            )
                          ],
                        ),
                      ),
                      ),
                      Icon(item.isVideoCall ? Icons.videocam_sharp : Icons.call, color: AppColors.main,)
                    ],
                  ),
                ),
              );
            }))
      ],
    );
  }
}
