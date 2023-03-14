import 'package:flutter/material.dart';
import 'package:smart_house/app_config/style.dart';
import 'package:smart_house/components/custom_button.dart';
import 'package:smart_house/components/entry_field.dart';
import 'package:smart_house/generated/l10n.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            children: [
              Row(
                children: [
                  Text(
                    'Profile',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 22),
                  ),
                  const Spacer(),
                  Stack(
                    children: [
                      const SizedBox(
                        height: 80,
                        width: 80,
                      ),
                      ClipOval(
                        child: Image.asset(
                          'assets/account/profile.png',
                          height: 74,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          radius: 16,
                          backgroundColor: const Color(0xff1cad6e),
                          child: Icon(
                            Icons.camera_alt,
                            size: 20,
                            color: AppTheme.whiteTextColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              EntryField(
                label: s.full_name,
                initialValue: 'Samantha Smith',
              ),
              const SizedBox(
                height: 30,
              ),
              EntryField(
                label: s.phone_number,
                initialValue: '987 654 3210',
              ),
              const SizedBox(
                height: 30,
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
          Positioned(
            bottom: 40,
            left: 24,
            right: 24,
            child: CustomButton(
              label: s.update,
              onTap: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }
}
