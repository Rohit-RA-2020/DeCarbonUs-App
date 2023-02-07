import 'dart:ui';
import 'package:decarbonus/models/fade_animation.dart';
import 'package:decarbonus/screens/dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChartsPage extends ConsumerStatefulWidget {
  const ChartsPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChartsPageState();
}

class _ChartsPageState extends ConsumerState<ChartsPage> {
  @override
  Widget build(BuildContext context) {
    final footprint = ref.read(footprintResultProvider);
    final breakdown = Map.fromEntries(footprint.entries.toList()
      ..sort((e1, e2) => e2.value.compareTo(e1.value)));
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/bg_img.png', fit: BoxFit.cover),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
            blendMode: BlendMode.src,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FadeAnimation(
                  delay: 0.2,
                  fadeDirection: FadeDirection.right,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 50, bottom: 20, left: 10, right: 10),
                    child: Text(
                      "Your annual carbon emission is",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Andika',
                        fontSize: 20.sp,
                        color: const Color(0xFFFFB703),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                FadeAnimation(
                  delay: 0.7,
                  fadeDirection: FadeDirection.right,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${footprint['result']}",
                        style: TextStyle(
                          fontSize: 55.sp,
                          color: Colors.white,
                          fontFamily: 'Andika',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.info_outline),
                        onPressed: () {},
                        color: Colors.white,
                        iconSize: 25.sp,
                      ),
                    ],
                  ),
                ),
                const FadeAnimation(
                  delay: 0.7,
                  fadeDirection: FadeDirection.right,
                  child: Text(
                    "Tons CO2e",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontFamily: 'Andika',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ),
                FadeAnimation(
                  delay: 1.7,
                  fadeDirection: FadeDirection.right,
                  child: Container(
                    margin: const EdgeInsets.only(
                        left: 25, right: 50, top: 10, bottom: 10),
                    height: MediaQuery.of(context).size.height * 0.2,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                    ),
                    child: RotatedBox(
                      quarterTurns: 1,
                      child: BarChart(
                        BarChartData(
                          maxY: footprint['result'].round().toDouble(),
                          titlesData: FlTitlesData(
                            rightTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: false,
                              ),
                            ),
                            topTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: false,
                              ),
                            ),
                            leftTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: false,
                              ),
                            ),
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: false,
                              ),
                            ),
                          ),
                          gridData: FlGridData(
                            show: false,
                          ),
                          barTouchData: BarTouchData(
                            enabled: true,
                            touchTooltipData: BarTouchTooltipData(),
                          ),
                          borderData: FlBorderData(
                            border: const Border(
                              bottom: BorderSide.none,
                              left: BorderSide.none,
                              top: BorderSide.none,
                              right: BorderSide.none,
                            ),
                          ),
                          barGroups: [
                            BarChartGroupData(
                              showingTooltipIndicators: [0],
                              x: 1,
                              barRods: [
                                BarChartRodData(
                                  toY: footprint['result'].toDouble(),
                                  width: 15,
                                  color:
                                      const Color.fromARGB(255, 225, 139, 34),
                                ),
                              ],
                            ),
                            BarChartGroupData(
                              showingTooltipIndicators: [0],
                              x: 2,
                              barRods: [
                                BarChartRodData(
                                  toY: 3,
                                  width: 15,
                                  color: const Color.fromRGBO(76, 165, 93, 1),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                FadeAnimation(
                  delay: 1.5,
                  fadeDirection: FadeDirection.right,
                  child: Container(
                    margin: const EdgeInsets.all(25),
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 50.0),
                          child: Text(
                            "Your Main Sources of Carbon Emission are",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Andika',
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                              color: const Color(0xFFFFB703),
                            ),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.2,
                          padding: const EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 15,
                          ),
                          child: BarChart(
                            BarChartData(
                              titlesData: FlTitlesData(
                                rightTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: false,
                                  ),
                                ),
                                topTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: false,
                                  ),
                                ),
                                leftTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: false,
                                  ),
                                ),
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: false,
                                  ),
                                ),
                              ),
                              gridData: FlGridData(
                                show: false,
                              ),
                              borderData: FlBorderData(
                                show: false,
                              ),
                              barGroups: [
                                BarChartGroupData(
                                  showingTooltipIndicators: [0],
                                  x: 1,
                                  barRods: [
                                    BarChartRodData(
                                      toY: breakdown[breakdown.keys
                                              .elementAt(1)
                                              .toString()]
                                          .toDouble(),
                                      width: 15,
                                      color: Colors.green,
                                    ),
                                  ],
                                ),
                                BarChartGroupData(
                                  showingTooltipIndicators: [0],
                                  x: 2,
                                  barRods: [
                                    BarChartRodData(
                                      toY: breakdown[breakdown.keys
                                              .elementAt(2)
                                              .toString()]
                                          .toDouble(),
                                      width: 15,
                                      color: Colors.green,
                                    ),
                                  ],
                                ),
                                BarChartGroupData(
                                  showingTooltipIndicators: [0],
                                  x: 3,
                                  barRods: [
                                    BarChartRodData(
                                      toY: breakdown[breakdown.keys
                                              .elementAt(3)
                                              .toString()]
                                          .toDouble(),
                                      width: 15,
                                      color: Colors.green,
                                    ),
                                  ],
                                ),
                                BarChartGroupData(
                                  showingTooltipIndicators: [0],
                                  x: 4,
                                  barRods: [
                                    BarChartRodData(
                                      toY: breakdown[breakdown.keys
                                              .elementAt(4)
                                              .toString()]
                                          .toDouble(),
                                      width: 15,
                                      color: Colors.green,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                FadeAnimation(
                  delay: 2.0,
                  fadeDirection: FadeDirection.right,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const DashBoard(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 15,
                      ),
                      // add border color
                      side: const BorderSide(
                        color: Colors.green,
                        width: 2,
                      ),
                    ),
                    child: const Text(
                      "Start OffSetting",
                      style: TextStyle(
                        fontFamily: 'Andika',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Color(0xFFFFB703),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
