import 'package:flutter_secure_storage/flutter_secure_storage.dart';
class ScureStorageServices {
  static final _storage = FlutterSecureStorage();
  Future <void> saveAuthData ({required String userToken})async{
    await _storage.write(key: 'token', value: userToken);
  }
  Future<String?> getUserToken ()async {
    final token = await _storage.read(key: 'token');
    return token;
  }
  Future<void> clearAuthData() async {
    await _storage.delete(key: 'token');
  }
}