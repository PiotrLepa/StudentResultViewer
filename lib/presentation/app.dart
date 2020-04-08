import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:student_result_viewer/core/common/locale_provider.dart';
import 'package:student_result_viewer/core/common/router/router.gr.dart';
import 'package:student_result_viewer/core/injection/injection.dart';
import 'package:student_result_viewer/core/presentation/localization/app_localizations.dart';
import 'package:student_result_viewer/core/presentation/theme/theme_provider.dart';

class App extends StatelessWidget {
  final LocaleProvider _localeProvider = getIt.get<LocaleProvider>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [],
      child: MaterialApp(
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: _localeProvider.getSupportedLocales().asList(),
        theme: ThemeProvider(isDark: false).getThemeData(),
        darkTheme: ThemeProvider(isDark: true).getThemeData(),
        builder: ExtendedNavigator<Router>(router: Router()),
      ),
    );
  }
}
