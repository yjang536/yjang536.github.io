import 'package:flutter/material.dart';
import 'package:micromobitech/helper/auth_control.dart';
import 'package:get/get.dart';

class NoFactoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          return Future(() => false);
        },
        child: Scaffold(
            backgroundColor: Colors.amber,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('정수장 연결이 안되있습니다. '),
                  Text('업체에 연락하거나 로그인을 다시해 주십시오'),
                  TextButton(
                      onPressed: () {
                        Get.find<AuthControl>().signOut();
                      },
                      child: Text('Logout')),
                  TextButton(onPressed: () {}, child: Text('계정 삭제'))
                ],
              ),
            )));
  }
}
