import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:smart_house/app_config/app_config.dart';
import 'package:smart_house/app_config/style.dart';
import 'package:smart_house/features/language/bloc/language_cubit.dart';
import 'package:smart_house/generated/l10n.dart';
import 'package:smart_house/routes/routes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          Text(
            s.settings,
            style:
                Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 22),
          ),
          const SizedBox(
            height: 14,
          ),
          Text(
            s.your_question_got_answered,
            style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 14),
          ),
          const SizedBox(
            height: 40,
          ),
          BlocBuilder<LanguageCubit, Locale>(builder: (context, currentLocale) {
            return buildListTile(
              context,
              s.select_language,
              AppConfig.languagesSupported[currentLocale.languageCode] ?? '',
              onTap: () =>
                  Navigator.pushNamed(context, PageRoutes.languageChangeScreen),
            );
          }),
          buildListTile(context, s.app_mode, s.dark_mode),
          buildListTile(context, s.distance_unit, s.km_kilometer),
          const SizedBox(
            height: 60,
          ),
          Text(
            s.terms_conditions,
            style:
                Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 17),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            s.privacy_policy,
            style:
                Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 17),
          ),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () => Phoenix.rebirth(context),
            child: Text(
              s.logout,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(fontSize: 17, color: const Color(0xffd41d1d)),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildListTile(BuildContext context, String title, String subtitle,
      {Function()? onTap}) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 17),
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 14),
      ),
      trailing: Icon(
        Icons.keyboard_arrow_down,
        color: AppTheme.whiteTextColor,
      ),
    );
  }
}
