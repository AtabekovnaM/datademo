import 'package:datademo/modal/user_modal.dart';
import 'package:datademo/pages/signup_page.dart';
import 'package:datademo/services/db_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';


class HomePage extends StatefulWidget {

  static final String id = 'home_page';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void _doLogin(){
    String username = usernameController.text.toString().trim();
    String password = passwordController.text.toString().trim();

    User user = new User(username: username,password:password);

    HiveDB().storeUser(user);

    var user2 = HiveDB().loadUser();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xff21254A),
        padding: EdgeInsets.only(left: 20,right: 20,top: 180),
        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 160),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      image: DecorationImage(
                          image: AssetImage('assets/images/ic_img2 (2).jpg'),
                      ),
                    ),
                )],
              ),
            ),
            SizedBox(height: 10,),
            Text("Welcome Back!",style: TextStyle(color: Colors.white,fontSize: 27),),
            Text("Sign in to continue",style: TextStyle(color: Colors.white,fontSize: 18),),
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
            SizedBox(height: 25,),
            Text("Forgot Password?",style: TextStyle(color: Colors.white60,fontSize: 15),),
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
                onPressed: _doLogin,
                child: Icon(
                  Icons.arrow_forward_sharp,
                  size: 35,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 140,),
            Container(
              margin: EdgeInsets.only(left: 50),
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                        child: Text("Don't have an account?",style: TextStyle(color: Colors.white70,fontSize: 18),),
                      )
                    ],
                  ),
                  SizedBox(width: 3,),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.pushReplacementNamed(context, SignUpPage.id);
                        },
                        child:Text("SIGN UP",style: TextStyle(color: Colors.lightBlue,fontSize: 17)),
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
