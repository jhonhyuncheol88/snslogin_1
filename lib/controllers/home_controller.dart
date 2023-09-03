import 'package:get/get.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

class HomeController extends GetxController {
  RxBool islogin = false.obs;

  Future<bool> login() async {
    try {
      bool isInstalled = await isKakaoTalkInstalled();
      if (isInstalled) {
        try {
          await UserApi.instance.loginWithKakaoTalk();
          return true;
        } catch (e) {
          return false;
        }
      } else {
        try {
          await UserApi.instance.loginWithKakaoAccount();
          return true;
        } catch (e) {
          return false;
        }
      }
    } catch (e) {
      return false;
    }
  }

  Future logout() async {
    try {
      await UserApi.instance.logout();
      print('로그아웃 성공, SDK에서 토큰 삭제');
      islogin.value = false;
    } catch (error) {
      print('로그아웃 실패, SDK에서 토큰 삭제 $error');
    }
  }
}

Future<String?> fetchKakaoUserEmail() async {
  try {
    // 현재 로그인된 사용자의 정보를 가져옵니다.
    final User user = await UserApi.instance.me();

    // 이메일을 반환합니다.
    return user.kakaoAccount?.email;
  } catch (e) {
    print("Failed to fetch user email: $e");
    return null;
  }
}
