import 'package:boilerplate/config/themes/app_theme.dart';
import 'package:boilerplate/core/injector.dart';
import 'package:boilerplate/l10n/l10n.dart';
import 'package:boilerplate/presentation/blocs/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'flavors.dart';
import 'presentation/pages/homepage/homepage.dart';

class App extends StatelessWidget {
  const App({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(
          create: (context) => injector.get<CounterBloc>(),
        ),
      ],
      child: MaterialApp(
        title: F.title,
        debugShowCheckedModeBanner: false,
        supportedLocales: L10n.all,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        theme: AppTheme.light,
        home: _flavorBanner(
          child: MyHomePage(
            title: F.title,
          ),
        ),
      ),
    );
  }

  Widget _flavorBanner({
    required Widget child,
    bool show = true,
  }) =>
      show
          ? Banner(
              location: BannerLocation.bottomEnd,
              message: F.name,
              color: Colors.green.withOpacity(0.6),
              textStyle: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 12,
                letterSpacing: 1,
              ),
              textDirection: TextDirection.ltr,
              child: child,
            )
          : Container(
              child: child,
            );
}
