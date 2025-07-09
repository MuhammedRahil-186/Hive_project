import 'package:first_project_hive/Views/pages/screenbottomnav.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> signup({required name,required email,required pass})async{
  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.setString("USERNAME", name);
  pref.setString("EMAIL", email);
  pref.setString("PASSWORD", pass);
}



Future<void> login({required email, required pass, required context}) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  String? mail = pref.getString("EMAIL");
  String? passs = pref.getString("PASSWORD");
 if(email==mail && pass==passs){
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => ScreenBottomnav()), 
    );
     ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Login Successfull")));
 }
 else{
      ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Incorrect Password")));
 }

  }







