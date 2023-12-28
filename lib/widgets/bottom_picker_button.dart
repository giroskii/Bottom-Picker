import 'package:bottom_picker/resources/arrays.dart';
import 'package:flutter/material.dart';

class BottomPickerButton extends StatelessWidget {
  final Function onClick;
  final Function onReset;
  final List<Color> gradientColors;
  final Color iconColor;
  final String? text;
  final String? text2;
  final bool displayIcon;
  final TextStyle? textStyle;
  final Color? solidColor;
  final Color? solidColor2;

  BottomPickerButton({
    Key? key,
    required this.onClick,
    required this.onReset,
    required this.iconColor,
    this.text,
    this.text2,
    this.textStyle,
    this.displayIcon = true,
    this.gradientColors = blueThemeColor,
    this.solidColor,
    this.solidColor2,
  }) : super(key: key) {
    if (!displayIcon) {
      assert(text != null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            onReset.call();
          },
          child: Container(
            height: 60,
            width: MediaQuery.of(context).size.width / 2.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: solidColor2,
              gradient: solidColor2 == null
                  ? LinearGradient(
                      colors: gradientColors,
                      begin: const FractionalOffset(0.0, 0.0),
                      end: const FractionalOffset(1.0, 0.0),
                      stops: const [0.0, 1.0],
                      tileMode: TileMode.clamp,
                    )
                  : null,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (text2 != null) Text(text2!, style: textStyle),
                  if (displayIcon)
                    Icon(
                      Icons.done,
                      color: iconColor,
                      size: 20,
                    ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
        InkWell(
          onTap: () {
            onClick.call();
          },
          child: Container(
            height: 60,
            width: MediaQuery.of(context).size.width / 2.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
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
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (text != null)
                    Text(
                      text!,
                      style: textStyle,
                    ),
                  if (displayIcon)
                    Icon(
                      Icons.done,
                      color: iconColor,
                      size: 20,
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
