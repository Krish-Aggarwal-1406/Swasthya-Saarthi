import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'SignUpPage.dart';
import 'Utils/utils.dart';
import 'bottom_nav_bar.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool loading=false;
  FirebaseAuth auth = FirebaseAuth.instance;
  final formKey=GlobalKey<FormState>();
  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  @override
  void dispose(){
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
  Future<UserCredential> loginWithGoogle() async {
    final  googleUser = await GoogleSignIn().signIn();
    final  googleAuth = await googleUser!.authentication;
    final  googleAuthCredential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final userCredential = await auth.signInWithCredential(googleAuthCredential);
    Get.to(BottomNavBarPage(fullname: ''));
    return userCredential;
  }
  void login(){
    setState(() {
      loading=true;
    });

    auth.signInWithEmailAndPassword(
        email: emailController.text.toString(),
        password: passwordController.text.toString()).then((value){
      Utils().toastMessage(value.user!.email.toString());
      Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNavBarPage(fullname: '',)));
      setState(() {
        loading=false;
      });
    }).onError((error,stackTrace){
      setState(() {
        loading=false;
      });
      Utils().toastMessage(error.toString());

    });
  }
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(

      body: SingleChildScrollView(
        child: Container(
        
          child:Column(
            children: [
              Container(width:double.infinity,height: height*.45 ,
                  child: Image.asset("assets/Screenshot 2025-03-16 165408.png",fit: BoxFit.fill
                    ,)),
              SizedBox(height: height*.018,),
              Text("Hey you are already set",style: TextStyle(color: Colors.grey.shade700,fontSize: 18),),
              SizedBox(height: height*.005,),
              Text("Just Log in and go",style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),),
              SizedBox(height: height*.02,),
        
        
              //form fields
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: formKey  ,
                  child: Column(
                      children: [
        
        
                        //email field
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Email is required";
                            }
                            if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(value)) {
                              return "Enter a valid email";
                            }
                            return null;
                          },
                          controller: emailController,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder( // Border when focused
                              borderSide: BorderSide(color: Colors.black, width: 1),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            suffixIcon: SizedBox(
                              height: 24, // Set a proper height
                              width: 40,  // Optional: Adjust width
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Image.asset(
                                  "assets/img_3.png",
                                  fit: BoxFit.contain, // Ensures proper scaling
                                ),
                              ),
                            ),
                            label: Hero(tag: "emailTag", child: Material(color: Colors.transparent,
                                child: Text("Email or Mobile number",style: TextStyle(color: Colors.grey.shade700),))),
                            prefixIcon: Icon(Icons.email_outlined),
                            border: OutlineInputBorder( // Default border
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(15),
        
                            ),
                          ),
                        ),
        
        
        
                        SizedBox(height: height*.02,),
        
        
                        //password field
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password is required";
                            }
                            if (!RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)[A-Za-z\d]{8,}$').hasMatch(value)) {
                              return "Password must be 8+ chars, 1 uppercase, 1 lowercase & 1 number";
                            }
                            return null;
                          },
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder( // Border when focused
                              borderSide: BorderSide(color: Colors.black, width: 1),
                              borderRadius: BorderRadius.circular(15),
        
                            ),
                            suffixIcon: SizedBox(
                              height: 10, // Set a proper height
                              width: 10,  // Optional: Adjust width
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Image.asset(
                                  "assets/img_3.png",
                                  fit: BoxFit.contain, // Ensures proper scaling
                                ),
                              ),
                            ),
                            prefixIcon: Icon(Icons.lock_outline),
                            label: Hero(tag: "passwordTag", child: Material(color: Colors.transparent,
                                child: Text("Password",style: TextStyle(color: Colors.grey.shade700),))),
        
                            border: OutlineInputBorder( // Default border
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(15),
        
                            ),
                          ),
                        ),
        
        
        
                      ]
                  ),
                ),
              ),
        
              SizedBox(height: height*.018,),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      login();
                    }
                  },
                  child: Container(
                      height: height * .06,
                      width: width * .7,
                      alignment: Alignment.center,
                      child: Text(
                        "Log In",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ))),
              SizedBox(height: height*.018,),
              Text(
                "-------------------------or-------------------------",
                style: TextStyle(fontSize: 20, color: Colors.grey.shade700),
              ),
              SizedBox(height: height*.02,),
        
        
        
              //google signin
              GestureDetector(
                onTap: ()async{await loginWithGoogle();},
                child: Container(height: height*.04,
                  width: width*.1,
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: .8
                      ),
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: Image.asset("assets/img_2.png"),
                ),
              ),
        
        
        
              SizedBox(height: height*.002,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?",style: TextStyle(color: Colors.grey.shade700,fontSize: 17),),
                  TextButton(onPressed: (){Get.to(SignUpPage());}, child: Text("Register",style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.bold),))
                ],
              )
        
        
        
            ],
          ),
        ),
      ),
    );
  }
}
