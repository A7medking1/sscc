import 'package:dio/dio.dart';
import 'package:test002/sc_media_app/core/api_constant.dart';
import 'package:test002/sc_media_app/model/register_model.dart';

import '../../../model/login_model.dart';
import '../api_client.dart';

class AuthRepo {
  late final ApiClient apiClient;

  AuthRepo({
    required this.apiClient,
  });

  Future<Response> userRegister(RegisterModel registerModel) async {
    return await apiClient.postData(
        url: ApiConstant.registerUri, data: registerModel.toMap());
  }

  Future<Response> userLogin(LoginModel loginModel) async {
    return await apiClient.postData(
        url: ApiConstant.loginUri, data: loginModel.toMap());
  }

}
