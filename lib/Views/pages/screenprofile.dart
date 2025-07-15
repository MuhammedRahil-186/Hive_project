import 'package:first_project_hive/Views/pages/screenlogin.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Screenprofile extends StatefulWidget {
  const Screenprofile({super.key});

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
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff00b4d8),
              Color(0xff03045e),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 12,
                    offset: Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 10),
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.indigo,
                        child: Text(
                          myname != null && myname!.isNotEmpty
                              ? myname![0].toUpperCase()
                              : 'R',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      prefixIcon: const Icon(Icons.person, color: Colors.indigo),
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      labelStyle: const TextStyle(color: Colors.indigo),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.indigo, width: 2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () async {
                      SharedPreferences pref = await SharedPreferences.getInstance();
                      await pref.setString("USERNAME", nameController.text);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Changes Saved')),
                      );
                    },
                    icon: const Icon(Icons.save),
                    label: const Text('Save Changes', style: TextStyle(fontSize: 16)),
                  ),
                  const SizedBox(height: 20),
                  OutlinedButton.icon(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: const Text("About Me"),
                          content: const Text("Hi, I'm Rahil — A Flutter developer."),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text("Close", style: TextStyle(color: Colors.indigo)),
                            ),
                          ],
                        ),
                      );
                    },
                    icon: const Icon(Icons.info, color: Colors.indigo),
                    label: const Text("About Me", style: TextStyle(color: Colors.indigo)),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.indigo),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Screenlogin()),
                      );
                    },
                    icon: const Icon(Icons.logout),
                    label: const Text('Logout'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
