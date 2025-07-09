
import 'package:first_project_hive/Views/pages/screenlogin.dart';
import 'package:first_project_hive/constant/textconstant.dart';
import 'package:first_project_hive/controller/auth_controller.dart';
import 'package:flutter/material.dart';

class Screenregister extends StatefulWidget {
  const Screenregister({super.key});

  @override
  State<Screenregister> createState() => _ScreenregisterState();
}

class _ScreenregisterState extends State<Screenregister> {



  TextEditingController usernameController= TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            top: 120,
            bottom: 100,
            left: 100,
            child: Text(
              Textconstants.signuphereReg,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Color.fromARGB(255, 45, 89, 163),
                fontSize: 45,
                fontFamily: 'Anton' ,
              ),
            ),
          ),
        
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      hintText: Textconstants.usernameReg,
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
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: Textconstants.emaillog,
                      prefixIcon: Icon(Icons.email),
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
                    controller: passwordController,
                    obscureText: true,
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
                      onPressed: () async{
                        final name =usernameController.text;
                        final email = emailController.text;
                        final pass = passwordController.text;
                        if(name.isEmpty || email.isEmpty || pass.isEmpty){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(Textconstants.allfieldsreq)));
                        }
                        else{
                           await signup(name: name, email: email, pass: pass);
                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(Textconstants.successfullyReg)));
                       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Screenlogin()));

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
                        Textconstants.loginSignup,
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(Textconstants.logindonthaveac,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15),),
                      TextButton(
                        onPressed: () {
                        Navigator.pop(context);
                        },
                        child: Text(Textconstants.loginSignin,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15)),
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