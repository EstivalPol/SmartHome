import 'package:flutter/material.dart';
import 'package:smart_house/components/ripple_animation.dart';
import 'package:smart_house/generated/l10n.dart';
import 'package:smart_house/routes/routes.dart';

class SearchDeviceScreen extends StatelessWidget {
  const SearchDeviceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
              ),
              child: Text(
                s.searching_nearby,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontSize: 17),
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
              ),
              child: Text(
                s.make_sure_connection,
                style:
                    Theme.of(context).textTheme.caption!.copyWith(fontSize: 13),
              ),
            ),
            Expanded(
              child: Stack(
                alignment: Alignment.centerRight,
                children: [
                  Positioned(
                    right: -50,
                    left: -50,
                    child: RipplesAnimation(
                      size: 250,
                      color: Theme.of(context).primaryColorLight,
                    ),
                  ),
                  Positioned(
                    right: 20,
                    child: GestureDetector(
                      onTap: () => Navigator.pushNamed(
                          context, PageRoutes.addDeviceInfo),
                      child: Container(
                        padding:
                            const EdgeInsets.only(top: 16, right: 16, left: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xff565c6a).withOpacity(0.6),
                        ),
                        child: Image.asset(
                          'assets/devices/ic_camera.png',
                          width: 40,
                        ),
                      ),
                    ),
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
