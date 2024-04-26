import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckboxPembayaran extends StatefulWidget {
  CheckboxPembayaran({
    Key? key,
    this.size,
    this.iconSize,
    this.backgroundColor,
    this.iconColor,
    this.icon,
    this.onChange,
    this.borderColor,
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

  @override
  State<CheckboxPembayaran> createState() => _CheckboxPembayaranState();
}

class _CheckboxPembayaranState extends State<CheckboxPembayaran> {
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
          widget.isChecked = !widget.isChecked;
          widget.onChange!(widget.isChecked);
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
