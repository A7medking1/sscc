import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:test002/sc_media_app/core/controller/home_controller.dart';
import 'package:test002/sc_media_app/helper/constant.dart';
import 'package:test002/sc_media_app/model/posts_model.dart';
import 'package:test002/size_config.dart';

import '../../helper/cach_helper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    userToken =  CacheHelper.getData(key: "userToken");
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: GetBuilder<HomeController>(
        init: Get.find<HomeController>(),
        builder: (controller) => !controller.isLoading
            ? Column(
                children: [
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.posts.length,
                    itemBuilder: (context, index) =>
                        BuildPostItem(postsModel: controller.posts[index]),
                    separatorBuilder: (context, index) => SizedBox(
                      height: SizeConfig.height10,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.height10,
                  )
                ],
              )
            : const Center(child: LinearProgressIndicator()),
      ),
    );
  }
}

class BuildPostItem extends StatelessWidget {
  final PostsModel? postsModel;

  const BuildPostItem({Key? key, required this.postsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 210.0,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: EdgeInsets.symmetric(horizontal: SizeConfig.width10),
      child: Padding(
        padding: EdgeInsets.all(SizeConfig.height10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: SizeConfig.radius20 * 1.4,
                  backgroundImage: postsModel!.displayPicture!.contains("https")
                      ? CachedNetworkImageProvider(
                          postsModel!.displayPicture.toString(),
                        )
                      : const CachedNetworkImageProvider(
                          "https://yt3.ggpht.com/a/AATXAJyAEuD-HGcrBDFwLUMRqrFC1F7oaw4-7ccsbA=s900-c-k-c0xffffffff-no-rj-mo",
                        ),
                ),
                SizedBox(
                  width: SizeConfig.width20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            postsModel!.displayName.toString(),
                            style: const TextStyle(
                                height: 1.0, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.height10 / 2.5,
                      ),
                      Text(
                        DateFormat("yyyy-MM-dd")
                            .parse(postsModel!.createdAt!)
                            .toString(),
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: SizeConfig.width20,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_horiz,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: SizeConfig.width10,
              ),
              child: Container(
                width: double.infinity,
                height: 1.0,
                color: Colors.grey[300],
              ),
            ),
            Text(
              postsModel!.caption.toString(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                end: 10.0,
                top: 5,
                bottom: 7,
              ),
              child: SizedBox(
                width: double.infinity,
                child: Wrap(
                  children: [
                    SizedBox(
                      height: SizeConfig.height20,
                      child: MaterialButton(
                        minWidth: 1.0,
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        child: Text('#software',
                            style:
                                Theme.of(context).textTheme.caption!.copyWith(
                                      color: AppConstant.primaryColor,
                                    )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            postsModel!.displayContent!.contains("https")
                ?
            Container(
              width: double.infinity,
              height: SizeConfig.height170,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(SizeConfig.radius15),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                          postsModel!.displayContent.toString(),
                        ),
                  fit: BoxFit.cover,
                ),
              ),
            ) : Container(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: SizeConfig.width10 / 2),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: SizeConfig.width10),
                      child: InkWell(
                        child: Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.red,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              '120',
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: InkWell(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Icon(
                              Icons.chat,
                              color: Colors.amber,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              '120 comment',
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Container(
                width: double.infinity,
                height: 1.0,
                color: Colors.grey[300],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 18.0,
                          backgroundImage: NetworkImage(
                              'https://image.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg'),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Write a comment',
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
                InkWell(
                  child: Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.red,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Like',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
