import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_house/app_config/app_config.dart';
import 'package:smart_house/app_config/style.dart';
import 'package:smart_house/components/custom_button.dart';
import 'package:smart_house/features/language/bloc/language_cubit.dart';
import 'package:smart_house/generated/l10n.dart';

class LanguagePageUI extends StatefulWidget {
  const LanguagePageUI({Key? key}) : super(key: key);

  @override
  LanguagePageUIState createState() => LanguagePageUIState();
}

class LanguagePageUIState extends State<LanguagePageUI> {
  late LanguageCubit _languageCubit;

  String? selectedLocale;

  @override
  void initState() {
    super.initState();
    _languageCubit = context.read<LanguageCubit>()..getCurrentLanguage();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var s = S.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          s.change_language,
          style: Theme.of(context).textTheme.bodyText1!,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16,
                top: 20,
                bottom: 16,
              ),
              child: Text(
                s.select_preferred_language,
                textAlign: TextAlign.center,
                style: theme.textTheme.caption!.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<LanguageCubit, Locale>(
                builder: (context, currentLocale) {
                  selectedLocale ??= currentLocale.languageCode;
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: AppConfig.languagesSupported.length,
                    itemBuilder: (context, index) {
                      var langCode =
                          AppConfig.languagesSupported.keys.elementAt(index);
                      return Theme(
                        data: ThemeData(
                          radioTheme: RadioThemeData(
                            fillColor: MaterialStateProperty.all(
                              AppTheme.lightGreyColor,
                            ),
                          ),
                        ),
                        child: RadioListTile(
                          title: Text(
                            AppConfig.languagesSupported[langCode]!,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(fontSize: 18),
                          ),
                          value: langCode,
                          groupValue: selectedLocale,
                          onChanged: (langCode) async {
                            setState(() {
                              selectedLocale = langCode as String;
                            });
                          },
                          activeColor: AppTheme.lightGreyColor,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            CustomButton(
              label: s.submit,
              onTap: () async {
                _languageCubit.setCurrentLanguage(selectedLocale!);
                Navigator.pop(context);
              },
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
