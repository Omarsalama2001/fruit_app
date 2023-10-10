import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:fruit_e_commerce/core/error/exeptions.dart';
import 'package:fruit_e_commerce/features/Auth/data/data_sources/local_data_source/local_data_source.dart';
import 'package:fruit_e_commerce/features/Auth/data/models/user_data_model.dart';

abstract class RemoteDataSource {
  Future<UserModel> loign({required bool isGoogle});
}

class RemoteDataSourceImpl extends RemoteDataSource {
  LocalDataSource localDataSource;
  RemoteDataSourceImpl({
    required this.localDataSource,
  });
  @override
  Future<UserModel> loign({required bool isGoogle}) async {
    UserCredential userCredential;
    try {
      userCredential = isGoogle ? await signInWithGoogle() : await signInWithFacebook();
      localDataSource.saveToken(await userCredential.user!.getIdToken());
    } catch (error) {
      throw ServerException(exceptionName: error.toString());
    }
    final UserModel userModel = UserModel(displayName: userCredential.user!.displayName, email: userCredential.user!.email, photoUrl: userCredential.user!.photoURL, idToken: await userCredential.user!.getIdToken(), accessToken: userCredential.credential!.accessToken);
    return Future.value(userModel);
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
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login(permissions: ['public_profile']);

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }
}
