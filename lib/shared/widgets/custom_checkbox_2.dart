import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCheckbox2 extends StatefulWidget {
  CustomCheckbox2({
    Key? key,
    this.size,
    this.iconSize,
    this.backgroundColor,
    this.iconColor,
    this.icon,
    this.onChange,
    this.borderColor,
    this.isCheckAll,
    this.isChecked = false,
  }) : super(key: key);

  double? size;
  double? iconSize;
  Function(bool value)? onChange;
  Color? backgroundColor;
  Color? iconColor;
  Color? borderColor;
  IconData? icon;
  bool isChecked;
  bool? isCheckAll;

  @override
  State<CustomCheckbox2> createState() => _CustomCheckboxState2();
}

class _CustomCheckboxState2 extends State<CustomCheckbox2> {
  @override
  void initState() {
    super.initState();
    widget.isChecked;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (widget.onChange != null) {
            widget.onChange!(widget.isChecked);
          }

          widget.isChecked = !widget.isChecked;

          if (widget.isCheckAll != null) {
            widget.isCheckAll = !widget.isCheckAll!;
            widget.isChecked = widget.isCheckAll!;
          }
        });
      },
      child: AnimatedContainer(
          height: widget.size?.w ?? 24.w,
          width: widget.size?.w ?? 24.w,
          duration: const Duration(milliseconds: 500),
          curve: Curves.fastLinearToSlowEaseIn,
          decoration: ShapeDecoration(
            color: (widget.isChecked)
                ? const Color(0xFF6454F0)
                : Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
              side: !widget.isChecked
                  ? const BorderSide(
                      width: 1,
                      color: Color(0xFFB5B7C4),
                    )
                  : BorderSide.none,
            ),
          ),
          child: widget.isChecked
              ? Icon(
                  widget.icon ?? Icons.check,
                  color: widget.iconColor ?? Colors.white,
                  size: widget.iconSize ?? 14.4.w,
                )
              : null),
    );
  }
}
