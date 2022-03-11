import 'package:flutter/material.dart';
import 'package:shop_all_fe/common/export_this.dart';

@immutable
class BaseTextFormField extends StatefulWidget {
  final TextEditingController editingController;
  final Function(String value)? onChange;
  final String? Function(String? value)? onValidator;
  final Function(String value)? onFieldSubmitted;
  final Function()? onEditingComplete;
  final Function()? onTab;
  final bool? readOnly;
  final bool? enable;
  final bool? obscureText;
  final TextInputType? textInputType;
  final int? maxLines;
  final Icon? headIcon;
  final String? hint, label, error;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final TextCapitalization? textCapitalization;
  final TextStyle? hintStyle;
  final int? maxLength;
  final double? borderRadius;
  final double? paddingSuffixIcon;
  final double? paddingPrefixIcon;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Widget? icon;
  final EdgeInsetsGeometry? contentPadding;

  // cach mot khoang le ben trai mac dinh
  final bool? filled;
  final Color? bg;

  // giam chieu cao mac dinh cua texfield
  final bool? isDense;
  final bool? isBorder;

  // textField khong con gach chan va khoang cach
  final bool? isCollapsed;
  final OutlineInputBorder? enabledBorder;
  final OutlineInputBorder? focusedBorder;
  final OutlineInputBorder? errorBorder;
  final OutlineInputBorder? focusedErrorBorder;

  const BaseTextFormField({
    required this.editingController,
    this.onChange,
    this.maxLines,
    this.onValidator,
    this.readOnly,
    this.error,
    this.headIcon,
    this.enable,
    this.textInputType,
    Key? key,
    this.hint,
    this.label,
    this.focusNode,
    this.textInputAction,
    this.textCapitalization,
    this.hintStyle,
    this.maxLength,
    this.borderRadius,
    this.paddingSuffixIcon,
    this.paddingPrefixIcon,
    this.suffixIcon,
    this.prefixIcon,
    this.contentPadding,
    this.obscureText,
    this.bg,
    this.onFieldSubmitted,
    this.onEditingComplete,
    this.onTab,
    this.icon,
    this.isDense = true,
    this.isBorder = true,
    this.enabledBorder,
    this.focusedBorder,
    this.errorBorder,
    this.focusedErrorBorder,
    this.filled,
    this.isCollapsed = false,
  }) : super(key: key);

  @override
  State<BaseTextFormField> createState() => _BaseTextFormFieldState();
}

class _BaseTextFormFieldState extends State<BaseTextFormField> {
  final Color? _highColor = ColorResource.primary;
  final Color? _lowColor = ColorResource.colorHintText;
  Color? _labelColor = ColorResource.colorHintText;

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (hasFocus) {
        setState(() => _labelColor = hasFocus ? _highColor : _lowColor);
      },
      child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        focusNode: widget.focusNode,
        controller: widget.editingController,
        readOnly: widget.readOnly ?? false,
        enabled: widget.enable ?? true,
        maxLines: widget.maxLines ?? 1,
        keyboardType: widget.textInputType ?? TextInputType.text,
        textInputAction: widget.textInputAction ?? TextInputAction.next,
        textCapitalization: widget.textCapitalization ?? TextCapitalization.sentences,
        maxLength: widget.maxLength,
        obscureText: widget.obscureText ?? false,
        decoration: border(),
        onChanged: widget.onChange,
        onFieldSubmitted: widget.onFieldSubmitted,
        validator: widget.onValidator,
        onEditingComplete: widget.onEditingComplete,
        onTap: widget.onTab,
      ),
    );
  }

  InputDecoration border() {
    double widthBorder = 1.5;
    return !widget.isCollapsed!
        ? InputDecoration(
            hintStyle: widget.hintStyle ??
                appStyle.textTheme.bodyText1?.apply(color: ColorResource.colorHintText),
            hintText: widget.hint,
            errorText: widget.error,
            label: widget.label != null
                ? Text(
                    widget.label ?? '',
                    style: appStyle.textTheme.bodyText1?.apply(color: _labelColor),
                  )
                : Text(widget.hint ?? '',
                    style: appStyle.textTheme.bodyText1?.apply(color: _labelColor)),
            suffixIcon: widget.suffixIcon,
            suffixIconConstraints: BoxConstraints(
              minWidth: widget.paddingSuffixIcon ?? 36,
              minHeight: widget.paddingSuffixIcon ?? 36,
            ),
            prefixIcon: widget.prefixIcon,
            prefixIconConstraints: BoxConstraints(
              minWidth: widget.paddingPrefixIcon ?? 36,
              minHeight: widget.paddingPrefixIcon ?? 36,
            ),
            contentPadding: widget.contentPadding,
            filled: widget.filled,
            fillColor: widget.bg ?? Colors.white,
            icon: widget.icon,
            isDense: widget.isDense,
            enabledBorder: widget.isBorder!
                ? widget.enabledBorder ??
                    OutlineInputBorder(
                      borderSide: BorderSide(width: widthBorder, color: Colors.black12),
                      borderRadius: BorderRadius.all(
                        Radius.circular(widget.borderRadius ?? 8),
                      ),
                    )
                : null,
            focusedBorder: widget.isBorder!
                ? widget.focusedBorder ??
                    OutlineInputBorder(
                      borderSide:
                          BorderSide(width: widthBorder, color: ColorResource.primarySwatch),
                      borderRadius: BorderRadius.all(
                        Radius.circular(widget.borderRadius ?? 8),
                      ),
                    )
                : null,
            errorBorder: widget.isBorder!
                ? widget.errorBorder ??
                    OutlineInputBorder(
                      borderSide: BorderSide(width: widthBorder, color: Colors.red),
                      borderRadius: BorderRadius.all(
                        Radius.circular(widget.borderRadius ?? 8),
                      ),
                    )
                : null,
            focusedErrorBorder: widget.isBorder!
                ? widget.focusedErrorBorder ??
                    OutlineInputBorder(
                      borderSide: BorderSide(width: widthBorder, color: Colors.red),
                      borderRadius: BorderRadius.all(
                        Radius.circular(widget.borderRadius ?? 8),
                      ),
                    )
                : null,
          )
        : InputDecoration.collapsed(
            hintStyle: widget.hintStyle,
            hintText: widget.hint,
            fillColor: widget.bg,
          );
  }
}
