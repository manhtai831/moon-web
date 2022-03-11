import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_all_fe/common/export_this.dart';

class BaseView<T extends BaseController> extends GetWidget<T> {
  final Status? status;
  final Widget? onSuccess;
  final Widget? onFail;
  final Widget? onLoading;
  final Widget? onWaiting;
  final String? content;

  const BaseView(
      {Key? key,
      this.status,
      this.onSuccess,
      this.onFail,
      this.onLoading,
      this.content,
      this.onWaiting})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() => body(context)),
      ),
      backgroundColor: Colors.white,
    );
  }

  Widget buildSuccess(BuildContext context) => Container();

  Widget buildError() => BaseErrorDialog(content: controller.message.value, showConfirm: false);

  // CircularProgressBar thay thế view (Không nhìn thấy view)
  Widget buildLoading() => const BaseIndicator();

  // CircularProgressBar đè lên trên view (View hiện mờ ở đằng sau)
  Widget buildWaiting() => Column(
        children: [
          Container(
            color: Colors.black26.withOpacity(0.05),
            child: onLoading ?? const BaseIndicator(),
          ),
          Expanded(
            child: onSuccess ?? Container(),
          ),
        ],
      );

  Status _getStatus() {
    return status ?? Get.find<T>().status.value;
  }

  Widget body(BuildContext context) {
    switch (_getStatus()) {
      case Status.error:
        return _buildError(context);
      case Status.noConnection:
        return onFail ??
            BaseErrorDialog(content: controller.message.value, textButtonConfirm: 'Thử lại');
      case Status.loading:
        return _buildLoading(context);
      case Status.waiting:
        return _buildWaiting(context);
      default:
        return _buildSuccess(context);
    }
  }

  Widget _buildSuccess(BuildContext context) {
    if (onSuccess != null) return onSuccess ?? Container();
    return buildSuccess(context);
  }

  Widget _buildError(BuildContext context) {
    if (onFail != null) {
      return onFail ?? BaseErrorDialog(content: controller.message.value, showConfirm: false);
    }
    return buildError();
  }

  Widget _buildLoading(BuildContext context) {
    if (onLoading != null) {
      return onLoading ?? const BaseIndicator();
    }
    return buildLoading();
  }

  Widget _buildWaiting(BuildContext context) {
    if (onWaiting != null) {
      return Column(
        children: [
          Container(
            color: Colors.black26.withOpacity(0.05),
            child: onLoading ?? const BaseIndicator(),
          ),
          Expanded(
            child: onSuccess ?? Container(),
          ),
        ],
      );
    }
    return buildWaiting();
  }
}
