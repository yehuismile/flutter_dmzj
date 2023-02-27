import 'package:flutter/material.dart';
import 'package:flutter_dmzj/app/controller/app_settings_controller.dart';
import 'package:flutter_dmzj/app/utils.dart';
import 'package:flutter_dmzj/services/user_service.dart';

import 'package:get/get.dart';

class UserHomeController extends GetxController {
  final AppSettingsController settingController =
      Get.find<AppSettingsController>();
  @override
  void onInit() {
    UserService.instance.refreshProfile();
    super.onInit();
  }

  /// 登录
  void login() {
    UserService.instance.login();
  }

  /// 退出登录
  void logout() async {
    var result = await Utils.showAlertDialog(
      "确定要退出登录吗？",
      title: "退出登录",
    );
    if (result) {
      UserService.instance.logout();
    }
  }

  /// 主题设置
  void setTheme() {
    settingController.changeTheme();
  }

  /// 关于我们
  void about() {
    Get.dialog(AboutDialog(
      applicationIcon: Image.asset(
        'assets/images/logo.png',
        width: 48,
        height: 48,
      ),
      applicationName: "动漫之家Flutter",
      applicationLegalese: Utils.packageInfo.version,
    ));
  }

  /// 检查更新
  void checkUpdate() {
    Utils.checkUpdate(showMsg: true);
  }
}
