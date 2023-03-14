import 'package:flutter/material.dart';
import 'package:smart_house/app_config/style.dart';
import 'package:smart_house/components/menu_popup.dart';
import 'package:smart_house/generated/l10n.dart';

class StatsItem {
  String name;
  String location;
  String power;
  String percentage;
  bool isIncreased;

  StatsItem(
      this.name, this.location, this.power, this.percentage, this.isIncreased);
}

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  bool isPopupOpen = false;

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final List<StatsItem> deviceStatistics = [
      StatsItem(s.air_condition, s.living_room, '22', '22', true),
      StatsItem(s.ceiling_lights, s.living_room, '13', '22', false),
      StatsItem(s.air_condition, s.living_room, '20', '22', true),
    ];
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 26,
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      'assets/account/profile.png',
                      height: 55,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Samantha Smith',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontSize: 17),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        s.view_profile,
                        style: Theme.of(context).textTheme.caption,
                      )
                    ],
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isPopupOpen = true;
                      });
                      showDialog(
                        context: context,
                        builder: (context) => const SettingsMenuPopup(),
                      ).then((value) {
                        setState(() {
                          isPopupOpen = false;
                        });
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      height: 40,
                      width: 40,
                      decoration: AppTheme.insetDecoration(),
                      child: isPopupOpen
                          ? Icon(
                              Icons.close,
                              color: AppTheme.whiteTextColor,
                            )
                          : Image.asset('assets/icons/ic_setting.png'),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 7),
              decoration: AppTheme.poppedDecoration(),
              child: TabBar(
                indicator: AppTheme.insetDecoration(),
                tabs: [
                  Tab(
                    text: s.day,
                  ),
                  Tab(
                    text: s.week,
                  ),
                  Tab(
                    text: s.month,
                  ),
                  Tab(
                    text: s.year,
                  ),
                ],
              ),
            ),
            Container(
              height: 250,
              padding: const EdgeInsets.only(
                top: 28,
                bottom: 28,
                left: 16,
              ),
              child: TabBarView(children: [
                Image.asset(
                  'assets/account/chart.png',
                  fit: BoxFit.fill,
                  width: double.infinity,
                  height: double.infinity,
                ),
                Image.asset(
                  'assets/account/chart.png',
                  fit: BoxFit.fill,
                  width: double.infinity,
                  height: double.infinity,
                ),
                Image.asset(
                  'assets/account/chart.png',
                  fit: BoxFit.fill,
                  width: double.infinity,
                  height: double.infinity,
                ),
                Image.asset(
                  'assets/account/chart.png',
                  fit: BoxFit.fill,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildStatsItem(context, 'assets/account/ic_power.png', '987',
                    'kW ${s.used}'),
                buildStatsItem(context, 'assets/account/ic_power.png', '\$109',
                    'kW ${s.used}'),
                buildStatsItem(
                    context, 'assets/account/ic_power.png', '16', s.devices),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                s.device_statistics,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontSize: 17),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              margin: const EdgeInsets.symmetric(horizontal: 6),
              color: const Color(0xff2a2e3a),
              child: ListView.separated(
                itemCount: deviceStatistics.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            deviceStatistics[index].name,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          const Spacer(),
                          Icon(
                            Icons.bolt,
                            color: AppTheme.primaryColorLight,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            '${deviceStatistics[index].power} kWh',
                            style: Theme.of(context).textTheme.bodyText2,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Text(
                            deviceStatistics[index].location,
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(fontSize: 10),
                          ),
                          const Spacer(),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text:
                                      '${deviceStatistics[index].percentage}% ${s.increased} ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(
                                        color:
                                            deviceStatistics[index].isIncreased
                                                ? const Color(0xffde2454)
                                                : const Color(0xff4ca517),
                                        fontSize: 10,
                                      ),
                                ),
                                TextSpan(
                                  text: 'from last month',
                                  style: Theme.of(context)
                                      .textTheme
                                      .caption!
                                      .copyWith(fontSize: 10),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(
                  color: Color(0xff616874),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row buildStatsItem(
      BuildContext context, String icon, String title, String subtitle) {
    return Row(
      children: [
        Image.asset(
          icon,
          height: 18,
        ),
        const SizedBox(
          width: 12,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style:
                  Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 17),
            ),
            Text(
              subtitle,
              style:
                  Theme.of(context).textTheme.caption!.copyWith(fontSize: 10),
            ),
          ],
        ),
      ],
    );
  }
}
