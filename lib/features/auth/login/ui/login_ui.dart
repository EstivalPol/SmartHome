import 'package:animation_wrappers/animations/faded_slide_animation.dart';
import 'package:flutter/material.dart';
import 'package:smart_house/components/custom_button.dart';
import 'package:smart_house/components/entry_field.dart';
import 'package:smart_house/generated/l10n.dart';

import 'login_interactor.dart';

class LoginUI extends StatefulWidget {
  final LoginInteractor loginInteractor;

  const LoginUI(this.loginInteractor, {Key? key}) : super(key: key);

  @override
  LoginUIState createState() => LoginUIState();
}

class LoginUIState extends State<LoginUI> {
  final TextEditingController _numberController = TextEditingController();

  String isoCode = '';

  @override
  void initState() {
    super.initState();
    // Future.delayed(
    //     Duration(seconds: 4), () => BuyThisApp.showSubscribeDialog(context));
  }

  @override
  void dispose() {
    _numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var s = S.of(context);
    return Scaffold(
      body: FadedSlideAnimation(
        fadeDuration: const Duration(milliseconds: 300),
        slideDuration: const Duration(milliseconds: 150),
        beginOffset: const Offset(0, 0.3),
        endOffset: const Offset(0, 0),
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Image.asset(
                      'assets/logo.png',
                      scale: 2.5,
                      alignment: Alignment.centerLeft,
                    ),
                  ),
                  Text(
                    '${s.hi_mate},',
                    style: theme.textTheme.caption!.copyWith(fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    s.sign_in_now,
                    style: theme.textTheme.bodyText1!
                        .copyWith(fontWeight: FontWeight.w600, fontSize: 22),
                    textAlign: TextAlign.center,
                  ),
                  // const SizedBox(height: 86),
                  const Spacer(),
                  EntryField(
                    label: s.enter_phone_number,
                    hintText: s.enter_phone_number,
                  ),
                  const SizedBox(height: 30),
                  CustomButton(
                    onTap: () => widget.loginInteractor
                        .loginWithMobile('isoCode', 'mobileNumber'),
                  ),
                  const Spacer(),
                  Center(
                    child: Text(
                      s.or_continue_with,
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            fontSize: 15,
                          ),
                    ),
                  ),
                  const Spacer(),
                  CustomButton(
                    onTap: () => widget.loginInteractor
                        .loginWithMobile('isoCode', 'mobileNumber'),
                    icon: 'assets/icons/ic_fb.png',
                    label: s.continue_with_facebook,
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  CustomButton(
                    onTap: () => widget.loginInteractor
                        .loginWithMobile('isoCode', 'mobileNumber'),
                    icon: 'assets/icons/ic_ggl.png',
                    label: s.continue_with_google,
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  CustomButton(
                    onTap: () => widget.loginInteractor
                        .loginWithMobile('isoCode', 'mobileNumber'),
                    icon: 'assets/icons/ic_apl.png',
                    label: s.continue_with_apple,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
