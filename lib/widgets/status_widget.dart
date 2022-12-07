import 'package:flutter/cupertino.dart';

class StatusWidget extends StatefulWidget {
  const StatusWidget({Key? key}) : super(key: key);

  @override
  State<StatusWidget> createState() => _StatusWidgetState();
}

class _StatusWidgetState extends State<StatusWidget> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Status"),
    );
  }
}
