import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Utils/utils.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'bottom_nav_bar.dart';
import 'loginPage.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool loading=false;
  FirebaseAuth auth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  bool isChecked = false;
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
  void passname(){
    String firstname=firstNameController.text;
    String lastname=lastNameController.text;
    String fullname=firstname+" "+lastname;
    if (firstname.isNotEmpty && lastname.isNotEmpty) {
      Get.to(() => BottomNavBarPage(fullname: fullname));
    } else {
      Get.snackbar("Error", "Please enter your first and last name");
    }
  }
  Future<UserCredential> loginWithGoogle() async {
    final  googleUser = await GoogleSignIn().signIn();
    final  googleAuth = await googleUser!.authentication;
    final  googleAuthCredential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    return await auth.signInWithCredential(googleAuthCredential);
  }

  void signup(){
    setState(() {
      loading=true;
    });

    auth.createUserWithEmailAndPassword(
        email: emailController.text.toString(),
        password: passwordController.text.toString()).then((value){
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
          child: Column(
            children: [
              Container(
                  width: double.infinity,
                  height: height * .25,
                  child: Image.asset(
                    "assets/img1.png",
                    fit: BoxFit.fill,
                  )),
              SizedBox(
                height: height * .018,
              ),
              Text(
                "Hey There",
                style: TextStyle(color: Colors.grey.shade700, fontSize: 18),
              ),
              SizedBox(
                height: height * .005,
              ),
              Text(
                "Create an Account",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: height * .02,
              ),

              //form fields
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: formKey,
                  child: Column(children: [



                    //first name field
                    TextFormField(
                      controller: firstNameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "First Name is required";
                        } else if (!RegExp(r"^[a-zA-Z]+$").hasMatch(value)) {
                          return "Only letters are allowed";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          // Border when focused
                          borderSide: BorderSide(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        prefixIcon: Icon(Icons.person_outline),
                        hintText: "First name",
                        border: OutlineInputBorder(
                          // Default border
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),




                    SizedBox(
                      height: height * .02,
                    ),



                    //last name field
                    TextFormField(
                      controller: lastNameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Last Name is required";
                        } else if (!RegExp(r"^[a-zA-Z]+$").hasMatch(value)) {
                          return "Only letters are allowed";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          // Border when focused
                          borderSide: BorderSide(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        prefixIcon: Icon(Icons.person_outline),
                        hintText: "Last name",
                        border: OutlineInputBorder(
                          // Default border
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),




                    SizedBox(
                      height: height * .02,
                    ),



                    //email field
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Email is required";
                        }
                        if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(value)) {
                          return "Enter a valid email";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          // Border when focused
                          borderSide: BorderSide(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        label: Hero(
                            tag: "emailTag",
                            child: Material(
                                color: Colors.transparent,
                                child: Text(
                                  "Email or Mobile number",
                                  style: TextStyle(color: Colors.grey.shade700),
                                ))),
                        prefixIcon: Icon(Icons.email_outlined),
                        border: OutlineInputBorder(
                          // Default border
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),




                    SizedBox(
                      height: height * .02,
                    ),


                    //password field
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password is required";
                        }
                        if (!RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)[A-Za-z\d]{8,}$').hasMatch(value)) {
                          return "Password must be 8+ chars, 1 uppercase, 1 lowercase & 1 number";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          // Border when focused
                          borderSide: BorderSide(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        prefixIcon: Icon(Icons.lock_outline),
                        label: Hero(
                            tag: "passwordTag",
                            child: Material(
                                color: Colors.transparent,
                                child: Text(
                                  "Password",
                                  style: TextStyle(color: Colors.grey.shade700),
                                ))),
                        border: OutlineInputBorder(
                          // Default border
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),




                  ]),
                ),
              ),
              SizedBox(
                height: height * .018,
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    Checkbox(
                      fillColor: WidgetStateProperty.all(
                          isChecked ? Colors.black : Colors.white),
                      value: isChecked,
                      onChanged: (bool? newValue) {
                        setState(() {
                          isChecked = newValue ?? false;
                        });
                      },
                    ),
                    Expanded(
                      child: Text(
                        "By continuing you accept our Privacy Policy and Term of Use",
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * .018,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      signup();
                      passname();

                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child: Container(
                      height: height * .06,
                      width: width * .7,
                      alignment: Alignment.center,
                      child: Text(
                        "Register",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ))),
              SizedBox(
                height: height * .018,
              ),
              Text(
                "-------------------------or-------------------------",
                style: TextStyle(fontSize: 20, color: Colors.grey.shade700),
              ),
              SizedBox(
                height: height * .02,
              ),


              //google signin
              GestureDetector(
                onTap: () async {
                  await loginWithGoogle();
                },
                child: Container(
                  height: height * .04,
                  width: width * .1,
                  decoration: BoxDecoration(
                      border: Border.all(width: .8),
                      borderRadius: BorderRadius.circular(15)),
                  child: Image.asset("assets/img_2.png"),
                ),
              ),



              SizedBox(
                height: height * .002,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(color: Colors.grey.shade700, fontSize: 17),
                  ),
                  TextButton(
                      onPressed: () {
                        Get.to(LoginPage());
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
