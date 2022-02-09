import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:micromobitech/helper/auth_control.dart';
import 'package:micromobitech/helper/define.dart';
import 'package:micromobitech/helper/network.dart';
import 'package:micromobitech/pages/home.dart';
import 'package:micromobitech/pages/nofactory.dart';
import 'package:micromobitech/pages/nointernet.dart';
import 'package:micromobitech/pages/prepare.dart';
import 'package:micromobitech/pages_auth/login.dart';
import 'package:micromobitech/pages_auth/verify_email.dart';

class ControlPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (Get.find<AuthControl>().user == null) {
        return LoginPage();
      } else if (Get.find<AuthControl>().emailVerified == false) {
        return VerifyEmailPage();
      } else {
        if (Get.find<NetworkControl>().connectionStatus.value == 1 ||
            Get.find<NetworkControl>().connectionStatus.value == 2) {
          if (Get.find<AuthControl>().loginState == 'startjob') {
            return PreparePage();
          } else {
            if (globalUserModel.factoryId != 'none') {
              return HomePage();
            } else {
              return NoFactoryPage();
            }
          }
        } else {
          return HomePage();
          //return NoInternet();
        }
      }
    });
  }
}
