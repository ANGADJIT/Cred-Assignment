import 'package:credr_assignment/src/logic/auth/auth_excetion.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

/// This class is used for authentication methods using firebase
class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  /// method for signing in using email and password
  /// throws [AuthException] if any error occurs
  Future<void> signIn({required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw AuthException(e.code);
    }
  }

  /// This method is for social login using [GoogleSignIn]
  /// Throws [AuthException] with error code if any failure occurs
  Future<void> googleSignIn() async {
    try {
      final GoogleSignInAccount? user = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? authentication =
          await user?.authentication;

      // create  credential
      final credentials = GoogleAuthProvider.credential(
          accessToken: authentication?.accessToken,
          idToken: authentication?.idToken);

      // sign in now using credentials
      await _firebaseAuth.signInWithCredential(credentials);
    } catch (e) {
      throw AuthException(e.toString());
    }
  }

  /// This method is used to reset the password
  /// Throws [AuthException] with error code if any failure occurs
  Future<void> resetPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw AuthException(e.code);
    }
  }

  /// This method is used create user using email and password
  /// Throws [AuthException] with error code if any failure occurs
  Future signUp({required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw AuthException(e.code);
    }
  }

  /// This method logout the user from firebase
  /// Throws [AuthException] with error code if any failure occurs
  Future<void> logOut() async {
    try {
      await _firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      throw AuthException(e.code);
    }
  }
}
