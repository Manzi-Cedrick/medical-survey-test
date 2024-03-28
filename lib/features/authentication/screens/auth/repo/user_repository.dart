import 'package:app_test/features/authentication/screens/auth/model/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserRepository {
  String baseUrl = 'https://medical-app-backend-opd5.onrender.com';

  Future<UserModel> registerUser(UserModel user) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/signup'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to register user');
    }
  }

  Future<UserModel> loginUser(UserModel user) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to login user');
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
}