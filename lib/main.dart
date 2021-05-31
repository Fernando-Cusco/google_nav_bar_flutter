
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SafeArea(
            child: Stack(
                  children: [
                    fondo(),
                    Positioned(
                      top: -100,
                      right: -50,
                      child: figura(),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                            contenido(),
                        ],
                      ),
                    ),
                    Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Container(
                          padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                          child: tabMenu(),
                        )
                      ),
                  ],
                )
          ),
        ));
  }

  Widget fondo() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              colors: [Colors.white70, Colors.red])),
    );
  }

  Widget figura() {
    return Transform.rotate(
      angle: 180,
      child: Container(
        width: 260,
        height: 260,
        decoration: BoxDecoration(
            color: Colors.red[200],
            borderRadius: BorderRadius.circular(30)),
      ),
    );
  }

  Widget contenido() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.cake_rounded),
              ),
              title: Text('Food Crazy'),
              subtitle: Text('bienvenido'),
              trailing: CircleAvatar(
                child: Icon(Icons.alarm),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget tabMenu() {
    return GNav(
      haptic: true, // haptic feedback
      tabBorderRadius: 15, 
      tabShadow: [BoxShadow(color: Colors.red[300], blurRadius: 8)], // tab button shadow
      curve: Curves.decelerate, // tab animation curves
      duration: Duration(milliseconds: 500), // tab animation duration
      gap: 8, // the tab button gap between icon and text 
      color: Colors.white, // unselected icon color
      activeColor: Colors.black, // selected icon and text color
      iconSize: 24, // tab button icon size
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5), // navigation bar padding
      tabs: [
        GButton(
          icon: Icons.home,
          text: 'Home',
        ),
        GButton(
          icon: Icons.hearing_outlined,
          text: 'Likes',
        ),
        GButton(
          icon: Icons.search,
          text: 'Search',
        ),
        GButton(
          icon: Icons.verified_user,
          text: 'Profile',
        )
      ]
    );
  }
}
