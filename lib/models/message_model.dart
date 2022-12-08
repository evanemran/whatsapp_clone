class Message {
  String text = "";
  int type = 0;
  String time = "";
  bool isRead = false;
  bool haveAttachment = false;
  String attachment = "";

  Message(this.text, this.type, this.time, this.isRead, this.haveAttachment, this.attachment);
}