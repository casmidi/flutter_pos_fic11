import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter_pos_fic11/data/models/response/auth_response_model.dart';
import 'package:http/http.dart' as http;

import '../../core/constants/variables.dart';
// import 'package:'

class AuthRemoteDatasource {
  Future<Either<String, AuthResponseModel>> login(
      String email, String password) async {
    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/login'),
      body: {
        'email': email,
        'password': password,
      },
    );
    if (response.statusCode == 200) {
      // return right(AuthResponseModel.fromJson(response.body));
      final Map<String, dynamic> responseBody = json.decode(response.body);
      return right(AuthResponseModel.fromJson(responseBody));
    } else {
      return left(response.body);
    }
  }
}
