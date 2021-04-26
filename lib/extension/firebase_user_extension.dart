part of 'extension.dart';

extension FirebaseAuthExtension on FirebaseUser {
  UserModel convertToUser({String nama = "No Name"}) =>
      UserModel(this.uid, this.email, nama: nama);

  Future<UserModel> fromFirestire() async =>
      await UserServices.getUser(this.uid);
}
