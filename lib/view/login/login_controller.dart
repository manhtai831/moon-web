import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shop_all_fe/common/constant.dart';
import 'package:shop_all_fe/common/core/sys/base_option_dropdown.dart';
import 'package:shop_all_fe/common/export_this.dart';
import 'package:shop_all_fe/common/module/notification_module.dart';
import 'package:shop_all_fe/system/model/sign_in.dart';
import 'package:shop_all_fe/system/model/user_information.dart';
import 'package:shop_all_fe/system/repository/user_repository.dart';

class LoginController extends BaseController {
  final _userRepository = UserRepository<LoginController>();
  Rx<UserInformation?> user = UserInformation().obs;
  var userName = TextEditingController();
  var password = TextEditingController();

  @override
  Future initialData() async {
    setStatus(Status.success);
  }

  @override
  Future<void> fetchData() async {
    super.fetchData();
    var response = await _userRepository.login(SignIn(password: '', userName: ''));
  }

  void showNotification() {
    NotificationModule.instance.show(hashCode, Constant.app_name, '1 thông báo mới');
  }
}
