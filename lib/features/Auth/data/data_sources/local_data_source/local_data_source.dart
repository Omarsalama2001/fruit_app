import 'package:fruit_e_commerce/core/constants/cache_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDataSource {
  void saveToken(String? token);
}

class LocalDataSourceImpl implements LocalDataSource {
  SharedPreferences sharedPreferences;
  LocalDataSourceImpl({
    required this.sharedPreferences,
  });
  // ignore: constant_identifier_names

  @override
  void saveToken(String? token) async {
    await sharedPreferences.setString(TOKENID_KEY, token!);
  }
}
