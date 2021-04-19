import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'Profile.dart';
class User {
  int id;
  String password;
  String lastLogin;
  bool isSuperuser;
  String username;
  String firstName;
  String lastName;
  String email;
  bool isStaff;
  bool isActive;
  String dateJoined;
  Profile profile;

  User(
      {this.id,
      this.password,
      this.lastLogin,
      this.isSuperuser,
      this.username,
      this.firstName,
      this.lastName,
      this.email,
      this.isStaff,
      this.isActive,
      this.dateJoined,
      this.profile});


  Future<User> decoded() async {
        Future<SharedPreferences> prefs = SharedPreferences.getInstance();
        String signed=await prefs.then((value) => value.getString('logged'));
        List<String> userinfos=signed.split('!');            
        Map<String, dynamic> usermap=jsonDecode(userinfos[0]);
        User user=User.fromJson(usermap);
        Map<String, dynamic> profilemap=jsonDecode(userinfos[1]);
        Profile profile=Profile.fromJson(profilemap);
        user.profile=profile;
        return user;
  }

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    password = json['password'];
    lastLogin = json['last_login'];
    isSuperuser = json['is_superuser'];
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    isStaff = json['is_staff'];
    isActive = json['is_active'];
    dateJoined = json['date_joined'];
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['password'] = this.password;
    data['last_login'] = this.lastLogin;
    data['is_superuser'] = this.isSuperuser;
    data['username'] = this.username;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['is_staff'] = this.isStaff;
    data['is_active'] = this.isActive;
    data['date_joined'] = this.dateJoined;
    

    return data;
  }
}
