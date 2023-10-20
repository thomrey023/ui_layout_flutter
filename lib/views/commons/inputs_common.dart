// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:ui_layout_flutter/utilities/constants/themes_constants.dart';

/// Custom Date Text Field
/// Custom Text Field for Date inputs (does not accept dates before current date)
///
/// @param controller - A controller for an editable text field.
/// @param hintText - text that suggests what sort of input is needed
///
// @author Thomas Barcenas
// ANCHOR CustomDateTextField
class CustomDateTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const CustomDateTextField({
    Key? key,
    required this.controller,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          constraints: const BoxConstraints(maxWidth: 260.0),
          height: 35.0,
          child: TextField(
            textAlign: TextAlign.left,
            controller: controller,
            style: const TextStyle(fontSize: 16.0),
            readOnly: true,
            decoration: InputDecoration(
              fillColor: CColors.secondaryTextLightColor,
              contentPadding: const EdgeInsets.only(left: 16.0),
              hintText: hintText,
              hintStyle: const TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                  color: CColors.primaryTextLightColor),
              suffixIcon: const Padding(
                padding: EdgeInsets.only(left: 12.0, right: 26.0),
                child: Icon(
                  Icons.calendar_today_rounded,
                  color: CColors.primaryTextLightColor,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32.0),
                borderSide: const BorderSide(
                  color: CColors.secondaryButtonLightColor,
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32.0),
                borderSide:
                    const BorderSide(color: CColors.primaryButtonLightColor),
              ),
            ),
            onTap: () {
              showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2101))
                  .then((pickedDate) {
                if (pickedDate != null) {
                  final formattedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate);
                  controller.text = formattedDate;
                }
              });
            },
          ),
        ),
      ],
    );
  }
}
