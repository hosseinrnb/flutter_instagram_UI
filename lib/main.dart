import 'package:flutter/material.dart';
import 'package:instagram_ui/screens/add_content_screen.dart';
import 'package:instagram_ui/screens/home_screen.dart';
import 'package:instagram_ui/screens/login_screen.dart';
import 'package:instagram_ui/screens/main_screen.dart';
import 'package:instagram_ui/screens/search_screen.dart';
import 'package:instagram_ui/screens/switch_account_screen.dart';
import 'package:instagram_ui/screens/activity_screen.dart';
import 'package:instagram_ui/screens/user_profile_screen.dart';

void main() {
  runApp(Application());
}


class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          headline4: TextStyle(
            fontFamily: 'GB', fontSize: 16, color: Colors.white,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Color(0xffF35383),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            textStyle: TextStyle(
              fontSize: 16, fontFamily: 'GB',
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          repeat: ImageRepeat.repeat,
          image: AssetImage('images/pattern1.png'),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 100.0),
              child: Center(child: Image(image: AssetImage('images/logo_splash.png'),),),
            ),
            Positioned(
              bottom: 32,
              child: Column(
                children: [
                  Text('from', style: TextStyle(color: Colors.grey),),
                  Text('ExpertFlutter', style: TextStyle(color: Colors.blue),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

