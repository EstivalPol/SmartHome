import 'package:auto_size_text/auto_size_text.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

import 'package:flutter/material.dart';
import 'package:smart_house/utils/basic_overlay_widget.dart';
import 'package:video_player/video_player.dart';

import 'constants.dart';

class PrimaryTextButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String? text;
  final EdgeInsetsGeometry? margin;
  const PrimaryTextButton({Key? key, this.text, this.margin, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: margin,
        padding: const EdgeInsets.symmetric(vertical: 14.5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                blurRadius: 8,
                color: const Color(0xffAE835B).withOpacity(.25),
              ),
            ]),
        child: Text(
          text ?? '',
          style: whiteBold20,
        ),
      ),
    );
  }
}

class MyContainerWithChild extends StatelessWidget {
  final VoidCallback? onTap;
  final Alignment? alignment;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Widget? child;
  final double? blurRadius;
  final double? height;
  final double? width;
  final double? borderRadius;
  const MyContainerWithChild(
      {Key? key,
      this.child,
      this.blurRadius,
      this.borderRadius,
      this.padding,
      this.margin,
      this.alignment = Alignment.center,
      this.height,
      this.width,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: height,
          width: width,
          alignment: alignment,
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 15.5),
          margin: margin ?? const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(borderRadius ?? 10),
              boxShadow: [
                BoxShadow(
                  color: colorForShadow,
                  blurRadius: blurRadius ?? 6,
                  offset: const Offset(0, 0),
                ),
              ]),
          child: child),
    );
  }
}

class MyAppBar extends StatelessWidget {
  final TextStyle? titleStyle;
  final bool? centerTitle;
  final String? title;
  final List<Widget>? action;
  const MyAppBar(
      {Key? key,
      this.title = '',
      this.centerTitle = false,
      this.titleStyle,
      this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        actions: action,
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
          statusBarColor: transparent,
        ),
        elevation: 0,
        centerTitle: centerTitle,
        title: centerTitle == false
            ? Align(
                alignment: Localizations.localeOf(context) == const Locale('ar')
                    ? const Alignment(1.2, 0)
                    : const Alignment(-1.2, 0),
                child: AutoSizeText(
                  title.toString(),
                  style: titleStyle ?? blackBold18,
                  maxLines: 1,
                ))
            : Text(
                title.toString(),
                style: titleStyle ?? blackBold18,
                maxLines: 1,
              ));
  }
}

class MyFlLineChart extends StatelessWidget {
  const MyFlLineChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 25),
        height: 20.h,
        child: LineChart(
          LineChartData(
              lineTouchData: LineTouchData(
                  touchTooltipData: LineTouchTooltipData(
                tooltipBgColor: transparent,
              )),
              gridData: FlGridData(
                show: false,
              ),
              titlesData: FlTitlesData(
                show: true,
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 30,
                    interval: 1,
                    getTitlesWidget: bottomTitleWidgets,
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
              borderData: FlBorderData(
                  show: true,
                  border: Border(
                      bottom: BorderSide(color: color94.withOpacity(.25)))),
              minX: 0,
              maxX: 14,
              minY: 8,
              maxY: 25,
              lineBarsData: [
                LineChartBarData(
                  spots: const [
                    FlSpot(0, 17),
                    FlSpot(1, 14),
                    FlSpot(3, 20),
                    FlSpot(5, 12),
                    // FlSpot(7, 16),
                    FlSpot(9, 23),
                    FlSpot(11, 18),
                    FlSpot(13, 24),
                    FlSpot(14, 23),
                  ],
                  isCurved: true,
                  gradient: const LinearGradient(
                    colors: [primaryColor, primaryColor],
                  ),
                  barWidth: 5,
                  isStrokeCapRound: true,
                  dotData: FlDotData(
                    show: false,
                  ),
                  belowBarData: BarAreaData(
                    show: true,
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(255, 153, 0, 0.5),
                        Color.fromRGBO(255, 153, 0, .4),
                        Color.fromRGBO(255, 153, 0, .4),
                        Color.fromRGBO(255, 153, 0, .2),
                        Color.fromRGBO(255, 153, 0, 0),
                        Color.fromRGBO(255, 153, 0, 0),
                      ],
                    ),
                  ),
                ),
              ]),
        ));
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: color94,
      fontWeight: FontWeight.w600,
      fontSize: 12,
      fontFamily: 'R',
    );
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = const Text('Jan', style: style);
        break;
      case 3:
        text = const Text('Feb', style: style);
        break;
      case 5:
        text = const Text('Mar', style: style);
        break;
      case 7:
        text = const Text('Apr', style: style);
        break;
      case 9:
        text = const Text('May', style: style);
        break;
      case 11:
        text = const Text('Jun', style: style);
        break;
      case 13:
        text = const Text('Jul', style: style);
        break;

      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Padding(
        padding: const EdgeInsets.only(top: 7),
        child: text,
      ),
    );
  }
}
