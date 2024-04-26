import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:venturo_core/shared/models/login.dart';

// Local DB Service using shared preferences
class LocalDBServices {
  // Ensures that this class cannot be instantiated
  LocalDBServices._();

  // Save user data to shared preferences
  static Future<void> setUser(Login login, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var accessToken = json.encode(login.data?.accessToken);
    String token = accessToken.substring(1, accessToken.length - 1);
    var userInfo = json.encode(login.data?.user);
    await prefs.setBool('isLoggedIn', true);
    await prefs.setString("access_token", "Bearer $token");
    await prefs.setString('userInfo', userInfo);
    await prefs.setString('userPassword', password);
    await prefs.setString(
      'userPhoneNumber',
      jsonDecode(userInfo)['phone_number'],
    );

    print("INI ACCESS TOKEN : ");
    print(prefs.getString('access_token'));
  }

  // Get user from shared preference
  static Future<Login?> getUser(String? phoneNumber, String? password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? user = prefs.getString('userInfo');

    if (user == null) {
      return null;
    } else {
      // Get UserInfo
      phoneNumber = prefs.getString('userPhoneNumber');
      password = prefs.getString('password');
      return Login.fromJson(json.decode(user));
    }
  }

  // Delete user data from shared preference
  static Future<void> clearUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('isLoggedIn');
    await prefs.remove('userInfo');
    await prefs.remove('userPassword');
    await prefs.remove('userPhoneNumber');
    await prefs.remove('access_token');
  }
}
