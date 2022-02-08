import 'package:flutter/material.dart';
import 'package:micromobitech/helper/auth_control.dart';
import 'package:micromobitech/helper/define.dart';
import 'package:micromobitech/helper/localuser_control.dart';
import 'package:micromobitech/model/user_model.dart';
import 'package:get/get.dart';

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder(
              future: _getLocalUser(),
              builder:
                  (BuildContext context, AsyncSnapshot<UserModel> snapshot) {
                if (snapshot.hasData == false) {
                  return const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Error: ${snapshot.error}',
                      style: const TextStyle(fontSize: 15),
                    ),
                  );
                } else
                  return Column(
                    children: [
                      Text(snapshot.data!.email),
                      Text(snapshot.data!.factoryId),
                      Text(snapshot.data!.role),
                    ],
                  );
              },
            ),
            TextButton(
              style: customLinkTextStyle,
              onPressed: () {
                Get.find<AuthControl>().signOut();
              },
              child: const Text('LOGOUT'),
            ),
          ],
        )));
  }
}

Future<UserModel> _getLocalUser() async {
  UserModel? _currentUser;

  _currentUser = await LocalUserControl.getUserData();
  return _currentUser;
}
