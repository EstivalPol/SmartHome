import 'package:flutter/material.dart';
import 'package:smart_house/generated/l10n.dart';

class TncScreen extends StatelessWidget {
  const TncScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          Text(
            s.terms_conditions,
            style:
                Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 22),
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            s.company_terms,
            style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 14),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(fontSize: 15, height: 2.5),
          ),
          const SizedBox(
            height: 32,
          ),
          Text(
            s.terms_conditions,
            style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 14),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(fontSize: 15, height: 2.5),
          ),
        ],
      ),
    );
  }
}
