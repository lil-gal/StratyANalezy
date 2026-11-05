import 'package:flutter/material.dart';

import 'package:nalezy/themes/main_theme.dart';

class Footer extends StatefulWidget {
  @override
  _FooterState createState() => _FooterState ();
}

class NavBarItem {
  final String label;
  final String route;
  final IconData icon;
  Color fore = AppTheme.active;
  Color bg = AppTheme.active;

  final Color _transparent = Color.fromARGB(0,0,0,0);

  NavBarItem(this.label,this.route,this.icon);

  
  void MarkSelect() {
    fore = AppTheme.normal;
    bg = AppTheme.iconColorDefault;
  }

  void UnmarkSelect() {
    fore = AppTheme.iconColorDefault;
    bg = _transparent;
  }
}

int _selectedIndex = 0;

class _FooterState extends State<Footer>{


  List<NavBarItem> buttons = [
    NavBarItem('Home',     "/home",     Icons.home),
    NavBarItem('Map',      "/map",      Icons.map), 
    NavBarItem('Add',      "/add",      Icons.add), 
    NavBarItem('Chats',    "/chats",    Icons.chat),
    NavBarItem('Settings', "/settings", Icons.settings)
  ];

  int GetSelectedIndex() => _selectedIndex;

  void _initSelections() {

    for (var i = 0; i < buttons.length; i++) {
      if (i == _selectedIndex) buttons[i].MarkSelect();
      else buttons[i].UnmarkSelect();
    }

  }

  @override
  void initState() {
    _initSelections();
  }


  @override
  Widget build(BuildContext context){

    List<BottomNavigationBarItem> items = [];

    var i = 0;
    for (var v in buttons) {
      var icon = Icon(
        v.icon,
        color: v.fore,
      );

      var deco = BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: v.bg,
      );

      var item = BottomNavigationBarItem(
        label: v.label,
        icon: Container(
          padding: EdgeInsets.all(8),
          decoration: deco,
          child: icon
        )
      );
      items.add(item);
      i++;
    }

    _initSelections();

    return BottomNavigationBar(
      backgroundColor: AppTheme.normal,
      selectedItemColor: AppTheme.iconColorDefault,
      unselectedItemColor: AppTheme.iconColorDefault,
      currentIndex: _selectedIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });

        Navigator.pushReplacementNamed(context, buttons[index].route);
      },

      items: items
    );
  }
}