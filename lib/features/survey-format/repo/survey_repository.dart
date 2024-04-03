import 'package:app_test/features/authentication/repo/user_repository.dart';
import 'package:app_test/features/survey-format/model/survey_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SurveyRepository {
  final String baseUrl = 'https://medical-app-backend-opd5.onrender.com';
  final userRepository = UserRepository();
  Future<Map<String, dynamic>> saveSurvey(SurveyModel surveyModel) async {
    String token = await userRepository.getToken();
    final response = await http.post(
      Uri.parse('$baseUrl/api/v1/surveys/create'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(surveyModel.toJson()),
    );
    if (response.statusCode == 201) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      final surveyData = responseData['data'];
      final message = responseData['message'];
      SurveyModel surveyModel = SurveyModel.fromJson(surveyData);
      return {
        'survey': surveyModel,
        'message': message,
      };
    } else {
      return {
        'survey': null,
        'message': Exception('Failed to save survey'),
      };
    }
  }

  Future<List<SurveyModel>> getSurveys() async {
    final response = await http.get(
      Uri.parse('$baseUrl/api/v1/surveys/getAll'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> responseData = jsonDecode(response.body);
      List<SurveyModel> surveyList = [];
      for (int i = 0; i < responseData.length; i++) {
        surveyList.add(SurveyModel.fromJson(responseData[i]));
      }
      return surveyList;
    } else {
      throw Exception('Failed to get surveys');
    }
  }

  Future<SurveyModel> getSurvey(String id) async {
    final response = await http.get(
      Uri.parse('$baseUrl/api/v1/surveys/get/$id'),
    );

    if (response.statusCode == 200) {
      print(response.body);
      return SurveyModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get survey');
    }
  }

  Future<SurveyModel> updateSurvey(SurveyModel surveyModel) async {
    final response = await http.put(
      Uri.parse('$baseUrl/api/v1/surveys/update/${surveyModel.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(surveyModel.toJson()),
    );

    if (response.statusCode == 200) {
      return SurveyModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update survey');
    }
  }

  Future<void> deleteSurvey(String id) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/api/v1/surveys/delete/$id'),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete survey');
    }
  }
}
