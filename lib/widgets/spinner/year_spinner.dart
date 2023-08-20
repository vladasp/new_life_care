import 'package:flutter/material.dart';
import 'package:new_life_care/theme/app_color_scheme.dart';
import 'package:new_life_care/theme/app_text_style.dart';
import 'package:new_life_care/widgets/spinner/item_scroll_physics.dart';
import 'package:new_life_care/widgets/spinner/no_overscroll_behavior.dart';

typedef SelectedIndexCallback = void Function(int);
typedef YearChangedCallback = void Function(int);

class YearSpinner extends StatefulWidget {
  const YearSpinner({super.key, required this.onValueChanged});
  final YearChangedCallback onValueChanged;

  @override
  YearSpinnerState createState() => YearSpinnerState();
}

class YearSpinnerState extends State<YearSpinner> {
  ThemeData get theme => Theme.of(context);
  AppColorScheme get colors => theme.extension<AppColorScheme>()!;
  AppTextStyle get styles => theme.extension<AppTextStyle>()!;

  ScrollController yearController = ScrollController();
  int currentSelectedYearIndex = -1;
  bool isYearScrolling = false;

  double defaultItemHeight = 67;
  late double defaultItemWidth = MediaQuery.of(context).size.width - 48;
  int yearCount = 49;
  int defaultInitialIndex = 34;
  int visibleItemsCount = 5;

  List<int?> years =
      List<int?>.generate(50, (counter) => counter + DateTime.now().year - 66)
        ..insert(0, null)
        ..insert(0, null)
        ..insert(52, null)
        ..insert(53, null);

  @override
  void initState() {
    currentSelectedYearIndex = defaultInitialIndex + 2;
    final offset = defaultInitialIndex * defaultItemHeight;
    yearController = ScrollController(initialScrollOffset: offset);
    widget.onValueChanged(years[currentSelectedYearIndex] ?? 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: defaultItemWidth,
      height: defaultItemHeight * visibleItemsCount,
      child: spinner(
        yearController,
        yearCount,
        currentSelectedYearIndex,
        isYearScrolling,
        (index) {
          currentSelectedYearIndex = index;
          isYearScrolling = true;
          widget.onValueChanged(
            years[currentSelectedYearIndex] ?? 0,
          );
        },
        () => isYearScrolling = false,
      ),
    );
  }

  Widget spinner(
    ScrollController controller,
    int max,
    int selectedIndex,
    // ignore: avoid_positional_boolean_parameters
    bool isScrolling,
    SelectedIndexCallback onUpdateSelectedIndex,
    VoidCallback onScrollEnd,
  ) {
    final Widget spinner = NotificationListener<ScrollNotification>(
      onNotification: (scrollNotification) {
        if (scrollNotification is UserScrollNotification) {
          if (scrollNotification.direction.toString() ==
              'ScrollDirection.idle') {
            setState(() {
              onScrollEnd();
            });
          }
        } else if (scrollNotification is ScrollUpdateNotification) {
          setState(() {
            onUpdateSelectedIndex(
              (controller.offset / defaultItemHeight).round() + 2,
            );
          });
        }
        return true;
      },
      child: Stack(
        children: [
          Center(
            child: Row(
              children: [
                Container(
                  height: defaultItemHeight,
                  width: defaultItemWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: colors.boxBackground,
                  ),
                ),
              ],
            ),
          ),
          ScrollConfiguration(
            behavior: NoOverscrollBehavior(),
            child: ListView.builder(
              itemBuilder: (context, index) {
                var text = '';
                text = years[index] == null ? '' : years[index].toString();
                return Container(
                  height: defaultItemHeight,
                  alignment: Alignment.center,
                  child: Align(
                    child: Text(
                      text,
                      style: selectedIndex == index
                          ? styles.spinnerTextStyle
                          : (selectedIndex - index).abs() == 1
                              ? styles.spinnerSecondaryTextStyle
                              : styles.spinnerTertiaryTextStyle,
                    ),
                  ),
                );
              },
              controller: controller,
              itemCount: max + visibleItemsCount,
              physics: ItemScrollPhysics(itemHeight: defaultItemHeight),
              padding: EdgeInsets.zero,
            ),
          ),
        ],
      ),
    );

    return Stack(
      children: <Widget>[
        Positioned.fill(child: spinner),
        if (isScrolling)
          Positioned.fill(child: ColoredBox(color: Colors.black.withOpacity(0)))
        else
          Container()
      ],
    );
  }
}
