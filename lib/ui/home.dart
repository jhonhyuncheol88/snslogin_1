import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:snslogin_1/controllers/home_controller.dart';

class Home extends GetView<HomeController> {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
                child: Text('kakao로그인'),
                onPressed: () async {
                  await controller.login();
                }),
          ),
          SizedBox(
            height: 20,
          ),
          Obx(() => Text('controller.islogin.value'))
        ],
      ),
    );
  }
}
