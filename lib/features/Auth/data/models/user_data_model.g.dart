// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      displayName: json['displayName'] as String,
      email: json['email'] as String,
      photoUrl: json['photoUrl'] as String,
      idToken: json['idToken'] as String,
      accessToken: json['accessToken'] as String,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'displayName': instance.displayName,
      'email': instance.email,
      'photoUrl': instance.photoUrl,
      'idToken': instance.idToken,
      'accessToken': instance.accessToken,
    };
