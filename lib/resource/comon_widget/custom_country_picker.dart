// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:data_collection_app/resource/app_colors/App_Colors.dart';
import '../utilitis/common_style.dart';

class CustomCountryPicker extends StatefulWidget {
  final String titleText;
  final String hintText;
  final TextEditingController? controller;
  final bool? isLabelHidden;
  final String defaultIsoCode;
  final String? selectedCountryCode;
  final Function(String)? onCountryChanged;
  final String? errorText;
  final bool readOnly;

  CustomCountryPicker({
    Key? key,
    required this.titleText,
    required this.hintText,
    this.controller,
    this.isLabelHidden = false,
    this.defaultIsoCode = 'BD',
    this.selectedCountryCode,
    this.onCountryChanged,
    this.errorText,
    this.readOnly = false,
  }) : super(key: key);

  @override
  State<CustomCountryPicker> createState() => _CustomCountryPickerState();
}

class _CustomCountryPickerState extends State<CustomCountryPicker> {
  final FocusNode _focusNode = FocusNode();
  PhoneNumber? _phoneNumber;
  late PhoneNumber _initialPhoneNumber;

  @override
  void initState() {
    super.initState();
    _initialPhoneNumber = PhoneNumber(isoCode: widget.defaultIsoCode);
    _phoneNumber = _initialPhoneNumber;
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void didUpdateWidget(CustomCountryPicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.defaultIsoCode != widget.defaultIsoCode) {
      setState(() {
        _initialPhoneNumber = PhoneNumber(isoCode: widget.defaultIsoCode);
        _phoneNumber = _initialPhoneNumber;
      });
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _onInputChanged(PhoneNumber number) {
    setState(() {
      _phoneNumber = number;
    });

    if (widget.controller != null) {
      // Extract only the phone number without country code for validation
      String phoneOnly = number.phoneNumber?.replaceFirst(number.dialCode ?? '', '') ?? '';
      widget.controller!.text = phoneOnly.trim();
    }

    if (widget.onCountryChanged != null) {
      widget.onCountryChanged!(number.dialCode ?? '');
    }
  }

  @override
  Widget build(BuildContext context) {
    bool hasError = widget.errorText != null && widget.errorText!.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!widget.isLabelHidden!)
          Text(
            widget.titleText,
            style: CommonStyle.textStyleMedium(size: 16),
          ),
        if (!widget.isLabelHidden!)
          const SizedBox(height: 4),

        GestureDetector(
          onTap: widget.readOnly ? null : () {
            FocusScope.of(context).requestFocus(_focusNode);
          },
          child: Container(
            height: MediaQuery.of(context).size.height * 0.07,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: widget.readOnly ? Colors.grey.shade100 : Colors.transparent,
              border: Border.all(
                color: hasError
                    ? Colors.red
                    : _focusNode.hasFocus
                    ? AppColors.mainColor
                    : Color(0xffcacaca),
                width: hasError ? 2 : 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Material(
              color: Colors.transparent,
              child: InternationalPhoneNumberInput(
                key: ValueKey(widget.defaultIsoCode),
                focusNode: _focusNode,
                inputBorder: InputBorder.none,
                onInputChanged: _onInputChanged,
                selectorConfig: SelectorConfig(
                  selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                  useEmoji: true,
                  setSelectorButtonAsPrefixIcon: true,
                  leadingPadding: 8,
                ),
                ignoreBlank: false,
                autoValidateMode: AutovalidateMode.disabled,
                selectorTextStyle: TextStyle(
                  color: _focusNode.hasFocus ? AppColors.mainColor : Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                initialValue: _initialPhoneNumber,
                formatInput: true,
                textFieldController: widget.controller,
                spaceBetweenSelectorAndTextField: 8,
                inputDecoration: InputDecoration(
                  hintText: widget.hintText,
                  hintStyle: GoogleFonts.urbanist(
                    color: Color(0xff595959),
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 5),
                  enabled: !widget.readOnly,
                ),
                isEnabled: !widget.readOnly,
              ),
            ),
          ),
        ),

        // Error message
        if (hasError)
          Padding(
            padding: EdgeInsets.only(top: 4),
            child: Text(
              widget.errorText!,
              style: TextStyle(
                color: Colors.red,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
      ],
    );
  }
}