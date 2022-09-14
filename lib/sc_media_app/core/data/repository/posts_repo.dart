import 'package:dio/dio.dart';
import 'package:test002/sc_media_app/core/api_constant.dart';
import 'package:test002/sc_media_app/helper/constant.dart';
import 'package:test002/sc_media_app/model/add_post_model.dart';

import '../api_client.dart';

class PostsRepo {
  late final ApiClient apiClient;

  PostsRepo({
    required this.apiClient,
  });

  Future<Response> getPosts()async{
    return await apiClient.getData(url: ApiConstant.getAllPosts , token: userToken);
  }


  Future<Response> postPosts(AddPostModel addPostModel,String token)async{
    return await apiClient.postData(url: ApiConstant.addPosts, data: addPostModel.toJson(),token: token);
  }



}
