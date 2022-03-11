import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_all_fe/common/export_this.dart';

class BaseView extends StatelessWidget {
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
        child: body(context),
      ),
      backgroundColor: Colors.white,
    );
  }

  Widget buildSuccess(BuildContext context) => Container();

  // buildError() => BaseErrorDialog(
  //       content: controller.message.value,
  //       showConfirm: false,
  //       mCancel: () => buildSuccess(Get.context!),
  //     );
  buildError() => Get.dialog(BaseErrorDialog(
        content: 'controller.message.value',
        showConfirm: false,
        mCancel: () => buildSuccess(Get.context!),
      ));

  // CircularProgressBar thay thế view (Không nhìn thấy view)
  Widget buildLoading() => const BaseIndicator();

  // CircularProgressBar đè lên trên view (View hiện mờ ở đằng sau)
  Widget buildWaiting() => Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 0,
            child: Container(
              height: 4,
              width: Get.width,
              color: Colors.black26.withOpacity(0.05),
              child: onLoading ?? const BaseIndicator(),
            ),
          ),
          Container(width: Get.width, height: Get.height, child: onSuccess ?? Container()),
        ],
      );

  Status _getStatus() {
    return status!;
  }

  Widget body(BuildContext context) {
    switch (_getStatus()) {
      case Status.error:
        return _buildSuccess(context);
      case Status.noConnection:
        return onFail ??
            BaseErrorDialog(content: 'controller.message.value', textButtonConfirm: 'Thử lại');
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
      return onFail ?? BaseErrorDialog(content: 'controller.message.value', showConfirm: false);
    }
    return buildSuccess(context);
  }

  Widget _buildLoading(BuildContext context) {
    if (onLoading != null) {
      return onLoading ?? const BaseIndicator();
    }
    return buildLoading();
  }

  Widget _buildWaiting(BuildContext context) {
    if (onWaiting != null) {
      return Stack(
        children: [
          Expanded(
            child: onSuccess ?? Container(),
          ),
          Container(
            color: Colors.black26.withOpacity(0.05),
            child: onLoading ?? const BaseIndicator(),
          ),
        ],
      );
    }
    return buildWaiting();
  }
}
