import 'package:student_management/constants.dart';
import 'package:student_management/methods/auth_methods.dart';
import 'package:student_management/screens/auth/login_screen.dart';

import 'package:student_management/widgets/input_field.dart';
import 'package:flutter/material.dart';

import '../homescreen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailControoller=TextEditingController();
  final TextEditingController _passwordControoller=TextEditingController();
  final TextEditingController _usernameControoller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
        body:Center(
          child: SizedBox(
            width: isWeb?width/4:width/1.2,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:[
                  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("SignUp Screen",style: TextStyle(fontSize: 20,),),
                  SizedBox(height: 18),
                  InputField(hintText: "Username",controller: _usernameControoller),
                  SizedBox(height: 12),
                  InputField(hintText: "Email",controller: _emailControoller),
                  SizedBox(height: 12),
                  InputField(hintText: "Password",controller:_passwordControoller),
                  SizedBox(height: 15),
                  Container(
                    width: width/3.5,
                    child: ElevatedButton(onPressed: (){
                      if(_usernameControoller.text.isEmpty||_emailControoller.text.isEmpty||_passwordControoller.text.isEmpty){
                        showFlushBar(context, "Error","Email,Username or Password can't be empty");
                      }else{
                        _signUp(_usernameControoller.text,_emailControoller.text,_passwordControoller.text);
                      }
                    },
                        child: Text("SignUp")),
                  )

                ],
                ),SizedBox(height: 10),
                  Column(
                    children: [
                      const Text("Already have an account?"),
                      TextButton(onPressed: (){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginScreen()));
                      },
                          child: Text("Login"),
                      ),
                    ],
                  )
                ]
              ),
            ),
          ),
        )
    );
  }

  void _signUp(String username, String email,String password)async{
    setState(() {
      showFlushBar(context, "Wait", "Processing");
    });
    String result=await AuthMethods().signUpUser(userName: username, email: email, password: password);
    setState(() {
      if(result=="Success"){
        showFlushBar(context, result, "Successfully Sign In");
        Future.delayed(Duration(seconds: 2),(){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
        });
      }
      else{
        showFlushBar(context, "Error Occurred", result);
      }
    });
  }

}

