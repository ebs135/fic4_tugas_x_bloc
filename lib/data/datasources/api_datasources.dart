import 'package:fic4_tugas_x_bloc/data/models/request/login_model.dart';
import 'package:fic4_tugas_x_bloc/data/models/request/register_model.dart';
import 'package:fic4_tugas_x_bloc/data/models/response/login_response_model.dart';
import 'package:fic4_tugas_x_bloc/data/models/response/register_response_model.dart';
import 'package:http/http.dart' as http;

class ApiDataSource {
  Future<RegisterResponseModel> register(RegisterModel registerModel) async {
    final response = await http.post(
      Uri.parse('https://api.escuelajs.co/api/v1/users/'),
      body: registerModel.toMap(),
    );

    final result = RegisterResponseModel.fromJson(response.body);
    return result;
  }

  Future<LoginResponseModel> login(LoginModel loginModel) async {
    final response = await http.post(
        Uri.parse('https://api.escuelajs.co/api/v1/auth/login'),
        body: loginModel.toMap());

    final result = LoginResponseModel.fromJson(response.body);
    return result;
  }
}
