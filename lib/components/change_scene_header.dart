import 'package:flutter/material.dart';
import 'package:smart_house/app_config/style.dart';
import 'package:smart_house/components/custom_button.dart';
import 'package:smart_house/components/entry_field.dart';
import 'package:smart_house/generated/l10n.dart';

class ChangeSceneHeader extends StatelessWidget {
  const ChangeSceneHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              'assets/blur_header.png',
            ),
            fit: BoxFit.fitWidth),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 28),
      child: Row(
        children: [
          buildSceneOption(s.back_home, context),
          buildSceneOption(s.away, context, isSelected: true),
          buildSceneOption(s.guest_in, context),
          buildSceneOption(
            '',
            context,
            child: Icon(
              Icons.add,
              color: AppTheme.whiteTextColor,
              size: 20,
            ),
            onTap: () => showModalBottomSheet(
              isScrollControlled: true,
              clipBehavior: Clip.antiAlias,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              backgroundColor: Theme.of(context).primaryColor,
              context: context,
              builder: (context) => Padding(
                padding: EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  top: 30,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 30,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        s.add_a_scene,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 22),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Text(
                        s.save_home_setting_as_preset,
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                      const SizedBox(
                        height: 34,
                      ),
                      EntryField(
                        label: s.give_scene_title,
                        initialValue: s.child_mode,
                      ),
                      const SizedBox(
                        height: 34,
                      ),
                      const CustomButton(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSceneOption(String text, BuildContext context,
      {bool isSelected = false, Widget? child, Function()? onTap}) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: AppTheme.whiteTextColor.withOpacity(isSelected ? 1 : 0.3),
          ),
          margin: const EdgeInsets.symmetric(
            horizontal: 5,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 16,
          ),
          child: text == ''
              ? child
              : Text(
                  text,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color:
                            isSelected ? Theme.of(context).primaryColor : null,
                      ),
                  textAlign: TextAlign.center,
                ),
        ),
      ),
    );
  }
}
