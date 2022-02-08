import 'package:flutter/material.dart';
import 'package:micromobitech/model/user_model.dart';

const primaryButtonColor = Color(0xff2699FB);
const primaryBackgroundColor = Color(0xffF1F9FF);
const primaryTextColor = Color(0xff2699FB);

ButtonStyle customLinkTextStyle = TextButton.styleFrom(
    textStyle: TextStyle(
  fontSize: 14.0,
));

TextStyle customTitleStyle = TextStyle(
    fontSize: 25, fontWeight: FontWeight.bold, color: primaryTextColor);

TextStyle customTextStyle =
    TextStyle(fontSize: 16, color: Color.fromARGB(211, 37, 37, 37));

late UserModel
    globalUserModel; // 변경할때: 처음실행시 localuser , login할때 firebase에서, edit profile
