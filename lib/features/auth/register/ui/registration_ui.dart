import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:smart_house/components/custom_button.dart';
import 'package:smart_house/components/entry_field.dart';
import 'package:smart_house/generated/l10n.dart';

import '../../../../routes/routes.dart';
import 'registration_interactor.dart';

class RegistrationUI extends StatefulWidget {
  final RegistrationInteractor registrationInteractor;
  final String? phoneNumber;

  const RegistrationUI(this.registrationInteractor, this.phoneNumber,
      {Key? key})
      : super(key: key);

  @override
  RegistrationUIState createState() => RegistrationUIState();
}

class RegistrationUIState extends State<RegistrationUI> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var s = S.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: FadedSlideAnimation(
        fadeDuration: const Duration(milliseconds: 300),
        slideDuration: const Duration(milliseconds: 150),
        beginOffset: const Offset(0, 0.3),
        endOffset: const Offset(0, 0),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height + 100,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      s.sign_up_now,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 22),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      s.looks_like_not_registered,
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(fontSize: 15),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    EntryField(
                      label: s.phone_number,
                      initialValue: '987 654 3210',
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                    EntryField(
                      label: s.full_name,
                      initialValue: 'Samantha Smith',
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                    EntryField(
                      label: s.email_address,
                      initialValue: 'samanthasmith@mail.com',
                    ),
                    const SizedBox(
                      height: 120,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomButton(
                    onTap: () =>
                        widget.registrationInteractor.register('name', 'email'),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: s.by_continue_you_agree,
                            style:
                                theme.textTheme.caption!.copyWith(fontSize: 15),
                          ),
                          TextSpan(
                            text: '\n${s.terms_conditions}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(height: 1.8),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
