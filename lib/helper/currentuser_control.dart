import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:micromobitech/helper/firestore.dart';
import 'package:micromobitech/helper/localuser_control.dart';
import 'package:micromobitech/model/user_model.dart';

class CurrentUserControl extends GetxController {
  UserModel? _currentUser;
  String? name, email, password, picUrl, factoryId, role;

  UserModel? get currentUser => _currentUser;

  bool _loading = false;

  bool get loading => _loading;

  @override
  void onInit() {
    print('get local user ###########################');
    super.onInit();
    getCurrentUser();
  }

  getCurrentUser() async {
    _loading = true;
    _currentUser = await LocalUserControl.getUserData();
    _loading = false;
    update();
  }

  updateCurrentUser() async {
    UserModel _getStoreUser;
    try {
      await FirestoreUser()
          .getUserFromFirestore(_currentUser!.userId)
          .then((doc) async {
        _getStoreUser = UserModel.fromJson(doc.data() as Map<dynamic, dynamic>);
        UserModel _userModel = UserModel(
            userId: _currentUser!.userId,
            email: email!,
            name: name!,
            pic: picUrl == null ? _currentUser!.pic : picUrl!,
            factoryId: _getStoreUser.factoryId,
            role: _getStoreUser.role,
            fcm: _currentUser!.fcm);

        print('!!!!!!!!!!!!!!!!!!!!');
        print(_getStoreUser.factoryId);

        await FirebaseAuth.instance.currentUser!.updateEmail(email!);
        await FirebaseAuth.instance.currentUser!.updatePassword(password!);
        FirestoreUser().addUserToFirestore(_userModel);
        await LocalUserControl.setUserData(_userModel);
        getCurrentUser();
        Get.back();
      });
    } catch (error) {
      String errorMessage =
          error.toString().substring(error.toString().indexOf(' ') + 1);
      Get.snackbar(
        'Failed to update..',
        errorMessage,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
