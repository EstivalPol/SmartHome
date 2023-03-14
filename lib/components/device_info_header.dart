import 'package:flutter/material.dart';

class DeviceInfoHeader extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;
  const DeviceInfoHeader(
      {Key? key,
      required this.image,
      required this.title,
      required this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColorDark,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Image.asset(
                  image,
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 17),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Text(
                      subTitle,
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            fontSize: 14,
                          ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
