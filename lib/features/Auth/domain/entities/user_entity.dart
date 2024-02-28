import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? displayName;
  final String? email;
  final String? photoUrl;
  final String? address;
  final String? phoneNumber;
  final String? idToken;
  final String? accessToken;
  final String? fcmToken;
  final String? userId;

  const UserEntity({
  required  this.displayName,
  required  this.email,
  required  this.photoUrl,
  required this.address,
  required   this.phoneNumber,
  required  this.idToken,
  required this.accessToken,
  required this.fcmToken,
  required this.userId,
  });

  @override
  List<Object?> get props => [displayName, email, photoUrl, idToken, accessToken, phoneNumber, address];
}
