import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:micromobitech/control_pages.dart';
import 'package:micromobitech/helper/define.dart';
import 'package:micromobitech/helper/firestore.dart';
import 'package:micromobitech/helper/localuser_control.dart';
import 'package:micromobitech/model/user_model.dart';

class AuthControl extends GetxController {
  String? email, password, name;

  Rxn<User>? _user = Rxn<User>();
  Rxn<UserModel>? _userModel = Rxn<UserModel>();
  Rxn<String>? _loginState = Rxn<String>();

  String? get user => _user?.value?.email;
  bool? get emailVerified => _user?.value?.emailVerified;
  UserModel? get userModel => _userModel!.value;
  String? get loginState => _loginState!.value;

  final _auth = FirebaseAuth.instance;

  StreamController<String> loginController = StreamController<String>();

  @override
  Future<void> onInit() async {
    super.onInit();
    _user!.bindStream(_auth.authStateChanges());

    Stream<String> loginStream = loginController.stream;

    _loginState!.bindStream(loginStream);
  }

  void signUpWithEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email!, password: password!)
          .then((user) async {
        signUpsaveUser(user);
        verifyEmail();
      });
      Get.off(() => ControlPages());
    } catch (error) {
      String errorMessage =
          error.toString().substring(error.toString().indexOf(' ') + 1);
      Get.snackbar(
        'Failed to login',
        errorMessage,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void signInWithEmailAndPassword() async {
    try {
      String? _myToken = await FirebaseMessaging.instance.getToken();
      loginController.add('startjob');

      await _auth
          .signInWithEmailAndPassword(email: email!, password: password!)
          .then((user) async {
        FirebaseFirestore.instance
            .collection('users')
            .doc(user.user!.uid)
            .set({"fcm": _myToken}, SetOptions(merge: true));

        await FirestoreUser()
            .getUserFromFirestore(user.user!.uid)
            .then((doc) async {
          _userModel!.value =
              UserModel.fromJson(doc.data() as Map<dynamic, dynamic>);

          saveLocalUser(_userModel!.value!);
          globalUserModel = _userModel!.value!;
        });
        loginController.add('endjob');
      });
    } catch (error) {
      String errorMessage =
          error.toString().substring(error.toString().indexOf(' ') + 1);
      Get.snackbar(
        'Failed to login..',
        errorMessage,
        snackPosition: SnackPosition.BOTTOM,
      );
      print(errorMessage);
    }
  }

  void resetPassword(editEmail) async {
    try {
      await _auth.sendPasswordResetEmail(email: editEmail!).then((user) {
        Get.snackbar(
          'Confirm',
          '이메일로 비밀번호변경 링크를 보냈습니다.',
          snackPosition: SnackPosition.BOTTOM,
        );
      });
    } catch (error) {
      String errorMessage =
          error.toString().substring(error.toString().indexOf(' ') + 1);
      Get.snackbar(
        'Failed to email..',
        errorMessage,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void verifyEmail() async {
    try {
      await _auth.currentUser!.sendEmailVerification().then((user) {
        Get.snackbar(
          'Confirm',
          '확인 이메일을 보냈습니다.',
          snackPosition: SnackPosition.BOTTOM,
        );
      });
    } catch (error) {
      String errorMessage =
          error.toString().substring(error.toString().indexOf(' ') + 1);
      Get.snackbar(
        'Failed to email..',
        errorMessage,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void signOut() async {
    try {
      await _auth.signOut();
      LocalUserControl.clearUserData();
      _userModel!.value = null;
    } catch (error) {
      print(error);
    }
  }

  void signUpsaveUser(UserCredential userCredential) async {
    String? _myToken = await FirebaseMessaging.instance.getToken();
    _userModel!.value = UserModel(
      userId: userCredential.user!.uid,
      email: userCredential.user!.email!,
      name: name == null ? userCredential.user!.displayName! : this.name!,
      pic: userCredential.user!.photoURL == null
          ? 'default'
          : userCredential.user!.photoURL! + "?width=400",
      factoryId: 'none',
      role: 'worker',
      fcm: (_myToken == null) ? "" : _myToken,
    );
    FirestoreUser().addUserToFirestore(_userModel!.value!);
    saveLocalUser(_userModel!.value!);
  }

  Future saveLocalUser(UserModel userModel) async {
    LocalUserControl.setUserData(userModel);
  }
}
