import 'dart:io';
import 'package:app_test/features/authentication/model/user_model.dart';
import 'package:app_test/utils/constants/api_constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  Future<Map<String, dynamic>> registerUser(UserModel user) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/signup'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user.toJson()),
    );

    final responseData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      UserModel userModel = const UserModel();
      if (responseData['data'] != null) {
        userModel = UserModel.fromJson(responseData['data']);
      } else {
        return {'user': null, 'message': 'User already exists'};
      }
      return {'user': userModel, 'message': 'Sign up successful'};
    } else {
      return {
        'user': null,
        'message': responseData['message'] ?? 'Failed to register'
      };
    }
  }

  Future<Map<String, dynamic>> loginUser(UserModel user) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user.toJson()),
    );

    final Map<String, dynamic> responseData = jsonDecode(response.body);
    final String? message = responseData['message'];
    final String token = responseData['token'];
    if (responseData['data'] != null) {
      UserModel userModel = const UserModel();
      if (responseData['data'] != null) {
        userModel = UserModel.fromJson(responseData['data']);
      } else {
        return {
          'token': null,
          'user': null,
          'message': message ?? 'Login failed'
        };
      }
      return {'token': token, 'user': userModel, 'message': 'Login successful'};
    } else {
      return {
        'token': null,
        'user': null,
        'message': message ?? Exception('Failed to login')
      };
    }
  }

  Future<UserModel> getUser(String id) async {
    final response = await http.get(
      Uri.parse('$baseUrl/auth/profile/$id'),
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get user');
    }
  }

  Future<UserModel> updateUser(UserModel user) async {
    final response = await http.put(
      Uri.parse('$baseUrl/auth/profile/${user.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update user');
    }
  }

  Future<void> deleteUser(String id) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/auth/profile/$id'),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete user');
    }
  }

  Future<void> storeToken(String token) async {
    if (Platform.isIOS) {
      final newUserDefault = SharedPreferences.getInstance();
      newUserDefault.then((prefs) {
        prefs.setString('token', token);
      });
    } else {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', token);
    }
  }

  Future<void> storeUser(UserModel user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user', jsonEncode(user.toJson()));
  }

  Future<UserModel?> getUserFromStorage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userString = prefs.getString('user');
    if (userString != null) {
      return UserModel.fromJson(jsonDecode(userString));
    } else {
      return null;
    }
  }

  Future<bool> hasSessionToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    final String? user = prefs.getString('user');
    return token != null && token.isNotEmpty && user != null && user.isNotEmpty;
  }

  Future<void> removeToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
  }

  Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') ?? '';
  }
}
