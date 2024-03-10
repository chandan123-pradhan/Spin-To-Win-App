import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spin_to_win/constant/sharedpref_constant.dart';

class HelperMethods {
  static void showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 3), // You can adjust the duration as needed
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static Future<bool> saveIdCache({required String id}) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString(SharedPrefConstant.ID, id);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<String> getUserId({required String key}) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      var value = sharedPreferences.getString(key);
      return value ?? '';
    } catch (e) {
      return '';
    }
  }
}
