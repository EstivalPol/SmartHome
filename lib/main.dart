import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:smart_house/app_config/style.dart';
import 'package:smart_house/features/auth/login_navigator.dart';
import 'package:smart_house/features/language/bloc/language_cubit.dart';
import 'package:smart_house/generated/l10n.dart';
import 'package:smart_house/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    Phoenix(
      child: BlocProvider(
        create: (context) => LanguageCubit()..getCurrentLanguage(),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, Locale>(
      builder: (_, locale) {
        return MaterialApp(
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          locale: locale,
          theme: AppTheme.appTheme,
          home: const LoginNavigator(),
          routes: PageRoutes().routes(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
