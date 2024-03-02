import 'package:fruit_e_commerce/features/Auth/domain/entities/user_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_data_model.g.dart';

@JsonSerializable()
class UserModel extends UserEntity {
  const UserModel({
    required String? displayName,
    required String? email,
    required String? photoUrl,
    required String? idToken,
    required String? accessToken,
    String? fcmToken,
    String? address,
    String? phoneNumber,
    required String? userId,
    
  }) : super(displayName: displayName, email: email, photoUrl: photoUrl, address: address, phoneNumber: phoneNumber, idToken: idToken, accessToken: accessToken, fcmToken: fcmToken, userId: userId);

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
