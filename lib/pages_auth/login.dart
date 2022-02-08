import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'
    show FaIcon, FontAwesomeIcons;
import 'package:micromobitech/helper/define.dart';
import 'package:micromobitech/helper/auth_control.dart';
import 'package:micromobitech/helper/widget.dart';
import 'package:micromobitech/pages_auth/register.dart';

class LoginPage extends GetWidget<AuthControl> {
  LoginPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  RxBool _isObscure = true.obs;
  IconData _iconObscure = FontAwesomeIcons.eye;

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
                            padding: const EdgeInsets.symmetric(
                                vertical: 40, horizontal: 30),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'LOGIN',
                                        style: customTitleStyle,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 40),
                                  TextFormField(
                                    controller: _emailController,
                                    decoration: const InputDecoration(
                                      hintText: 'Enter your email',
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Email invalid or not found';
                                      } else {
                                        return null;
                                      }
                                      ;
                                    },
                                    onSaved: (value) {
                                      controller.email = value;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Obx(() => TextFormField(
                                        decoration: InputDecoration(
                                            hintText: 'Password',
                                            suffixIconConstraints:
                                                const BoxConstraints(
                                              minWidth: 2,
                                              minHeight: 2,
                                            ),
                                            suffixIcon: InkWell(
                                                child: FaIcon(_iconObscure),
                                                onTap: () {
                                                  _isObscure.value =
                                                      !_isObscure.value;
                                                  if (_isObscure.value) {
                                                    _iconObscure =
                                                        FontAwesomeIcons.eye;
                                                  } else {
                                                    _iconObscure =
                                                        FontAwesomeIcons
                                                            .eyeSlash;
                                                  }
                                                })),
                                        obscureText: _isObscure.value,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Password is incorrect';
                                          }
                                          return null;
                                        },
                                        onSaved: (value) {
                                          controller.password = value;
                                        },
                                      )),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: CustomButton(
                                      'Login',
                                      () {
                                        if (_formKey.currentState!.validate()) {
                                          _formKey.currentState!.save();
                                          controller
                                              .signInWithEmailAndPassword();
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
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            style: customLinkTextStyle,
                            onPressed: () {
                              Get.off(() => RegisterPage());
                            },
                            child: const Text('계정등록'),
                          ),
                          const SizedBox(width: 10),
                          TextButton(
                            style: customLinkTextStyle,
                            onPressed: () {
                              FocusScope.of(context).unfocus();
                              if (_emailController.text.trim() == '') {
                                Get.snackbar('확인', '이메일을 입력해주세요',
                                    snackPosition: SnackPosition.BOTTOM);
                              } else {
                                showConfirmDialog(context, '비밀번호변경 이메일을 보낼까요?',
                                    () {
                                  controller
                                      .resetPassword(_emailController.text);

                                  Navigator.pop(context);
                                });
                              }
                            },
                            child: const Text('forgot password'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 70),
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

class LoginPage2 extends GetWidget<AuthControl> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  RxBool _isObscure = true.obs;
  IconData _iconObscure = FontAwesomeIcons.eye;

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
                          padding: const EdgeInsets.symmetric(
                              vertical: 40, horizontal: 30),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'LOGIN',
                                      style: customTitleStyle,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 40),
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
                                const SizedBox(
                                  height: 20,
                                ),
                                Obx(() => TextFormField(
                                      decoration: InputDecoration(
                                          hintText: 'Password',
                                          suffixIconConstraints:
                                              const BoxConstraints(
                                            minWidth: 2,
                                            minHeight: 2,
                                          ),
                                          suffixIcon: InkWell(
                                              child: FaIcon(_iconObscure),
                                              onTap: () {
                                                _isObscure.value =
                                                    !_isObscure.value;
                                                if (_isObscure.value) {
                                                  _iconObscure =
                                                      FontAwesomeIcons.eye;
                                                } else {
                                                  _iconObscure =
                                                      FontAwesomeIcons.eyeSlash;
                                                }
                                              })),
                                      obscureText: _isObscure.value,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Password is incorrect';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        controller.password = value;
                                      },
                                    )),
                                const SizedBox(
                                  height: 40,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: CustomButton(
                                    'Login',
                                    () {
                                      if (_formKey.currentState!.validate()) {
                                        _formKey.currentState!.save();
                                        controller.signInWithEmailAndPassword();
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            style: customLinkTextStyle,
                            onPressed: () {
                              Get.off(RegisterPage());
                            },
                            child: const Text('계정등록'),
                          ),
                          const SizedBox(width: 10),
                          TextButton(
                            style: customLinkTextStyle,
                            onPressed: () {
                              FocusScope.of(context).unfocus();
                              if (_emailController.text.trim() == '') {
                                Get.snackbar('확인', '이메일을 입력해주세요',
                                    snackPosition: SnackPosition.BOTTOM);
                              } else {
                                showConfirmDialog(context, '비밀번호변경 이메일을 보낼까요?',
                                    () {
                                  controller
                                      .resetPassword(_emailController.text);

                                  Navigator.pop(context);
                                });
                              }
                            },
                            child: const Text('forgot password'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 70),
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
