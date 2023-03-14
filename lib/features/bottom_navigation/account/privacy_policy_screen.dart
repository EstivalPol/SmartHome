import 'package:flutter/material.dart';
import 'package:smart_house/app_config/style.dart';
import 'package:smart_house/generated/l10n.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        children: [
          Text(
            s.privacy_policy,
            style:
                Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 22),
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(fontSize: 15, height: 2.5),
          ),
          const SizedBox(
            height: 44,
          ),
          Text(
            s.privacy_policies,
            style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 14),
          ),
          const SizedBox(
            height: 6,
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            shrinkWrap: true,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Icon(
                      Icons.circle,
                      color: AppTheme.whiteTextColor,
                      size: 10,
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Text(
                      'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est.',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 15, height: 2.5),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
