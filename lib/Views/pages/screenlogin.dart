
import 'package:first_project_hive/Views/pages/screenregister.dart';
import 'package:first_project_hive/constant/imageconstants.dart';
import 'package:first_project_hive/constant/textconstant.dart';
import 'package:first_project_hive/controller/auth_controller.dart';
import 'package:flutter/material.dart';

class Screenlogin extends StatefulWidget {
  const Screenlogin({super.key});

  @override
  State<Screenlogin> createState() => _ScreenloginState();
}

class _ScreenloginState extends State<Screenlogin> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned.fill(
            top: 120,
            bottom: 100,
            left: 110,
            child: Text(
              Textconstants.loginWelcome,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: const Color.fromARGB(255, 45, 89, 163),
                fontSize: 50,
                fontFamily: 'Anton',
              ),
            ),
          ),
          Positioned.fill(
            top: 680,
            child: Image.asset(
              ImageConstants.bookimage,
              fit: BoxFit.contain,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: Textconstants.emaillog,
                      prefixIcon: Icon(Icons.person),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 16,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16),

                  TextField(
                    obscureText: true,
                    controller: passController,
                    decoration: InputDecoration(
                      hintText: Textconstants.passwordlog,
                      prefixIcon: Icon(Icons.lock),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 16,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 24),

                  SizedBox(
                    width: 100,
                    child: ElevatedButton(
                      onPressed: () async {
                        final emaill = emailController.text;
                        final pass = passController.text;
                        if (emaill.isEmpty || pass.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(Textconstants.allfieldsreq)),
                          );
                        }else{
                          login(email: emaill,pass: pass,context: context);
                        

                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 45, 89, 163),
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        Textconstants.loginSignin,
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        Textconstants.logindonthaveac,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Screenregister(),
                            ),
                          );
                        },
                        child: Text(
                          Textconstants.loginSignup,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
