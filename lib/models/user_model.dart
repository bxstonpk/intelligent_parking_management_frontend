// ignore_for_file: prefer_collection_literals, unnecessary_new, unnecessary_this

class User {
  String? message;
  int? id;
  String? email;
  String? password;
  String? username;
  String? userFullname;
  String? userBirthday;
  int? userGender;
  String? userProfile;

  User(
      {this.message,
      this.id,
      this.email,
      this.password,
      this.username,
      this.userFullname,
      this.userBirthday,
      this.userGender,
      this.userProfile});

  User.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    id = json['id'];
    email = json['email'];
    password = json['password'];
    username = json['username'];
    userFullname = json['user_fullname'];
    userBirthday = json['user_birthday'];
    userGender = json['user_gender'];
    userProfile = json['user_profile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['id'] = this.id;
    data['email'] = this.email;
    data['password'] = this.password;
    data['username'] = this.username;
    data['user_fullname'] = this.userFullname;
    data['user_birthday'] = this.userBirthday;
    data['user_gender'] = this.userGender;
    data['user_profile'] = this.userProfile;
    return data;
  }
}
