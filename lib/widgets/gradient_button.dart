import 'package:flutter/material.dart';
import 'package:new_life_care/theme/app_color_scheme.dart';
import 'package:new_life_care/theme/app_text_style.dart';

class GradientButton extends StatefulWidget {
  const GradientButton({
    required this.gradientColors,
    required this.child,
    super.key,
    this.onPressed,
    this.height = 50,
    this.width = 140,
  });

  final Widget child;
  final List<Color> gradientColors;
  final void Function()? onPressed;
  final double height;
  final double width;

  @override
  State<GradientButton> createState() => _GradientButtonState();
}

class _GradientButtonState extends State<GradientButton> {
  ThemeData get theme => Theme.of(context);
  AppColorScheme get colors => theme.extension<AppColorScheme>()!;
  AppTextStyle get styles => theme.extension<AppTextStyle>()!;

  Widget get child => widget.child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: widget.gradientColors,
          ),
          borderRadius: BorderRadius.circular(48),
        ),
        child: ElevatedButton(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all<double>(0),
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
            overlayColor: MaterialStateProperty.resolveWith(
              (states) {
                return states.contains(MaterialState.pressed)
                    ? Colors.white12
                    : null;
              },
            ),
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.transparent),
            surfaceTintColor:
                MaterialStateProperty.all<Color>(Colors.transparent),
            shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(48),
              ),
            ),
          ),
          onPressed: widget.onPressed,
          child: child,
        ),
      ),
    );
  }
}
