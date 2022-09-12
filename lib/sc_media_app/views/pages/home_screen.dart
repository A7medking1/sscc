import 'package:flutter/material.dart';
import 'package:test002/sc_media_app/helper/cach_helper.dart';
import 'package:test002/sc_media_app/views/widgets/custom_button.dart';

class HomeScreen extends StatelessWidget
{
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: CustomButton(
              onTap: (){
                CacheHelper.clearALlData();
              },
              height: 40,
              color: Colors.amber,
              text: "log Out",
            ),
          ),
        ],
      ),
    );
  }
}
