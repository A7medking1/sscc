import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../size_config.dart';

class LoadingHomePageShimmer extends StatelessWidget {
  const LoadingHomePageShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          padding: EdgeInsetsDirectional.only(
            start: SizeConfig.height20,
            end: SizeConfig.height20,
            top: SizeConfig.height20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: SizeConfig.height30,
                  width: SizeConfig.height100 * 3,
                  alignment: Alignment.topLeft,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: SizeConfig.height30,
              ),
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: SizeConfig.height170,
                  margin: EdgeInsetsDirectional.only(
                    start: SizeConfig.height30,
                    end: SizeConfig.width30,
                    top: SizeConfig.height10,
                  ),
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: SizeConfig.height30,
              ),
              Expanded(
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: ListView.builder(
                    itemBuilder: (_, __) => Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: SizeConfig.height40,
                            height: SizeConfig.height40,
                            color: Colors.white,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width: double.infinity,
                                  height: SizeConfig.height10,
                                  color: Colors.white,
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 2.0),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: SizeConfig.height10,
                                  color: Colors.white,
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 2.0),
                                ),
                                Container(
                                  width: SizeConfig.height40,
                                  height: SizeConfig.height10,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    itemCount: 5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
