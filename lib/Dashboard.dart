import 'package:flutter/material.dart';
import 'package:crud_app/utils/Color.dart';
import 'package:flutter/cupertino.dart';
import 'package:crud_app/utils/Icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:crud_app/components/BottomMenuItems.dart';
import 'package:crud_app/pages/ComingSoonPage.dart';
import 'package:crud_app/pages/ProductsPage.dart';

class Dashboard extends StatefulWidget {
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  BottomMenu _layoutSelection = BottomMenu.home;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: MyColors.bkColor,
          centerTitle: true,
          title: Text(
            "Home",
            style: TextStyle(
              fontFamily: "Cabin Sketch",
              fontSize: 30,
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                FontAwesomeIcons.qrcode,
              ),
              onPressed: () {},
            )
          ],
        ),
        bottomNavigationBar: CupertinoTabBar(
          backgroundColor: MyColors.bkColor,
          items: <BottomNavigationBarItem>[
            _buildMenuItem(
                icon: iosHome,
                iconSelected: iosHomeOutline,
                bottomMenu: BottomMenu.home),
            _buildMenuItem(
                icon: iosCategory,
                iconSelected: iosCategoryOutline,
                bottomMenu: BottomMenu.category),
            _buildMenuItem(
                icon: iosNewArrival,
                iconSelected: iosNewArrivalOutline,
                bottomMenu: BottomMenu.new_arrival),
            _buildMenuItem(
                icon: iosAccount,
                iconSelected: iosAccountOutline,
                bottomMenu: BottomMenu.account),
            _buildMenuItem(
                icon: iosMore,
                iconSelected: iosMoreOutline,
                bottomMenu: BottomMenu.more),
          ],
          onTap: _onSelectMenuItem,
        ),
        body: _buildPage());
  }

  Widget _buildPage() {
    switch (_layoutSelection) {
      case BottomMenu.home:
        return ProductsPage();
      case BottomMenu.category:
        return ComingSoonPage(menuIcon(_layoutSelection));
      case BottomMenu.new_arrival:
        return ComingSoonPage(menuIcon(_layoutSelection));
      case BottomMenu.account:
        return ComingSoonPage(menuIcon(_layoutSelection));
      case BottomMenu.more:
        return ComingSoonPage(menuIcon(_layoutSelection));
    }
    return null;
  }

  BottomNavigationBarItem _buildMenuItem(
      {IconData icon, IconData iconSelected, BottomMenu bottomMenu}) {
    String text = menuItemName(bottomMenu);
    IconData setIcon = _setIconSelected(
        bottomMenu: bottomMenu, icon: icon, iconSelected: iconSelected);
    return BottomNavigationBarItem(
      icon: Icon(
        setIcon,
        color: _setMenuItemColor(bottomMenu: bottomMenu),
      ),
      title: Text(
        text,
        style: TextStyle(
          color: _setMenuItemColor(bottomMenu: bottomMenu),
        ),
      ),
    );
  }

  IconData _setIconSelected(
      {BottomMenu bottomMenu, IconData icon, IconData iconSelected}) {
    return _layoutSelection == bottomMenu ? iconSelected : icon;
  }

  Color _setMenuItemColor({BottomMenu bottomMenu}) {
    return _layoutSelection == bottomMenu ? Colors.white : Colors.grey;
  }

  void _onSelectMenuItem(int index) {
    switch (index) {
      case 0:
        _onLayoutSelected(BottomMenu.home);
        break;
      case 1:
        _onLayoutSelected(BottomMenu.category);
        break;
      case 2:
        _onLayoutSelected(BottomMenu.new_arrival);
        break;
      case 3:
        _onLayoutSelected(BottomMenu.account);
        break;
      case 4:
        _onLayoutSelected(BottomMenu.more);
        break;
    }
  }

  void _onLayoutSelected(BottomMenu selection) {
    setState(() {
      _layoutSelection = selection;
    });
  }
}
