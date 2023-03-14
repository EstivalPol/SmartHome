import 'package:flutter/material.dart';
import 'package:smart_house/app_config/style.dart';

class EntryField extends StatelessWidget {
  final String? hintText;
  final String? initialValue;
  final String? label;
  final TextAlign? textAlign;

  const EntryField(
      {Key? key, this.hintText, this.initialValue, this.label, this.textAlign})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Text(
            label ?? '',
            style: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(fontWeight: FontWeight.w500, fontSize: 15),
            textAlign: TextAlign.center,
          ),
        if (label != null) const SizedBox(height: 20),
        Container(
          decoration: AppTheme.insetDecoration(),
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: TextFormField(
              textAlign: textAlign ?? TextAlign.start,
              style: Theme.of(context).textTheme.bodyText2,
              initialValue: initialValue,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide.none,
                ),
                hintText: hintText ?? '',
                hintStyle: Theme.of(context).textTheme.caption!.copyWith(
                      fontSize: 15,
                      color: AppTheme.lightGreyColor.withOpacity(0.9),
                    ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 20,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
