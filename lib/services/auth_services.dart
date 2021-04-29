part of 'services.dart';

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<SignInSignUpResult> signUp(
      String email, String password, String nama) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      UserModel userModel = result.user.convertToUser(nama: nama);

      await UserServices.updateUser(userModel);

      return SignInSignUpResult(userModel: userModel);
    } catch (e) {
      return SignInSignUpResult(message: e.toString().split(',')[1].trim());
    }
  }

  static Future<SignInSignUpResult> signIn(
      String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      UserModel userModel = await result.user.fromFirestire();

      return SignInSignUpResult(userModel: userModel);
    } catch (e) {
      return SignInSignUpResult(message: e.toString().split(',')[1].trim());
    }
  }

  static Future<void> signOut() async {
    await _auth.signOut();
  }

  static Stream<FirebaseUser> get userStream => _auth.onAuthStateChanged;
}

class SignInSignUpResult {
  final UserModel userModel;
  final String message;

  SignInSignUpResult({this.userModel, this.message});
}
