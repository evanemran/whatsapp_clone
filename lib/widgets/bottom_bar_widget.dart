import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/AppColors.dart';

class BottomBarWidget extends StatefulWidget {
  const BottomBarWidget({Key? key, required this.onCLicked}) : super(key: key);

  final Function(String) onCLicked;

  @override
  State<BottomBarWidget> createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {

  final textEditingController = TextEditingController();
  var fabIcon = Icons.mic;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(child: Container(
            margin: const EdgeInsets.all(0),
            padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(50))
            ),
            child: Row(
              children: [
                const Icon(Icons.emoji_emotions_outlined, color: Colors.blueGrey,),
                const SizedBox(width: 10,),
                Expanded(child: TextField(
                  controller: textEditingController,
                  onChanged: (text) {
                    if(textEditingController.text.trim() == "") {
                      setState(() {
                        fabIcon = Icons.mic;
                      });
                    }
                    else{
                      setState(() {
                        fabIcon = Icons.send_rounded;
                      });
                    }
                  },
                  style: const TextStyle(color: Colors.black, fontSize: 18),
                  decoration: InputDecoration.collapsed(
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800], fontSize: 18),
                      hintText: "Message",
                      fillColor: Colors.white70),

                ),),
                // IconButton(onPressed: () {}, icon: const Icon(Icons.attachment, color: Colors.blueGrey,),),
                const SizedBox(width: 10,),
                const Icon(Icons.attachment, color: Colors.blueGrey,),
                const SizedBox(width: 10,),
                const Icon(Icons.camera_alt, color: Colors.blueGrey,),
              ],
            ),
          )),
          FloatingActionButton.small(
            backgroundColor: AppColors.main,
            tooltip: '',
            child: Icon(fabIcon, color: Colors.white,),
              onPressed: () {
              if(textEditingController.text.trim().isNotEmpty) {
                widget.onCLicked.call(textEditingController.text.toString());
                textEditingController.clear();
              }
              },
          )
        ],
      ),
    );
  }
}
