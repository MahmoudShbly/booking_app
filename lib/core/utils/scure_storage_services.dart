import 'package:booking_app/features/auth/data/models/user_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
class ScureStorageServices {
  static final _storage = FlutterSecureStorage();
  Future <void> saveToken ({required String userToken})async{
    await _storage.write(key: 'token', value: userToken);
  }
  Future <void> saveUserData ({required String name , required String email , required String phone, required int id, required String role})async{
    await _storage.write(key: 'name', value: name);
    await _storage.write(key: 'email', value: email);
    await _storage.write(key: 'phone', value: phone);
    await _storage.write(key: 'id', value: id.toString());
    await _storage.write(key: 'role', value: role);
  
  }



  Future <UserModel?> getUserData ()async{
    final name = await _storage.read(key: 'name');
    final email = await _storage.read(key: 'email');
    final phone = await _storage.read(key: 'phone');
    final id = await _storage.read(key: 'id');
    final role = await _storage.read(key: 'role');
    if (name != null && email != null && phone != null && id != null && role != null) {
      return UserModel(name: name, email: email, phone: phone, id: int.parse(id) , role: role);
    }
    return null;
  }


  Future<String?> getUserToken ()async {
    final token = await _storage.read(key: 'token');
    return token;
  }
  Future<void> clearAuthData() async {
    await _storage.delete(key: 'token');
    await _storage.delete(key: 'name');
    await _storage.delete(key: 'email');
    await _storage.delete(key: 'phone');
    await _storage.delete(key: 'id');
    await _storage.delete(key: 'role');
  }
}