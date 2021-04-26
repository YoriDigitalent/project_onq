part of 'services.dart';

class UserServices {
  static CollectionReference _userCollection =
      Firestore.instance.collection('users');

  static Future<void> updateUser(UserModel userModel) async {
    _userCollection
        .document(userModel.id)
        .setData({'email': userModel.email, 'nama': userModel.nama});
  }

  static Future<UserModel> getUser(String id) async {
    DocumentSnapshot snapshot = await _userCollection.document(id).get();

    return UserModel(id, snapshot.data['email'], nama: snapshot.data['nama']);
  }
}
