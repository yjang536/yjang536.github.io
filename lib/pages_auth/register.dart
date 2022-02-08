import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'
    show FaIcon, FontAwesomeIcons;
import 'package:micromobitech/helper/define.dart';
import 'package:micromobitech/helper/auth_control.dart';
import 'package:micromobitech/helper/widget.dart';
import 'package:micromobitech/pages_auth/login.dart';

import 'verify_email.dart';

class RegisterPage extends GetWidget<AuthControl> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController1 = TextEditingController();
  final _passwordController2 = TextEditingController();

  var _isObscure1 = true.obs;
  var _isObscure2 = true.obs;
  IconData _iconObscure1 = FontAwesomeIcons.eye;
  IconData _iconObscure2 = FontAwesomeIcons.eye;

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
                height: MediaQuery.of(context).size.height - 150,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        constraints: const BoxConstraints(maxWidth: 500),
                        child: Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(1),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 40, horizontal: 30),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '계정 등록',
                                        style: customTitleStyle,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 30),
                                  TextFormField(
                                    controller: _emailController,
                                    decoration: InputDecoration(
                                      hintText: 'Enter your email',
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (value) {
                                      if (value!.isEmpty)
                                        return 'Email invalid or not found';
                                      return null;
                                    },
                                    onSaved: (value) {
                                      controller.email = value;
                                    },
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      hintText: '별명 또는 이름',
                                    ),
                                    keyboardType: TextInputType.name,
                                    validator: (value) {
                                      if (value!.isEmpty || value.length < 4)
                                        return 'Please enter valid name';
                                      return null;
                                    },
                                    onSaved: (value) {
                                      controller.name = value;
                                    },
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Obx(() => Column(
                                        children: [
                                          TextFormField(
                                            controller: _passwordController1,
                                            decoration: InputDecoration(
                                                hintText: 'Password (6자리 이상)',
                                                suffixIconConstraints:
                                                    const BoxConstraints(
                                                  minWidth: 2,
                                                  minHeight: 2,
                                                ),
                                                suffixIcon: InkWell(
                                                    child:
                                                        FaIcon(_iconObscure1),
                                                    onTap: () {
                                                      _isObscure1.value =
                                                          !_isObscure1.value;
                                                      if (_isObscure1.value) {
                                                        _iconObscure1 =
                                                            FontAwesomeIcons
                                                                .eye;
                                                      } else {
                                                        _iconObscure1 =
                                                            FontAwesomeIcons
                                                                .eyeSlash;
                                                      }
                                                      ;
                                                    })),
                                            obscureText: _isObscure1.value,
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'Password is incorrect';
                                              }
                                              return null;
                                            },
                                            onSaved: (value) {
                                              controller.password = value;
                                            },
                                          ),
                                          SizedBox(height: 15),
                                          TextFormField(
                                            controller: _passwordController2,
                                            decoration: InputDecoration(
                                                hintText: 'Confirm Password',
                                                suffixIconConstraints:
                                                    const BoxConstraints(
                                                  minWidth: 2,
                                                  minHeight: 2,
                                                ),
                                                suffixIcon: InkWell(
                                                    child:
                                                        FaIcon(_iconObscure2),
                                                    onTap: () {
                                                      _isObscure2.value =
                                                          !_isObscure2.value;
                                                      if (_isObscure2.value) {
                                                        _iconObscure2 =
                                                            FontAwesomeIcons
                                                                .eye;
                                                      } else {
                                                        _iconObscure2 =
                                                            FontAwesomeIcons
                                                                .eyeSlash;
                                                      }
                                                      ;
                                                    })),
                                            obscureText: _isObscure2.value,
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'Enter your password';
                                              }
                                              if (value.toString() !=
                                                  _passwordController1
                                                      .value.text
                                                      .toString()) {
                                                return 'Password do not match';
                                              }
                                              return null;
                                            },
                                            onSaved: (value) {
                                              controller.password = value;
                                            },
                                          ),
                                        ],
                                      )),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: CustomButton(
                                      '계정등록',
                                      () {
                                        if (_formKey.currentState!.validate()) {
                                          _formKey.currentState!.save();
                                          controller
                                              .signUpWithEmailAndPassword();
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            style: customLinkTextStyle,
                            onPressed: () {
                              Get.off(() => LoginPage());
                            },
                            child: const Text('Go Login'),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
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
