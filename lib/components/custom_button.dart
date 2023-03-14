import 'package:flutter/material.dart';
import 'package:smart_house/app_config/style.dart';
import 'package:smart_house/generated/l10n.dart';

class CustomButton extends StatelessWidget {
  final String? label;
  final TextStyle? labelStyle;
  final String? icon;
  final Icon? materialIcon;
  final Color? iconColor;
  final double? iconGap;
  final Function()? onTap;
  final bool isOnlyIcon;
  final double? borderRadius;
  final double? width;
  final BoxDecoration? boxDecoration;
  final EdgeInsets? padding;
  final double? iconSize;
  final MainAxisAlignment? mainAxisAlignment;

  const CustomButton({
    Key? key,
    this.label,
    this.icon,
    this.onTap,
    this.isOnlyIcon = false,
    this.borderRadius,
    this.width,
    this.boxDecoration,
    this.padding,
    this.iconSize,
    this.iconColor,
    this.labelStyle,
    this.iconGap,
    this.mainAxisAlignment,
    this.materialIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        alignment: Alignment.center,
        padding: padding ??
            const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 20,
            ),
        decoration: boxDecoration ??
            AppTheme.poppedDecoration(borderRadius: borderRadius),
        child: Row(
          mainAxisAlignment: mainAxisAlignment ??
              (icon == null || materialIcon == null
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.start),
          children: [
            if (icon != null || materialIcon != null)
              Padding(
                padding: EdgeInsetsDirectional.only(
                    end: isOnlyIcon ? 0 : iconGap ?? 24.0),
                child: materialIcon ??
                    Image.asset(
                      icon!,
                      height: iconSize ?? 20,
                      color: iconColor,
                    ),
              ),
            if (!isOnlyIcon)
              Text(
                label ?? S.of(context).continuee,
                style: labelStyle ?? Theme.of(context).textTheme.bodyText1,
              ),
          ],
        ),
      ),
    );
  }
}
