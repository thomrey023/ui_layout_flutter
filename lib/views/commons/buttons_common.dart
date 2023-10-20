import 'package:flutter/material.dart';
import 'package:ui_layout_flutter/utilities/constants/themes_constants.dart';

/// Custom List Filter Button
/// A custom button that filters a list
///
/// @param text = text inside the button
/// @param doOnPressed = function performed when user clicks on the button
///
// @author Thomas Barcenas
// ANCHOR - CustomListFilterButton
class CustomListFilterButton extends StatelessWidget {
  final String text;
  final String activeButton;
  final VoidCallback doOnPressed;
  const CustomListFilterButton({
    Key? key,
    required this.text,
    required this.activeButton,
    required this.doOnPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: doOnPressed,
      style: OutlinedButton.styleFrom(
          backgroundColor:
              text == activeButton ? Colors.blue : CColors.trueWhite,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0))),
      child: SizedBox(
        width: 50.0,
        height: 30.0,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Center(
            child: Text(
                style: TextStyle(
                    color: text == activeButton
                        ? CColors.trueWhite
                        : CColors.primaryTextLightColor),
                text),
          ),
        ),
      ),
    );
  }
}
