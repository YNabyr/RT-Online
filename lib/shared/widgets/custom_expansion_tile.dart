import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class CustomExpansionTile extends StatelessWidget {
  final int amount;
  final List<Widget> children;
  final String? title;

  const CustomExpansionTile({
    Key? key,
    required this.amount,
    required this.children,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomExpansionTileWidget(
      title: title ?? 'Januari',
      amount: amount,
      children: children,
    );
  }
}

class CustomExpansionTileWidget extends StatefulWidget {
  final String title;
  final int amount;
  final List<Widget> children;

  const CustomExpansionTileWidget({
    Key? key,
    required this.title,
    required this.amount,
    required this.children,
  }) : super(key: key);

  @override
  _CustomExpansionTileWidgetState createState() =>
      _CustomExpansionTileWidgetState();
}

class _CustomExpansionTileWidgetState extends State<CustomExpansionTileWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 358.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Row(
              children: [
                // Icon Image
                (!_isExpanded)
                    ? SvgPicture.asset("assets/outline/arrow-ios-right.svg")
                    : SvgPicture.asset("assets/outline/arrow-ios-down.svg"),

                8.horizontalSpace,

                // Bulan
                Text(
                  widget.title,
                  style: NunitoTextStyle.fw800.copyWith(
                    color: const Color(0xFF0B0C0D),
                    fontSize: 14.sp,
                  ),
                ),

                Expanded(child: Container()),

                // Nominal
                Text(
                  NumberFormat.currency(
                          locale: "id", decimalDigits: 0, symbol: "Rp ")
                      .format((widget.amount != null) ? widget.amount : 0),
                  style: NunitoTextStyle.fw800.copyWith(
                    color: const Color(0xFF0B0C0D),
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8.0),
          if (_isExpanded) // Content displayed when expanded
            Padding(
              padding: EdgeInsets.only(left: 32.w),
              child: Column(
                children: widget.children,
              ),
            ),
        ],
      ),
    );
  }
}
