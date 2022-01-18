import 'package:cafegation/page/login_page/loginpage.dart';
import 'package:cafegation/page/login_page/register_page.dart';
import 'package:cafegation/page/search_page/searchPage.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  static String id = 'welcomepage';

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 100.0,
              ),
              Row(
                children: <Widget>[
                  Text(
                    'Welcome to\n      Cafegation☕️',
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 45.0,
                        fontFamily: 'Signika'),
                  ),
                ],
              ),
              SizedBox(
                height: 150.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Material(elevation: 15.0,
                color: Colors.brown[200],
                borderRadius: BorderRadius.circular(50.0),
                child: MaterialButton(
                  onPressed: (){
                    Navigator.pushNamed(context, loginPage.id);
                  },
                  minWidth: 300.0,
                  height: 43.0,
                  child: Text('Log In',style: TextStyle(color: Colors.white),),
                ),
                ),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Material(elevation: 15.0,
                color: Colors.brown[300],
                borderRadius: BorderRadius.circular(50.0),
                child: MaterialButton(
                  onPressed: (){
                    Navigator.pushNamed(context, registerPage.id);
                  },
                  minWidth: 300.0,
                  height: 43.0,
                  child: Text('Register',style: TextStyle(color: Colors.white),),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Material(elevation: 15.0,
                color: Colors.brown[300],
                borderRadius: BorderRadius.circular(50.0),
                child: MaterialButton(
                  onPressed: (){
                    Navigator.pushNamed(context, searchPage.id);
                  },
                  minWidth: 300.0,
                  height: 43.0,
                  child: Text('Continue Without LogIn(Debug)',style: TextStyle(color: Colors.white),),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}