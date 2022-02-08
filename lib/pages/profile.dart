import 'package:firebase_auth/firebase_auth.dart'
    show FirebaseAuth, FirebaseAuthException;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:micromobitech/helper/define.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text('Email:   '),
                  Text(FirebaseAuth.instance.currentUser!.email.toString()),
                ],
              ),
              Row(
                children: [
                  Text('별명:   '),
                  Text(globalUserModel.name),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      child: const Text('이름변경'),
                      onPressed: () {
                        TextEditingController _controller2 =
                            TextEditingController();
                        bool _isButtonDisabled = false;
                        bool _isCompleted = false;

                        Get.defaultDialog(
                          titlePadding: const EdgeInsets.only(top: 20),
                          contentPadding: const EdgeInsets.all(20),
                          confirmTextColor: Colors.white,
                          title: '이름 변경',
                          textConfirm: "변경",
                          textCancel: "취소",
                          content: TextField(
                            controller: _controller2,
                            keyboardType: TextInputType.text,
                            maxLines: 1,
                            decoration: const InputDecoration(
                                labelText: '변경할 이름을 입력해주세요',
                                hintMaxLines: 1,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.green, width: 2.0))),
                          ),
                          onConfirm: () async {
                            if (_controller2.text.trim() == '') return;
                            if (_isButtonDisabled) return;

                            try {
                              _isButtonDisabled = true;
                              //_isCompleted = await _changeDiaplyname(
                              //    _controller2.text, (e) {});
                              Navigator.of(context, rootNavigator: true).pop();
                              if (_isCompleted) {
                                setState(() {});
                                Get.snackbar('확인', '이름변경되었습니다.',
                                    snackPosition: SnackPosition.BOTTOM);
                              } else {
                                Get.snackbar('에러', '이름이 변경되지않았습니다.',
                                    snackPosition: SnackPosition.BOTTOM);
                              }
                            } catch (e) {
                              Get.snackbar('에러', e.toString(),
                                  snackPosition: SnackPosition.BOTTOM);
                            }
                          },
                          onCancel: () {},
                        );
                      }),
                  TextButton(child: const Text('회원삭제'), onPressed: () {}),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}



/*
Future<bool> _changeDiaplyname(String displayName,
    void Function(FirebaseAuthException e) errorCallback) async {
  try {
    await FirebaseAuth.instance.currentUser!.updateDisplayName(displayName);
    return true;
  } on FirebaseAuthException catch (e) {
    errorCallback(e);
  }
  return false;
}


void deleteUserButtonPress() {
  TextEditingController _controller = TextEditingController();
  bool _isButtonDisabled = false;
  bool _isCompleted = false;

  Get.defaultDialog(
      titlePadding: const EdgeInsets.only(top: 20),
      contentPadding: const EdgeInsets.all(20),
      confirmTextColor: Colors.white,
      title: '회원삭제',
      textConfirm: "삭제",
      textCancel: "취소",
      content: TextField(
        controller: _controller,
        keyboardType: TextInputType.text,
        maxLines: 1,
        obscureText: true,
        decoration: const InputDecoration(
            labelText: '비밀번호를 입력해주세요',
            hintMaxLines: 1,
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green, width: 2.0))),
      ),
      onConfirm: () async {
        if (_isButtonDisabled) return;
        if (_controller.text.trim() == '') return;

        var credential = EmailAuthProvider.credential(
            email: FirebaseAuth.instance.currentUser!.email.toString(),
            password: _controller.text);
        try {
          await FirebaseAuth.instance.currentUser!
              .reauthenticateWithCredential(credential)
              .then((value) async {
            _isButtonDisabled = true;
            _isCompleted = await _deleteUser();
            if (_isCompleted) {
              Get.snackbar('확인', '삭제되었습니다.',
                  snackPosition: SnackPosition.BOTTOM);
            } else {
              Get.back();
              Get.snackbar('에러', '삭제되지않았습니다.',
                  snackPosition: SnackPosition.BOTTOM);
            }
          });
        } on FirebaseAuthException catch (e) {
          Get.back();
          showErrorDialog(e);
        } catch (e) {
          Get.back();
          Get.defaultDialog(title: 'Error', middleText: e.toString());
        }
      });
}

Future<bool> _deleteUser() async {
  try {
    await FirebaseAuth.instance.currentUser!.delete();
    loginController.currentLoginState.value = LoginContainerState.Login;
    //myFactory.clear();
    myUser.clear();

    if (Get.currentRoute.toString() != '/login') Get.toNamed('/login');
    return true;
  } on FirebaseAuthException catch (e) {
    Get.back();
    showErrorDialog(e);
    return false;
  }
}
*/