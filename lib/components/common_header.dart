import 'package:flutter/material.dart';
import 'package:smart_house/app_config/style.dart';
import 'package:smart_house/generated/l10n.dart';

///builds header/appbar showing temperature
///made as a widget because method gets called even before drawing a widget
class CommonHeader extends StatefulWidget {
  final ScrollController controller;

  const CommonHeader({Key? key, required this.controller}) : super(key: key);

  @override
  State<CommonHeader> createState() => _CommonHeaderState();
}

class _CommonHeaderState extends State<CommonHeader> {
  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 20,
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              if (widget.controller.position.pixels != 0) {
                widget.controller.animateTo(
                    widget.controller.position.minScrollExtent,
                    duration: const Duration(milliseconds: 350),
                    curve: Curves.easeOut);
              } else {
                widget.controller.animateTo(
                    widget.controller.position.maxScrollExtent,
                    duration: const Duration(milliseconds: 350),
                    curve: Curves.easeOut);
              }
              setState(() {});
            },
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: AppTheme.poppedDecoration(borderRadius: 10),
              child: Icon(
                (widget.controller.position.pixels != 0)
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
                color: AppTheme.whiteTextColor,
                size: 24,
              ),
            ),
          ),
          const SizedBox(
            width: 14,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                s.back_home,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 17,
                    ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                s.change_scene,
                style:
                    Theme.of(context).textTheme.caption!.copyWith(fontSize: 10),
              ),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '29° C',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 17),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                s.mostly_clear,
                style:
                    Theme.of(context).textTheme.caption!.copyWith(fontSize: 10),
              ),
            ],
          ),
          const SizedBox(
            width: 14,
          ),
          Image.asset(
            'assets/icons/ic_weather.png',
            width: 30,
            fit: BoxFit.fitWidth,
          ),
        ],
      ),
    );
  }
}
