import 'package:flutter/material.dart';
import 'package:micromobitech/helper/define.dart';

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryBackgroundColor,
        body: Center(
          child: Text(globalUserModel.factoryId.toString()),
        ));
  }
}
