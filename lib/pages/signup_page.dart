import 'package:datademo/modal/user_modal.dart';
import 'package:datademo/pages/home_page.dart';
import 'package:datademo/services/db_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';


class SignUpPage extends StatefulWidget {

  static final String id = 'signup_page';
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final numberController = TextEditingController();
  final usernameController = TextEditingController();

  void _doLogin(){
    String email = emailController.text.toString().trim();
    String password = passwordController.text.toString().trim();
    String number = passwordController.text.toString().trim();
    String username = usernameController.text.toString().trim();

    var user = new User(email: email,password:password,number: number,username: username);

    HiveDB().storeUser(user);

    var user2 = HiveDB().loadUser();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Color(0xff21254A),
          padding: EdgeInsets.only(left: 20,right: 20,top: 140),
          child: Column(
            children: [
              Text("Create",style: TextStyle(color: Colors.white,fontSize: 27),),
              Text("Account",style: TextStyle(color: Colors.white,fontSize: 27),),
              Container(
                padding: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey[100],
                    ),
                  ),
                ),
                child: TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.account_circle_outlined,color: Colors.white60,),
                    border: InputBorder.none,
                    hintText: "User Name",
                    hintStyle: TextStyle(color: Colors.white60),
                  ),
                ),
              ),
              SizedBox(height: 5,),
              Container(
                padding: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey[100],
                    ),
                  ),
                ),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.mail_outline_outlined,color: Colors.white60,),
                    border: InputBorder.none,
                    hintText: "E-Mail",
                    hintStyle: TextStyle(color: Colors.white60),
                  ),
                ),
              ),
              SizedBox(height: 5,),
              Container(
                padding: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey[100],
                    ),
                  ),
                ),
                child: TextField(
                  controller: numberController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.phone,color: Colors.white60,),
                    border: InputBorder.none,
                    hintText: "Phone Number",
                    hintStyle: TextStyle(color: Colors.white60),
                  ),
                ),
              ),
              SizedBox(height: 5,),
              Container(
                padding: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey[100],
                    ),
                  ),
                ),
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.lock_open,color: Colors.white60,),
                    border: InputBorder.none,
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.white60),
                  ),
                ),
              ),
              SizedBox(height: 70,),
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[Colors.blueAccent, Colors.blueAccent,Colors.blueAccent,Colors.lightBlue,Colors.lightBlue],
                    ),
                    borderRadius: BorderRadius.circular(35)
                ),
                child: FlatButton(
                  onPressed: (){},
                  child: Icon(
                    Icons.arrow_forward_sharp,
                    size: 35,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 110,),
              Container(
                margin: EdgeInsets.only(left: 50),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          child: Text("Already have an account?",style: TextStyle(color: Colors.white70,fontSize: 18),),
                        )
                      ],
                    ),
                    SizedBox(width: 3,),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.pushReplacementNamed(context, HomePage.id);
                          },
                          child:Text("SIGN IN",style: TextStyle(color: Colors.lightBlue,fontSize: 17)),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}
