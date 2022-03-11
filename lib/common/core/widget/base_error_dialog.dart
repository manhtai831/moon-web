import 'package:flutter/material.dart';
import 'package:shop_all_fe/common/core/theme_manager.dart';

class BaseErrorDialog extends StatelessWidget {
  final String? title;
  final String? content;
  final String? textButtonConfirm;
  final String? textButtonCancel;
  final bool? showConfirm;
  final bool? showCancel;
  final Function? mConfirm;
  final Function? mCancel;

  const BaseErrorDialog(
      {Key? key,
      this.title,
      this.mConfirm,
      this.mCancel,
      this.showCancel,
      this.showConfirm,
      this.content,
      this.textButtonCancel,
      this.textButtonConfirm})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title ?? 'Thông báo', style: appStyle.textTheme.headline2),
      content: Text(content ?? '', style: appStyle.textTheme.bodyText1),
      insetPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      actions: [
        showConfirm ?? true
            ? TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  mConfirm?.call();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(textButtonConfirm ?? 'Đồng ý', style: appStyle.textTheme.headline3),
                ),
              )
            : const SizedBox(),
        showCancel ?? true
            ? TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  mCancel?.call();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(textButtonCancel ?? 'Hủy', style: appStyle.textTheme.headline6),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
