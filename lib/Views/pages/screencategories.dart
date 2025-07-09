import 'package:first_project_hive/constant/textconstant.dart';
import 'package:first_project_hive/main.dart';
import 'package:first_project_hive/model/mymodel.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Screencategories extends StatefulWidget {
  @override
  State<Screencategories> createState() => _ScreencategoriesState();
}

class _ScreencategoriesState extends State<Screencategories> {
  String? selectedSubject;

  final TextEditingController durationController = TextEditingController();
  final TextEditingController subjectcontroller = TextEditingController();
  final TextEditingController topicController = TextEditingController();

  @override
  void dispose() {
    durationController.dispose();
    topicController.dispose();
    subjectcontroller.dispose();
    super.dispose();
  }

  void savedata() {
    final mybox = Hive.box<StudentItem>(mykey);
    var durationint = double.parse(durationController.text);
    var data = StudentItem(
      subject: subjectcontroller.text,
      topic: topicController.text,
      duration: durationint,
    );

    setState(() {
      mybox.add(data);
    });
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Textconstants.categoriestext1),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff00b4d8),
              Color(0xff03045e),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: subjectcontroller,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Enter Subject',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: topicController,
                decoration: InputDecoration(
                  labelText: 'Enter Topic Studied',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: durationController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter Duration (in minutes)',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  savedata();
                  Navigator.pop(context);
                
                },
                child: Text('Submit', style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
