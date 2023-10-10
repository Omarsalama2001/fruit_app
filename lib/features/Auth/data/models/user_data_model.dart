import 'package:fruit_e_commerce/features/Auth/domain/entities/user_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_data_model.g.dart';

@JsonSerializable()
class UserModel extends User {
  const UserModel({
    required String? displayName,
    required String? email,
    required String? photoUrl,
    required String? idToken,
    required String? accessToken,
  }) : super(displayName, email, photoUrl, idToken, accessToken);

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
