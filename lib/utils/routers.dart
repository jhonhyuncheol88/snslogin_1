import 'package:get/get.dart';
import 'package:snslogin_1/controllers/home_controller.dart';
import 'package:snslogin_1/ui/home.dart';

class Routers {
  static final routes = [
    GetPage(
        name: '/home',
        page: () => Home(),
        binding: BindingsBuilder(() {
          Get.put<HomeController>(HomeController());
        }))
  ];
}
