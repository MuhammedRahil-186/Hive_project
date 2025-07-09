import 'package:first_project_hive/Views/pages/screenlogin.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Screenprofile extends StatefulWidget {
  @override
  State<Screenprofile> createState() => _ScreenprofileState();
}

class _ScreenprofileState extends State<Screenprofile> {
  final TextEditingController nameController = TextEditingController();
  String? myname;

  @override
  void initState() {
    super.initState();
    getname();
  }

  void getname() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String storedName = pref.getString("USERNAME") ?? '';
    setState(() {
      myname = storedName;
      nameController.text = storedName.isNotEmpty ? storedName : 'Rahil';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff1f3f6),
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Color(0xff3f51b5),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            SizedBox(height: 10),
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Color(0xff3f51b5),
                  child: 
                      Text(
                          myname![0].toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 45,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                ),
              
              ],
            ),
            SizedBox(height: 30),

            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Username',
                prefixIcon: Icon(Icons.person, color: Colors.indigo),
                filled: true,
                fillColor: Colors.white,
                labelStyle: TextStyle(color: Colors.indigo),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.indigo, width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 20),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                await pref.setString("USERNAME", nameController.text);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Changes Saved')),
                );
              },
              child: Text('Save Changes', style: TextStyle(fontSize: 16)),
            ),

            SizedBox(height: 20),

            OutlinedButton.icon(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text("About Me"),
                    content: Text("Hi, I'm Rahil —  A Flutter developer."),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("Close", style: TextStyle(color: Colors.indigo)),
                      ),
                    ],
                  ),
                );
              },
              icon: Icon(Icons.info, color: Colors.indigo),
              label: Text("About Me", style: TextStyle(color: Colors.indigo)),
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.indigo),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            Spacer(),

            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Screenlogin()),
                );
              },
              icon: Icon(Icons.logout),
              label: Text('Logout'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
