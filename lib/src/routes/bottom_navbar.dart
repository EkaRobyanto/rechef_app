import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rechef_app/src/shared/dialogs.dart';
import 'package:rechef_app/src/utills/show_scale_dialog.dart';

import '../constants/styles.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key, required this.child});
  final Widget child;

  @override
  State<StatefulWidget> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _selectedIndex = 0;
  String _selectedLabel = 'Beranda';
  final List _navItem = [
    {
      "icon": Icons.home_outlined,
      "selectedIcon": Icons.home,
      "title": "Beranda",
      "route": '/home',
    },
    {
      "icon": Icons.explore_outlined,
      "selectedIcon": Icons.explore,
      "title": "Feed",
      "route": '/feed',
    },
    {
      "icon": Icons.favorite_outline,
      "selectedIcon": Icons.favorite,
      "title": "Favorit",
      "route": '/favorite',
    },
    {
      "icon": Icons.person_outline,
      "selectedIcon": Icons.person,
      "title": "Akun",
      "route": '/account',
    },
  ];

  void _tap(int index) {
    if (index == _selectedIndex) {
      return;
    }
    setState(() {
      _selectedIndex = index;
      _selectedLabel = _navItem[index]['title'];
    });
    context.go(_navItem[index]['route']);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        showScaledDialog(
          context,
          const ExitAppDialog(),
        );
        return Future.value(false);
      },
      child: Scaffold(
        body: widget.child,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.pushNamed('create-recipe');
          },
          backgroundColor: Styles.color.primary,
          elevation: 0,
          child: const Center(
            child: Icon(Icons.add),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          child: BottomNavigationBar(
            elevation: 0,
            backgroundColor: Styles.color.accent,
            selectedItemColor: const Color(0xFF263238),
            unselectedItemColor: Colors.black.withOpacity(0.5),
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 12,
            selectedLabelStyle: Styles.font.sm,
            items: _navItem
                .map(
                  (item) => BottomNavigationBarItem(
                    icon: _selectedLabel == item['title']
                        ? Icon(item['selectedIcon'])
                        : Icon(item['icon']),
                    label: item['title'],
                  ),
                )
                .toList(),
            currentIndex: _selectedIndex,
            onTap: (index) => _tap(index),
          ),
        ),
      ),
    );
  }
}
