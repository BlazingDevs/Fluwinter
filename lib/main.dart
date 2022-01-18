import 'dart:io';
import 'package:cafegation/models/myuser.dart';
import 'package:cafegation/page/login_page/loginpage.dart';
import 'package:cafegation/page/login_page/register_page.dart';
import 'package:cafegation/page/login_page/welcome_page.dart';
import 'package:cafegation/page/logo_page/logoPage.dart';
import 'package:cafegation/page/search_page/searchPage.dart';
import 'package:cafegation/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Firebase

  bool init = false;
  try {
    if (!(Platform.isAndroid || Platform.isIOS)) {
      //Android, IOS의 경우 옵션 없이 실행
      init = true;
    }
  } catch (e) {
    //Web 플랫폼일 경우 Platform을 이용 못함.
    init = true;
  }
  if (init) {
    await Firebase.initializeApp(
        //Web
        options: const FirebaseOptions(
            apiKey: "AIzaSyDi9VS9_ovimWTHSxamGDycVMLM_mGtvNY",
            authDomain: "cafegation.firebaseapp.com",
            projectId: "cafegation",
            storageBucket: "cafegation.appspot.com",
            messagingSenderId: "898555262184",
            appId: "1:898555262184:web:587451332320a73857455d"));
  } else {
    //Android, IOS
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyUser?>.value(
      initialData: null,
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'First Page',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primarySwatch: Colors.blue,
        ),
        initialRoute: WelcomePage.id,
        routes: {
          WelcomePage.id : (context) => WelcomePage(), //웰컴
          loginPage.id: (context) => loginPage(), //로그인
          registerPage.id: (context) => registerPage(), //회원가입
          logoPage.id: (context) => logoPage(), //로고
          searchPage.id: (context) => searchPage() //찾기 화면...
        },
      ),
    );
  }
}
