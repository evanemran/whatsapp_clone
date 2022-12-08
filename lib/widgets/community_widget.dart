import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/utils/AppColors.dart';

class CommunityWidget extends StatefulWidget {
  const CommunityWidget({Key? key}) : super(key: key);

  @override
  State<CommunityWidget> createState() => _CommunityWidgetState();
}

class _CommunityWidgetState extends State<CommunityWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset("assets/community.png", height: 200,),
        const Text("Introducing communities", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),),
        const SizedBox(height: 12,),
        const Text("Easily organise your related groups and send announcements. Now, your communities, like neighbourhoods or schools, can have their own space.",
        style: TextStyle(color: Colors.black45, fontSize: 16,), textAlign: TextAlign.center,),
        const SizedBox(height: 20,),
        ElevatedButton(onPressed: () {}, style: ButtonStyle(backgroundColor: MaterialStateProperty.all(AppColors.main)), child: const Padding(padding: EdgeInsets.only(left: 30, right: 30), child: Text("START YOUR COMMUNITY"),))
      ],
    );
  }
}
