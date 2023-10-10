import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? displayName;
  final String? email;
  final String? photoUrl;
  final String? idToken;
  final String? accessToken;

  const User(this.displayName, this.email, this.photoUrl, this.idToken, this.accessToken);

  @override
  List<Object?> get props => [displayName, email, photoUrl, idToken, accessToken];
}
