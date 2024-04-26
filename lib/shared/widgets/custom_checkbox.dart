import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venturo_core/features/pembayaran/controllers/pembayaran_controller.dart';

class CustomCheckbox extends StatefulWidget {
  CustomCheckbox({
    Key? key,
    this.size,
    this.iconSize,
    required this.onChange,
    this.backgroundColor,
    this.iconColor,
    this.icon,
    this.borderColor,
    this.isChecked = false,
  }) : super(key: key);

  double? size;
  double? iconSize;
  Function(bool value) onChange;
  Color? backgroundColor;
  Color? iconColor;
  Color? borderColor;
  IconData? icon;
  bool? isChecked;

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    isChecked = widget.isChecked!;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
          widget.onChange((isChecked));
        });
      },
      child: AnimatedContainer(
          height: widget.size?.w ?? 24.w,
          width: widget.size?.w ?? 24.w,
          duration: const Duration(milliseconds: 500),
          curve: Curves.fastLinearToSlowEaseIn,
          decoration: ShapeDecoration(
            color: (isChecked) ? const Color(0xFF6454F0) : Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
              side: !isChecked
                  ? const BorderSide(
                      width: 1,
                      color: Color(0xFFB5B7C4),
                    )
                  : BorderSide.none,
            ),
          ),
          child: isChecked
              ? Icon(
                  widget.icon ?? Icons.check,
                  color: widget.iconColor ?? Colors.white,
                  size: widget.iconSize ?? 14.4.w,
                )
              : null),
    );
  }
}
