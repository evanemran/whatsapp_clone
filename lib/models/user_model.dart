import 'message_model.dart';

class User {
  int id = 0;
  String name = "";
  String lastOnline = "";
  String number = "";
  String photo = "";
  String status = "";

  User(this.id, this.name, this.lastOnline, this.number, this.photo,
      this.status);
}