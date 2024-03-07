import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:fruit_e_commerce/core/error/exeptions.dart';
import 'package:fruit_e_commerce/features/Auth/data/data_sources/local_data_source/local_data_source.dart';
import 'package:fruit_e_commerce/features/Auth/data/models/user_data_model.dart';

abstract class RemoteDataSource {
  Future<UserModel> login({required bool isGoogle});
  Future<UserModel> loginWithEmailAndPassword(String email, String password);
  Future<Unit> saveAdditionalUserData(String adress, String phoneNumber, String fcmToken);
  Future<Unit> sendEmailVerification();
  Future<Unit> sendPasswordResetEmail({required String email});
}

class RemoteDataSourceImpl extends RemoteDataSource {
  LocalDataSource localDataSource;
  FirebaseFirestore firestore;
  FirebaseAuth firebaseAuth;
  RemoteDataSourceImpl({
    required this.localDataSource,
    required this.firestore,
    required this.firebaseAuth,
  });
  @override
  Future<UserModel> login({required bool isGoogle}) async {
    UserCredential userCredential;

    try {
      userCredential = isGoogle ? await signInWithGoogle() : await signInWithFacebook();
      localDataSource.saveToken(await userCredential.user!.getIdToken());
    } catch (error) {
      throw ServerException();
    }
    final UserModel userModel = UserModel(displayName: userCredential.user!.displayName, email: userCredential.user!.email, photoUrl: userCredential.user!.photoURL, idToken: await userCredential.user!.getIdToken(), accessToken: userCredential.credential!.accessToken, userId: userCredential.user!.uid);

    return Future.value(userModel);
  }

  @override
  Future<UserModel> loginWithEmailAndPassword(String email, String password) async {
    final UserCredential userCredential;
    try {
      userCredential = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user!.emailVerified) {
        localDataSource.saveToken(await userCredential.user!.getIdToken());
        // ignore: prefer_const_constructors
        final UserModel userModel = UserModel(displayName: "userCredential.user!.displayName", email: " userCredential.user!.email", photoUrl: "userCredential.user!.photoURL", idToken: "userCredential.user!.getIdToken()", accessToken: "userCredential.credential!.accessToken", userId: "userCredential.user!.uid");
        return Future.value(userModel);
      } else {
        throw EmailNotVerifiedException();
      }
    } on FirebaseAuthException catch (error) {
      throw AuthException(errorCode: error.code);
    } on FirebaseException {
      throw ServerException();
    }
  }

  @override
  Future<Unit> sendEmailVerification() async {
    try {
      await firebaseAuth.currentUser!.sendEmailVerification();
      firebaseAuth.currentUser!.reload();
      return unit;
    } on FirebaseAuthException catch (error) {
      throw AuthException(errorCode: error.code);
    } on FirebaseException {
      throw ServerException();
    }
  }

  @override
  Future<Unit> sendPasswordResetEmail({required String email}) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
      return Future.value(unit);
    } on FirebaseAuthException catch (error) {
      throw AuthException(errorCode: error.code);
    } on FirebaseException {
      throw ServerException();
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn(scopes: ['email', 'profile']).signIn();
    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<UserCredential> signInWithFacebook() async {
    // have some problems here
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login(permissions: ['public_profile']);

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  @override
  Future<Unit> saveAdditionalUserData(String adress, String phoneNumber, String fcmToken) {
    firestore.collection('user').doc(FirebaseAuth.instance.currentUser!.uid).set(<String, dynamic>{'address': adress, 'fcmToken': fcmToken, 'phoneNumber': phoneNumber});
    return Future.value(unit);
  }
}
