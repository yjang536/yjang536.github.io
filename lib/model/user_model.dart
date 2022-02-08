class UserModel {
  late String userId, email, name, pic, factoryId, role, fcm;

  UserModel({
    required this.userId,
    required this.email,
    required this.name,
    required this.pic,
    required this.factoryId,
    required this.role,
    required this.fcm,
  });

  UserModel.fromJson(Map<dynamic, dynamic> map) {
    userId = map['userId'];
    email = map['email'];
    name = map['name'];
    pic = map['pic'];
    factoryId = map['factoryId'];
    role = map['role'];
    fcm = map['fcm'];
  }

  toJson() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'pic': pic,
      'factoryId': factoryId,
      'role': role,
      'fcm': fcm,
    };
  }
}
