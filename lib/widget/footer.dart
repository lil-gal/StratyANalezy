import 'package:flutter/material.dart';

import 'package:nalezy/themes/main_theme.dart';

class Footer extends StatefulWidget {

  @override
  _FooterState createState() => _FooterState ();
}

class _FooterState extends State<Footer>{
  
  int _selectedIndex = 0;
  
  @override
  Widget build(BuildContext context){

    return BottomNavigationBar(
      backgroundColor: AppTheme.normal,
      currentIndex: _selectedIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {

        setState(() {
          _selectedIndex = index;
        });

        final routes = [
          "/home",
          "/map",
          "/add",
          "/chats",
          "/settings"
        ];
        
        Navigator.pushNamed(context, routes[index]);
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: AppTheme.iconColorDefault,),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.map, color: AppTheme.iconColorDefault,),
          label: 'Map',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add, color: AppTheme.iconColorDefault,),
          label: 'Add',          
          ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat, color: AppTheme.iconColorDefault,),
          label: 'Chats',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings, color: AppTheme.iconColorDefault,),
          label: 'Settings',
        ),
      ],
    );
  }
}