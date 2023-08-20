import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:new_life_care/bloc/bloc.dart';
import 'package:new_life_care/data/profile_model.dart';
import 'package:new_life_care/l10n/l10n.dart';
import 'package:new_life_care/repository/storage_repository.dart';
import 'package:new_life_care/theme/app_color_scheme.dart';
import 'package:new_life_care/theme/app_text_style.dart';
import 'package:new_life_care/utils/extensions.dart';
import 'package:new_life_care/utils/resource.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});
  static const route = '/result';

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
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
    return BlocProvider<ResultBloc>(
      create: (_) => ResultBloc(
          InitState(ProfileModel.empty()), GetIt.I.get<IStorageRepository>())
        ..add(GetResultEvent()),
      child: BlocConsumer<ResultBloc, ResultState>(
        listener: (BuildContext context, state) {
          if (state is NavigateBackState) {
            context.pop();
          }
        },
        builder: (BuildContext context, ResultState state) {
          final size = MediaQuery.of(context).size;
          return Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: bg, fit: BoxFit.cover),
                ),
                child: Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    leading: IconButton(
                        onPressed: () {
                          context.read<ResultBloc>().add(NavigateBackEvent());
                        },
                        icon: Icon(Icons.arrow_back_ios,
                            color: colors.secondaryColor)),
                  ),
                  body: Container(
                    width: double.infinity,
                    padding: EdgeInsets.fromLTRB(24, size.height / 6, 24, 56),
                    child: Column(
                      children: [
                        Text(l10n.summary, style: styles.headerTextStyle),
                        const SizedBox(height: 24),
                        Text(l10n.birthYear(state.model.birthdayYear ?? 0),
                            style: styles.tileSubtitleStyle),
                        const SizedBox(height: 12),
                        Text(l10n.careType(state.model.careTypeString(l10n)),
                            style: styles.tileSubtitleStyle),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
