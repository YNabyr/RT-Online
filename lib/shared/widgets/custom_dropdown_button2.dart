import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venturo_core/shared/styles/google_text_style.dart';

class CustomDropdownButton2 extends StatefulWidget {
  const CustomDropdownButton2({
    required this.hint,
    required this.value,
    required this.dropdownItems,
    required this.onChanged,
    this.selectedItemBuilder,
    this.hintAlignment,
    this.valueAlignment,
    this.buttonHeight,
    this.buttonWidth,
    this.buttonPadding,
    this.buttonDecoration,
    this.buttonElevation,
    this.icon,
    this.iconSize,
    this.iconEnabledColor,
    this.iconDisabledColor,
    this.itemHeight,
    this.itemPadding,
    this.dropdownHeight,
    this.dropdownWidth,
    this.dropdownPadding,
    this.dropdownDecoration,
    this.dropdownElevation,
    this.scrollbarRadius,
    this.scrollbarThickness,
    this.scrollbarAlwaysShow,
    this.offset = Offset.zero,
    this.label,
    super.key,
    this.onMenuStateChange,
  });

  final String hint;
  final String? value;
  final List<String> dropdownItems;
  final ValueChanged<String?>? onChanged;
  final DropdownButtonBuilder? selectedItemBuilder;
  final Alignment? hintAlignment;
  final Alignment? valueAlignment;
  final double? buttonHeight, buttonWidth;
  final EdgeInsetsGeometry? buttonPadding;
  final BoxDecoration? buttonDecoration;
  final int? buttonElevation;
  final Widget? icon;
  final double? iconSize;
  final Color? iconEnabledColor;
  final Color? iconDisabledColor;
  final double? itemHeight;
  final EdgeInsetsGeometry? itemPadding;
  final double? dropdownHeight, dropdownWidth;
  final EdgeInsetsGeometry? dropdownPadding;
  final BoxDecoration? dropdownDecoration;
  final int? dropdownElevation;
  final Radius? scrollbarRadius;
  final double? scrollbarThickness;
  final bool? scrollbarAlwaysShow;
  final Offset offset;
  final String? label;
  final Function(bool)? onMenuStateChange;

  @override
  State<CustomDropdownButton2> createState() => _CustomDropdownButton2State();
}

class _CustomDropdownButton2State extends State<CustomDropdownButton2> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        (widget.label != null)
            ? Padding(
                padding: EdgeInsets.only(bottom: 8.w),
                child: Text(
                  widget.label!,
                  textAlign: TextAlign.start,
                  style: NunitoTextStyle.fw700.copyWith(
                    color: const Color(0xFF0B0C0D),
                    fontSize: 14.sp,
                  ),
                ),
              )
            : Container(),

        // Dropdown
        DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            //To avoid long text overflowing.
            isExpanded: true,
            onMenuStateChange: widget.onMenuStateChange,

            hint: Container(
              alignment: widget.hintAlignment,
              child: Text(
                widget.hint,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: NunitoTextStyle.fw400.copyWith(
                  color: const Color(0xFF9597A3),
                  fontSize: 14.sp,
                ),
              ),
            ),
            value: widget.value,
            items: widget.dropdownItems
                .map((dynamic item) => DropdownMenuItem<String>(
                      value: item,
                      child: Container(
                        alignment: widget.valueAlignment,
                        child: Text(
                          item,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: NunitoTextStyle.fw400.copyWith(
                            color: Colors.black,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ))
                .toList(),
            onChanged: widget.onChanged,
            selectedItemBuilder: widget.selectedItemBuilder,
            buttonStyleData: ButtonStyleData(
              height: widget.buttonHeight ?? 40.w,
              width: widget.buttonWidth ?? 382.w,
              padding: widget.buttonPadding ??
                  EdgeInsets.symmetric(horizontal: 12.w),
              decoration: widget.buttonDecoration ??
                  BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 8,
                        offset: Offset(4, 3),
                        color: Color.fromRGBO(0, 0, 0, 0.1),
                      )
                    ],
                  ),
              elevation: widget.buttonElevation,
            ),
            iconStyleData: IconStyleData(
              icon: widget.icon ??
                  ImageIcon(
                    const AssetImage("assets/images/ic_arrow_ios_down.png"),
                    size: 20.w,
                  ),
              iconSize: widget.iconSize ?? 20.w,
              iconEnabledColor: widget.iconEnabledColor,
              iconDisabledColor: widget.iconDisabledColor,
            ),
            dropdownStyleData: DropdownStyleData(
              //Max height for the dropdown menu & becoming scrollable if there are more items. If you pass Null it will take max height possible for the items.
              maxHeight: widget.dropdownHeight ?? 200.w,
              width: widget.dropdownWidth ?? 382.w,
              padding: widget.dropdownPadding,
              decoration: widget.dropdownDecoration ??
                  BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                  ),
              elevation: widget.dropdownElevation ?? 8,
              //Null or Offset(0, 0) will open just under the button. You can edit as you want.
              offset: widget.offset,
              scrollbarTheme: ScrollbarThemeData(
                radius: widget.scrollbarRadius ?? const Radius.circular(40),
                thickness: widget.scrollbarThickness != null
                    ? MaterialStateProperty.all<double>(
                        widget.scrollbarThickness!)
                    : null,
                thumbVisibility: widget.scrollbarAlwaysShow != null
                    ? MaterialStateProperty.all<bool>(
                        widget.scrollbarAlwaysShow!)
                    : null,
              ),
            ),
            menuItemStyleData: MenuItemStyleData(
              height: widget.itemHeight ?? 40.w,
              padding:
                  widget.itemPadding ?? EdgeInsets.symmetric(horizontal: 12.w),
            ),
          ),
        ),
      ],
    );
  }
}
