import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'
    show FirebaseAuth, FirebaseAuthException;
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'
    show FaIcon, FontAwesomeIcons;
import 'package:micromobitech/helper/define.dart';
import 'package:micromobitech/helper/auth_control.dart';
import 'package:micromobitech/helper/widget.dart';
import 'package:micromobitech/pages/home.dart';

class VerifyEmailPage extends GetWidget<AuthControl> {
  late Timer timer;
  bool timerIsInit = false;

  VerifyEmailPage() {
    timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      FirebaseAuth.instance.currentUser!.reload();
      if (FirebaseAuth.instance.currentUser!.emailVerified) {
        timer.cancel();
        Get.off(() => HomePage());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) => Scaffold(
        backgroundColor: primaryBackgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              LogoBig(),
              Container(
                height: MediaQuery.of(context).size.height - 200,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(1),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 40, horizontal: 30),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.solidEnvelope,
                                    size: 130,
                                    color: primaryTextColor,
                                  ),
                                ],
                              ),
                              SizedBox(height: 30),
                              // Text(
                              //   controller.email!,
                              //   style: customTextStyle,
                              // ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '인증 이메일을 보냈습니다',
                                style: customTextStyle,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '확인바랍니다',
                                style: customTextStyle,
                              ),
                              SizedBox(
                                height: 40,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            style: customLinkTextStyle,
                            onPressed: () {
                              showConfirmDialog(context, '인증 이메일을 다시 보낼까요?',
                                  () {
                                controller.verifyEmail();

                                Navigator.pop(context);
                              });
                            },
                            child: const Text('인증이메일 다시보내기'),
                          ),
                          SizedBox(width: 10),
                          TextButton(
                            style: customLinkTextStyle,
                            onPressed: () {
                              controller.signOut();
                            },
                            child: const Text('Go Login'),
                          ),
                        ],
                      ),
                      SizedBox(height: 70),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
