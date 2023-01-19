import 'package:flutter/material.dart';
import 'package:instagram_ui/screens/activity_screen.dart';
import 'package:instagram_ui/screens/add_content_screen.dart';
import 'package:instagram_ui/screens/home_screen.dart';
import 'package:instagram_ui/screens/login_screen.dart';
import 'package:instagram_ui/screens/search_screen.dart';
import 'package:instagram_ui/screens/user_profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedBottomNavigationItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            topLeft: Radius.circular(15),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            topLeft: Radius.circular(15),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Color(0xff1C1F2E),
            onTap: (int index) {
              setState(() {
                _selectedBottomNavigationItem = index;
              });
            },
            currentIndex: _selectedBottomNavigationItem,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                activeIcon: Image.asset('images/icon_active_home.png'),
                icon: Image.asset('images/icon_home.png'),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                activeIcon:
                    Image.asset('images/icon_search_navigation_active.png'),
                icon: Image.asset('images/icon_search_navigation.png'),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                activeIcon:
                    Image.asset('images/icon_add_navigation_active.png'),
                icon: Image.asset('images/icon_add_navigation.png'),
                label: 'Add',
              ),
              BottomNavigationBarItem(
                activeIcon:
                    Image.asset('images/icon_activity_navigation_active.png'),
                icon: Image.asset('images/icon_activity_navigation.png'),
                label: 'Activity',
              ),
              BottomNavigationBarItem(
                activeIcon: Container(
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Color(0xffF35383)),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(13)),
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Image.asset('images/me.jpg'),
                    ),
                  ),
                ),
                icon: Container(
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Color(0xffC5C5C5)),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(13)),
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Image.asset('images/me.jpg'),
                    ),
                  ),
                ),
                label: 'User_Profile',
              ),
            ],
          ),
        ),
      ),
      body: IndexedStack(
        index: _selectedBottomNavigationItem,
        children: getLayout(),
      ),
    );
  }

  List<Widget> getLayout() {
    return <Widget>[
      HomeScreen(),
      SearchScreen(),
      AddContentScreen(),
      ActivityScreen(),
      UserProfileScreen(),
    ];
  }
}
