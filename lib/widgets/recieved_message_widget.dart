import 'package:flutter/material.dart';
import 'package:whatsapp_clone/utils/AppColors.dart';
import 'package:whatsapp_clone/widgets/triangle_widget.dart';

import 'dart:math' as math;

class ReceivedMessage extends StatelessWidget {
  const ReceivedMessage({
    Key? key, required this.message, required this.time,
  }) : super(key: key);

  final String message;
  final String time;

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
                padding: const EdgeInsets.all(14),
                decoration: const BoxDecoration(
                  color: AppColors.receivedMessage,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(18),
                    bottomLeft: Radius.circular(18),
                    bottomRight: Radius.circular(18),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      message,
                      style: const TextStyle(color: Colors.black, fontFamily: 'Monstserrat', fontSize: 16),
                    ),
                    const SizedBox(height: 4,),
                    Text(
                      time,
                      style: const TextStyle(color: Colors.black45, fontFamily: 'Monstserrat', fontSize: 12),
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
