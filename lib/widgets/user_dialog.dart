import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/user_model.dart';
import 'package:whatsapp_clone/utils/AppColors.dart';

class UserDialog extends StatefulWidget {
  const UserDialog({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  State<UserDialog> createState() => _UserDialogState();
}

class _UserDialogState extends State<UserDialog> {

  Widget buildDialog(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      insetPadding: EdgeInsets.zero,
      actionsPadding: EdgeInsets.zero,
      buttonPadding: EdgeInsets.zero,
      iconPadding: EdgeInsets.zero,
      content: Stack(
        children: [
          Container(
            width: 300,
            height: 350,
            decoration: BoxDecoration(
              color: Colors.green,
                image: DecorationImage(
                  image: AssetImage(widget.user.photo),
                  fit: BoxFit.cover,
                )
            ),
          ),
          Positioned(bottom: 0,child: Container(
            color: Colors.white,
            width: 300,
            height: 50,
            child: Row(
              children: [
                Expanded(child: IconButton(onPressed: () {}, icon: const Icon(Icons.message, color: AppColors.main,))),
                Expanded(child: IconButton(onPressed: () {}, icon: const Icon(Icons.call, color: AppColors.main,))),
                Expanded(child: IconButton(onPressed: () {}, icon: const Icon(Icons.videocam_sharp, color: AppColors.main,))),
                Expanded(child: IconButton(onPressed: () {}, icon: const Icon(Icons.info_outline, color: AppColors.main,))),
              ],
            ),
          ),)
        ],
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return buildDialog(context);
  }
}
