
import 'package:first_project_hive/Views/pages/screenbottomnav.dart';
import 'package:first_project_hive/model/mymodel.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
const mykey = "Mykey";
void main() async{
WidgetsFlutterBinding.ensureInitialized();
 await Hive.initFlutter();
 Hive.registerAdapter(StudentItemAdapter());
 await Hive.openBox<StudentItem>(mykey);
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Study Tracker",
      debugShowCheckedModeBanner: false,
      home: ScreenBottomnav(),
    );}}