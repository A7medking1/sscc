import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:test002/sc_media_app/helper/constant.dart';
import 'package:test002/sc_media_app/model/add_post_model.dart';
import 'package:test002/sc_media_app/views/widgets/show_toast.dart';
import '../../model/posts_model.dart';
import '../data/repository/posts_repo.dart';

class HomeController extends GetxController{

  late  PostsRepo postsRepo;

  HomeController({
    required this.postsRepo,
  });

  bool get isLoading => _isLoading;
  bool _isLoading = false;


  List<PostsModel> posts = [];


  String? caption, displayPicture, displayContent;


  Future getAllPosts()async{
    _isLoading = true;
    update();
    posts = [] ;
    await postsRepo.getPosts().then((value)
    {
      if(value.statusCode == 200)
      {
        value.data["content"].forEach((e)
        {
          posts.add(PostsModel.fromJson(e));
        });
      }else{
        showToast("please sign in", ToastStates.ERROR);
      }
      _isLoading = false;
      update();
    });
  }


  Future addPosts(AddPostModel addPostModel)async{
    _isLoading = true;
    update();
    await postsRepo.postPosts(addPostModel, userToken).then((value)
    async {
      if(value.statusCode == 201){
        getAllPosts();
        showToast("post added successfully", ToastStates.SUCCESS);
      }else{
        showToast(value.data["message"], ToastStates.ERROR);
      }
      _isLoading = false;
      update();
    });
    _isLoading = false;
    update();
  }




  @override
  void onInit() {
    getAllPosts();
    super.onInit();
  }

}