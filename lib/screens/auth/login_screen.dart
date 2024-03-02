
import 'package:student_management/constants.dart';
import 'package:student_management/methods/auth_methods.dart';
import 'package:student_management/screens/auth/signup_screen.dart';

import 'package:student_management/widgets/input_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../homescreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailControoller=TextEditingController();
  final TextEditingController _passwordControoller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
        body:Center(
          child: SizedBox(
            width: isWeb?width/4:width/1.2,
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Login Screen",style: TextStyle(fontSize: 20,),),
                        SizedBox(height: 18),
                        // TextField(controller: _emailControoller),
                        InputField(hintText: "Gmail",controller:_emailControoller),
                        SizedBox(height: 12),
                        // TextField(controller:_passwordControoller),
                        InputField(hintText: "Password",controller:_passwordControoller),
                        SizedBox(height: 15),
                        Container(
                          width: width/3.5,
                          child: ElevatedButton(onPressed: (){
                            if (_emailControoller.text.isEmpty || _passwordControoller.text.isEmpty){
                              showFlushBar(context, "Error","Email can't be empty ${_emailControoller.text.length}");
                            }else{
                              _login(_emailControoller.text,_passwordControoller.text);
                            }
                          },
                              child: Text("Login"),
                          ),
                        )

                      ],
                    ),
                    Column(
                      children: [
                        const Text("Don't have an account?"),
                        TextButton(onPressed: (){
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>SignUpScreen()));
                        },
                          child: Text("SignUp"),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
  void _login(String email, String password) async
  {
    setState(() {
      showFlushBar(context, "Wait", "Processing");
    });
    String result = await AuthMethods().loginUser(email: email, password: password);
    // var result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    setState(() {
      if (result == "Success") {
        showFlushBar(context, result, "Successfully Logged In");
        Future.delayed(Duration(seconds: 2), () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
        });
      } else {
        showFlushBar(context, "Error Occurred", result);
      }

    });
  }
}


