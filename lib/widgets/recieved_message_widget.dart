import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/message_model.dart';
import 'package:whatsapp_clone/utils/AppColors.dart';
import 'package:whatsapp_clone/widgets/triangle_widget.dart';

import 'dart:math' as math;

class ReceivedMessage extends StatelessWidget {
  const ReceivedMessage({
    Key? key, required this.message,
  }) : super(key: key);

  final Message message;

  @override
  Widget build(BuildContext context) {
    final messageTextGroup = Flexible(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(math.pi),
              child: CustomPaint(
                painter: Triangle(AppColors.receivedMessage),
              ),
            ),
            Flexible(
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: AppColors.receivedMessage,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Visibility(visible: message.haveAttachment, child: Image.asset(message.attachment, width: 220, height: 350, fit: BoxFit.cover,)),
                    Text(
                      message.text,
                      style: const TextStyle(color: Colors.black, fontFamily: 'Monstserrat', fontSize: 16),
                    ),
                    const SizedBox(height: 4,),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          message.time,textAlign: TextAlign.end,
                          style: const TextStyle(color: Colors.black, fontFamily: 'Monstserrat', fontSize: 12),
                        ),
                        // const SizedBox(width: 8,),
                        // Image.asset("assets/read.png", color: Colors.blue, width: 14, height: 14,)
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ));

    return Padding(
      padding: const EdgeInsets.only(right: 50.0, left: 18, top: 5, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          const SizedBox(height: 30),
          messageTextGroup,
        ],
      ),
    );
  }
}
