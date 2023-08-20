import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:new_life_care/bloc/bloc.dart';
import 'package:new_life_care/l10n/l10n.dart';
import 'package:new_life_care/repository/storage_repository.dart';
import 'package:new_life_care/screens/result_screen.dart';
import 'package:new_life_care/theme/app_color_scheme.dart';
import 'package:new_life_care/theme/app_text_style.dart';
import 'package:new_life_care/utils/resource.dart';
import 'package:new_life_care/widgets/gradient_button.dart';
import 'package:new_life_care/widgets/spinner/year_spinner.dart';

class SelectDateScreen extends StatefulWidget {
  const SelectDateScreen({super.key});
  static const route = '/select-date';

  @override
  State<SelectDateScreen> createState() => _SelectDateScreenState();
}

class _SelectDateScreenState extends State<SelectDateScreen> {
  late ThemeData theme = Theme.of(context);
  late AppTextStyle styles = theme.extension<AppTextStyle>()!;
  late AppColorScheme colors = theme.extension<AppColorScheme>()!;

  late AppLocalizations l10n = context.l10n;
  late ImageProvider bg;

  late int selectedYear;

  @override
  void didChangeDependencies() {
    bg = const AssetImage(Resource.bg2);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SelectDateBloc>(
      create: (_) => SelectDateBloc(
          InitialSelectDateState(), GetIt.I.get<IStorageRepository>()),
      child: BlocConsumer<SelectDateBloc, SelectDateState>(
        listener: (BuildContext context, state) {
          if (state is NavigateToResultState) {
            context.push(ResultScreen.route);
          }
        },
        builder: (BuildContext context, Object? state) {
          final size = MediaQuery.of(context).size;
          return Scaffold(
            body: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(image: bg, fit: BoxFit.cover),
                  ),
                  padding: EdgeInsets.fromLTRB(24, size.height / 6, 24, 56),
                  child: Column(
                    children: [
                      Text(l10n.logInDate, style: styles.headerTextStyle),
                      const SizedBox(height: 24),
                      YearSpinner(onValueChanged: (year) {
                        selectedYear = year;
                      }),
                      const Spacer(),
                      GradientButton(
                        gradientColors: [
                          colors.secondaryColor!,
                          colors.tertiaryColor!
                        ],
                        onPressed: () {
                          context
                              .read<SelectDateBloc>()
                              .add(NavigateToResultEvent(selectedYear));
                        },
                        child: Row(
                          children: [
                            const Expanded(child: SizedBox()),
                            Text(
                              l10n.next,
                              style: styles.buttonTextStyle,
                            ),
                            const SizedBox(width: 4),
                            Expanded(child: Image.asset(Resource.arrowLight)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
