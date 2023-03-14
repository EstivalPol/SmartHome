import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:smart_house/components/custom_button.dart';
import 'package:smart_house/components/entry_field.dart';
import 'package:smart_house/generated/l10n.dart';

import 'verification_interactor.dart';

class VerificationUI extends StatefulWidget {
  final VerificationInteractor verificationInteractor;

  const VerificationUI(this.verificationInteractor, {Key? key})
      : super(key: key);

  @override
  VerificationUIState createState() => VerificationUIState();
}

class VerificationUIState extends State<VerificationUI> {
  final TextEditingController _otpController = TextEditingController();

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: FadedSlideAnimation(
        fadeDuration: const Duration(milliseconds: 300),
        slideDuration: const Duration(milliseconds: 150),
        beginOffset: const Offset(0, 0.3),
        endOffset: const Offset(0, 0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  s.verification,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 22),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  s.add_verification_code_sent,
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(fontSize: 15),
                ),
                const SizedBox(
                  height: 56,
                ),
                EntryField(
                  label: s.enter_six_digit_code,
                  initialValue: '5 8 8 7 5 4',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 28,
                ),
                CustomButton(
                  onTap: () => widget.verificationInteractor.verify(),
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
