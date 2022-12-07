import 'package:flutter/material.dart';
import 'package:whatsapp_clone/utils/AppColors.dart';
import 'package:whatsapp_clone/widgets/triangle_widget.dart';

class SentMessage extends StatelessWidget {
  const SentMessage({Key? key, required this.message, required this.time,}) : super(key: key);

  final String message;
  final String time;

  @override
  Widget build(BuildContext context) {
    final messageTextGroup = Flexible(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Container(
                padding: const EdgeInsets.all(14),
                decoration: const BoxDecoration(
                  color: AppColors.sentMessage,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18),
                    bottomLeft: Radius.circular(18),
                    bottomRight: Radius.circular(18),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      message,
                      style: const TextStyle(color: Colors.black, fontFamily: 'Monstserrat', fontSize: 16),
                    ),
                    const SizedBox(height: 4,),
                    Text(
                      time,textAlign: TextAlign.end,
                      style: const TextStyle(color: Colors.black, fontFamily: 'Monstserrat', fontSize: 12),
                    )
                  ],
                ),
              ),
            ),
            CustomPaint(painter: Triangle(AppColors.sentMessage)),
          ],
        ));

    return Padding(
      padding: const EdgeInsets.only(right: 18.0, left: 50, top: 5, bottom: 5),
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