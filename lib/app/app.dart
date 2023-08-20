import 'package:flutter/material.dart';
import 'package:new_life_care/l10n/l10n.dart';
import 'package:new_life_care/router/router.dart';
import 'package:new_life_care/theme/theme_service.dart';
import 'package:new_life_care/utils/resource.dart';

class App extends StatelessWidget {
  App({super.key, required this.initialRoute});
  final String initialRoute;
  late final _router = RouteHelper.routes(initialRoute: initialRoute);

  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage(Resource.bg1), context);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeService.light().theme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: _router,
    );
  }
}
