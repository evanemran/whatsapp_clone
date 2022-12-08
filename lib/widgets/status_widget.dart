import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/status_model.dart';

class StatusWidget extends StatefulWidget {
  const StatusWidget({Key? key}) : super(key: key);

  @override
  State<StatusWidget> createState() => _StatusWidgetState();
}

class _StatusWidgetState extends State<StatusWidget> {

  List<StatusModel> sList = [
    StatusModel("Ronin", "Today 12:53 pm", "assets/alex.png", "assets/knapsack.png"),
    StatusModel("Natasha", "Today 07:15 pm", "assets/natasha.png", "assets/knapsack.png"),
    StatusModel("Maria", "Yesterday 09:45 am", "assets/maria.png", "assets/knapsack.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.green,
                    radius: 27,
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(27.0),
                        child: Image.asset("assets/evan.png", height: 60, width: 60, fit: BoxFit.cover),),
                    ),
                  ),
                  Positioned(bottom: 0, right: 0, child: Transform.translate(offset: const Offset(0, 0),
                    child: const CircleAvatar(backgroundColor: Colors.white, radius: 12,child: Padding(padding: EdgeInsets.all(0),
                    child: Icon(Icons.add_circle, color: Colors.green, size: 24,)
                    ,),),))
                ],
              ),
              const SizedBox(width: 10,),
              Expanded(child: Center(
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Expanded(child: Text("My status", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),)),
                      ],
                    ),
                    const SizedBox(height: 8,),
                    Row(
                      children: const [
                        Expanded(child: Text("Tap to add status update", maxLines: 1, style: TextStyle(color: Colors.black45, fontWeight: FontWeight.normal, fontSize: 16,),)),
                      ],
                    )
                  ],
                ),
              ))
            ],
          ),
        ),
        const Padding(padding: EdgeInsets.fromLTRB(16, 8, 8, 8), child: Text("Recent updates", style: TextStyle(color: Colors.black45, fontSize: 16, fontWeight: FontWeight.bold),),),
        Expanded(child: ListView.builder(
            itemCount: sList.length,
            itemBuilder: (context, position) {
              var item = sList[position];

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
                        radius: 27,
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(27.0),
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
                                Expanded(child: Text(item.time, maxLines: 1, style: const TextStyle(color: Colors.black45, fontWeight: FontWeight.normal, fontSize: 16,),)),
                              ],
                            )
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
              );
            }))
      ],
    );
  }
}
