import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:new_life_care/bloc/bloc.dart';
import 'package:new_life_care/data/enums.dart';
import 'package:new_life_care/l10n/l10n.dart';
import 'package:new_life_care/repository/storage_repository.dart';
import 'package:new_life_care/screens/select_date_screen.dart';
import 'package:new_life_care/utils/resource.dart';
import 'package:new_life_care/widgets/tile.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});
  static const route = '/';

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  late AppLocalizations l10n = context.l10n;
  late ImageProvider bg;

  @override
  void didChangeDependencies() {
    bg = const AssetImage(Resource.bg1);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<InitialBloc>(
      create: (_) =>
          InitialBloc(FirstLaunchState(), GetIt.I.get<IStorageRepository>()),
      child: BlocConsumer<InitialBloc, InitialState>(
        listener: (BuildContext context, state) {
          if (state is NavigateToSelectDateState) {
            context.push(SelectDateScreen.route);
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
                  padding: EdgeInsets.fromLTRB(24, size.height / 4, 24, 0),
                  child: Column(
                    children: [
                      Tile(
                        title: l10n.trackPeriod,
                        subTitle: l10n.trackPeriodSubtitle,
                        onTap: () {
                          context.read<InitialBloc>().add(
                              NavigateToSelectDateEvent(CareType.trackPeriod));
                        },
                      ),
                      const SizedBox(height: 48),
                      Tile(
                        title: l10n.getPregnant,
                        subTitle: l10n.getPregnantSubtitle,
                        onTap: () {
                          context.read<InitialBloc>().add(
                              NavigateToSelectDateEvent(CareType.getPregnant));
                        },
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
