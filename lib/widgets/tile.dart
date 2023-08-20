import 'package:flutter/material.dart';
import 'package:new_life_care/theme/app_color_scheme.dart';
import 'package:new_life_care/theme/app_text_style.dart';
import 'package:new_life_care/utils/resource.dart';

class Tile extends StatelessWidget {
  const Tile({
    required this.title,
    required this.subTitle,
    required this.onTap,
    super.key,
  });
  final String title;
  final String subTitle;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<AppColorScheme>()!;
    final styles = theme.extension<AppTextStyle>()!;

    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      color: colors.primaryColor,
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        overlayColor:
            MaterialStatePropertyAll(colors.secondaryColor!.withOpacity(0.05)),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
          height: 130,
          child: Row(children: [
            Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: styles.tileTitleStyle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      subTitle,
                      style: styles.tileSubtitleStyle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ]),
            ),
            Image.asset(Resource.arrowDark),
          ]),
        ),
      ),
    );
  }
}
