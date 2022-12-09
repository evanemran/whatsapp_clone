import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/user_model.dart';
import 'package:whatsapp_clone/utils/AppColors.dart';

class CallPage extends StatefulWidget {
  const CallPage({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  State<CallPage> createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ExpandableBottomSheet(
        background: Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/call_bg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.lock, color: Colors.white54, size: 14,),
                  SizedBox(width: 8,),
                  Text("End-to-end encrypted", style: TextStyle(color: Colors.white54, fontSize: 14),)
                ],
              ),
              const SizedBox(height: 20,),
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: Image.asset(widget.user.photo, height: 100, width: 100, fit: BoxFit.cover),),
              ),
              const SizedBox(height: 20, ),
              Text(widget.user.name, style: const TextStyle(color: Colors.white, fontSize: 30),),
              const SizedBox(height: 20, ),
              const Text("Ringing", style: TextStyle(color: Colors.white54, fontSize: 16),)
            ],
          ),
        ),
        persistentHeader: Container(
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
          color: AppColors.blueGrey,
          child: Center(
            child: Row(
              children: [
                Expanded(child: IconButton(onPressed: () {}, icon: const Icon(Icons.volume_up_sharp, color: Colors.white,))),
                Expanded(child: IconButton(onPressed: () {}, icon: const Icon(Icons.videocam, color: Colors.white54,))),
                Expanded(child: IconButton(onPressed: () {}, icon: const Icon(Icons.mic_off_sharp, color: Colors.white,))),
                Expanded(child: CircleAvatar(backgroundColor: Colors.red, radius: 24, child: Image.asset("assets/call_end.png", color: Colors.white, width: 24, height: 24,),))
              ],
            ),
          ),
        ),
        expandableContent: Container(
          padding: EdgeInsets.all(16),
          height: 180,
          color: AppColors.blueGrey,
          child: Column(
            children: [
              Row(
                children: const [
                  CircleAvatar(radius: 22, backgroundColor: AppColors.main, child: Icon(Icons.person_add, color: Colors.white,),),
                  SizedBox(width: 16,),
                  Text("Add participant", style: TextStyle(color: Colors.white, fontSize: 16),)
                ],
              ),
              const SizedBox(height: 16,),
              Row(
                children: [
                  CircleAvatar(radius: 22, backgroundColor: AppColors.main, child: ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: Image.asset(widget.user.photo, height: 100, width: 100, fit: BoxFit.cover),),),
                  const SizedBox(width: 16,),
                  Text(widget.user.name, style: const TextStyle(color: Colors.white54, fontSize: 16),)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
