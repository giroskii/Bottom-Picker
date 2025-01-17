import 'package:bottom_picker/resources/arrays.dart';
import 'package:flutter/material.dart';

class BottomPickerButton extends StatelessWidget {
  final Function onClick;
  final List<Color> gradientColors;
  final Color iconColor;
  final String? text;
  final bool displayIcon;
  final TextStyle? textStyle;
  final Color? solidColor;
  final double? buttonPadding;
  final double? buttonWidth;
  final MainAxisAlignment buttonTextAlignment;

  BottomPickerButton({
    Key? key,
    required this.onClick,
    required this.iconColor,
    required this.buttonTextAlignment,
    this.text,
    this.textStyle,
    this.displayIcon = true,
    this.gradientColors = blueThemeColor,
    this.solidColor,
    this.buttonPadding,
    this.buttonWidth,
  }) : super(key: key) {
    if (!displayIcon) {
      assert(text != null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClick.call();
      },
      child: Container(
        width: buttonWidth,
        padding: EdgeInsets.all(buttonPadding ?? 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: solidColor,
          gradient: solidColor == null
              ? LinearGradient(
                  colors: gradientColors,
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 0.0),
                  stops: const [0.0, 1.0],
                  tileMode: TileMode.clamp,
                )
              : null,
        ),
        child: Row(
          mainAxisAlignment: buttonTextAlignment,
          children: [
            if (text != null) Text(text!, style: textStyle),
            if (displayIcon)
              Icon(
                Icons.done,
                color: iconColor,
                size: 20,
              ),
          ],
        ),
      ),
    );
  }
}
