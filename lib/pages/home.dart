import 'package:convex_bottom_bar/convex_bottom_bar.dart'
    show ConvexAppBar, TabItem;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:micromobitech/helper/auth_control.dart';
import 'package:micromobitech/pages/currentstate.dart';
import 'package:micromobitech/pages/profile.dart';
import 'package:micromobitech/pages/screen1.dart';
import 'package:micromobitech/pages/screen2.dart';
import 'package:micromobitech/pages/screen3.dart';

final List<String> _appbarTitle = [
  '정수장 초기화면',
  '정수장 현재상황',
  '약품 주입현황',
  'Swtich On Off',
  '비디오',
];

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          return Future(() => false);
        },
        child: GetBuilder<ControlHomeBody>(
            init: ControlHomeBody(),
            builder: (controller) => Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: true,
                  elevation: 0,
                  centerTitle: true,
                  title: Text(_appbarTitle[controller.navigatorIndex]),
                  actions: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.more_vert),
                      tooltip: 'Logout',
                      onPressed: () {
                        showCustomDialog(context, controller);
                      },
                    )
                  ],
                ),
                drawer: _drawer(),
                body: controller.currentScreen,
                bottomNavigationBar: ConvexAppBar(
                    //backgroundColor: Colors.white,
                    //activeColor: Colors.blue,
                    //color: Colors.grey,
                    elevation: 0,
                    items: const [
                      TabItem(icon: Icons.home, title: 'Home'),
                      TabItem(icon: Icons.info_rounded, title: 'State'),
                      TabItem(icon: Icons.list, title: 'List'),
                      TabItem(icon: Icons.toggle_on, title: 'Signal'),
                      TabItem(icon: Icons.person, title: 'Profile'),
                    ],
                    initialActiveIndex: 0, //optional, default as 0
                    onTap: (int index) {
                      controller.changeCurrentScreen(index);
                    }))));
  }
}

class _drawer extends StatelessWidget {
  const _drawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: Row(
              children: const [
                Icon(Icons.person),
                Text('  Profile'),
              ],
            ),
            onTap: () {
              Get.toNamed('/profile');
            },
          ),
          ListTile(
            title: Row(
              children: const [
                Icon(Icons.message),
                Text('  메세지'),
              ],
            ),
            onTap: () {
              Get.toNamed('/message');
            },
          ),
          ListTile(
            title: Row(
              children: const [
                Icon(Icons.label),
                Text('  라이센스'),
              ],
            ),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => LicensePage()));
            },
          ),
          ListTile(
            title: Row(
              children: const [
                Icon(Icons.close),
                Text('  닫기'),
              ],
            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

class ControlHomeBody extends GetxController {
  Widget _currentScreen = Screen1();
  int _navigatorIndex = 0;

  Widget get currentScreen => _currentScreen;

  int get navigatorIndex => _navigatorIndex;

  changeCurrentScreen(int index) {
    _navigatorIndex = index;
    switch (index) {
      case 0:
        _currentScreen = Screen1();
        break;
      case 1:
        _currentScreen = CurrentState();
        break;
      case 2:
        _currentScreen = Screen2();
        break;
      case 3:
        _currentScreen = Screen3();
        break;
      case 4:
        _currentScreen = ProfilePage();
        break;
    }
    update();
  }
}

void showCustomDialog(BuildContext context, ControlHomeBody control) {
  showDialog(
    barrierDismissible: true,
    barrierColor: Colors.transparent,
    context: context,
    builder: (BuildContext cxt) {
      return Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: EdgeInsets.only(top: 45, right: 5),
          child: Card(
            elevation: 3,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                      onPressed: () {
                        Get.back();
                        Get.find<AuthControl>().signOut();
                      },
                      child: Text(
                        'Logout',
                        style: TextStyle(),
                      ))
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
