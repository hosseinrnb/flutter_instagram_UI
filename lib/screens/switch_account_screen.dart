import 'dart:ui';

import 'package:flutter/material.dart';

class SwitchAccountScreen extends StatelessWidget {
  const SwitchAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/switch_account_background.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 150,
                  child: ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaY: 3.0, sigmaX: 3.0),
                      child: Container(
                        height: 352.0,
                        width: 340.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15.0),),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color.fromRGBO(255, 255, 255, 0.6),
                              Color.fromRGBO(255, 255, 255, 0.3),
                            ],
                          ),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 32.0,),
                            Image(image: AssetImage('images/profile.png'),),
                            SizedBox(height: 20.0,),
                            Text('Amirahmad Adibi', style: Theme.of(context).textTheme.headline4,),
                            SizedBox(height: 20.0,),
                            SizedBox(
                              height: 46,
                              width: 129,
                              child: ElevatedButton(
                                style: Theme.of(context).elevatedButtonTheme.style,
                                child: Text('Confirm'),
                                onPressed: () {},
                              ),
                            ),
                            SizedBox(height: 20.0,),
                            Text('Switch account', style: Theme.of(context).textTheme.headline4,),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 132.0, bottom: 63.0,),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('don\' have an account? ', style: TextStyle(fontFamily: 'GB', color: Colors.grey[500], fontSize: 16),),
                Text('Sign up', style: TextStyle(fontFamily: 'GB', color: Colors.white, fontSize: 20),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
