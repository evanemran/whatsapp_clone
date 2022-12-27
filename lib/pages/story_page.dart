import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/status_model.dart';

import '../utils/AppColors.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({Key? key, required this.model}) : super(key: key);

  final StatusModel model;

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> with TickerProviderStateMixin {
  late AnimationController controller;

  var duration = const Duration(seconds: 5);

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: duration,
    )..addListener(() {
        setState(() {
          if (controller.isCompleted) {
            Navigator.pop(context);
          }
        });
      });
    controller.forward();
    // controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _onLongPressStart(LongPressStartDetails details) {
    controller.stop();
  }

  void _onLongPressEnd(LongPressEndDetails details) {
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        decoration: const BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage("assets/story.jpg"),
            fit: BoxFit.fitWidth,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            GestureDetector(
              onLongPressStart: _onLongPressStart,
              onLongPressEnd: _onLongPressEnd,
              child: Column(
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  LinearProgressIndicator(
                    minHeight: 2,
                    value: controller.value,
                    color: Colors.white,
                    backgroundColor: Colors.black,
                    semanticsLabel: 'Linear progress indicator',
                  ),
                  AppBar(
                    backgroundColor: Colors.transparent,
                    leadingWidth: 80,
                    leading: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 24,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 4, 4, 4),
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 20,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Image.asset(widget.model.image,
                                      height: 40, width: 40, fit: BoxFit.cover),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    title: InkWell(
                      onTap: () {},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.model.name),
                          Text(
                            widget.model.time,
                            style: const TextStyle(
                                color: Colors.white70, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      PopupMenuButton(itemBuilder: (context) {
                        return [
                          const PopupMenuItem(
                              child: Text(
                                "View Contact",
                                style: TextStyle(color: Colors.black, fontSize: 16),
                              )),
                          const PopupMenuItem(
                              child: Text(
                                "Media, links and docs",
                                style: TextStyle(color: Colors.black, fontSize: 16),
                              )),
                          const PopupMenuItem(
                              child: Text(
                                "Search",
                                style: TextStyle(color: Colors.black, fontSize: 16),
                              )),
                          const PopupMenuItem(
                              child: Text(
                                "Mute notifications",
                                style: TextStyle(color: Colors.black, fontSize: 16),
                              )),
                          const PopupMenuItem(
                              child: Text(
                                "Disappearing messages",
                                style: TextStyle(color: Colors.black, fontSize: 16),
                              )),
                          const PopupMenuItem(
                              child: Text(
                                "Wallpaper",
                                style: TextStyle(color: Colors.black, fontSize: 16),
                              )),
                          const PopupMenuItem(
                              child: Text(
                                "More",
                                style: TextStyle(color: Colors.black, fontSize: 16),
                              )),
                        ];
                      })
                    ],
                  ),
                ],
              ),
            ),
            Positioned(bottom: 0 ,child: Column(
              children: [
                Image.asset(
                  "assets/upload.png",
                  color: Colors.white,
                  width: 24,
                  height: 24,
                ),
                const SizedBox(height: 8,),
                const Text("Reply", style: TextStyle(color: Colors.white),),
                const SizedBox(height: 8,),
              ],
            ))
            /*Positioned(
                bottom: 0,
                child: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          child: Image.asset(
                            "assets/upload.png",
                            color: Colors.white,
                            width: 24,
                            height: 24,
                          ))
                    ],
                  ),
                ))*/
          ],
        ),
      ),
    );
  }
}
