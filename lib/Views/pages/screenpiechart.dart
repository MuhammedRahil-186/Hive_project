import 'package:first_project_hive/constant/textconstant.dart';
import 'package:first_project_hive/main.dart';
import 'package:first_project_hive/model/mymodel.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pie_chart/pie_chart.dart';

class Screenpiechart extends StatelessWidget {
  const Screenpiechart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff00b4d8), Color(0xff03045e)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ValueListenableBuilder(
          valueListenable: Hive.box<StudentItem>(mykey).listenable(),
          builder: (context, Box<StudentItem> box, _) {
            final items = box.values.cast<StudentItem>();
            final Map<String, double> dataMap = {};

            for (var item in items) {
              dataMap[item.subject] =
                  (dataMap[item.subject] ?? 0) + item.duration.toDouble();
            }

            if (dataMap.isEmpty) {
              return const Center(
                child: Text(
                  Textconstants.piecharttext2,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontFamily: 'Anton',
                  ),
                ),
              );
            }

            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'Study Duration Breakdown',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Anton',
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  PieChart(
                    dataMap: dataMap,
                    animationDuration: const Duration(milliseconds: 800),
                    chartRadius: MediaQuery.of(context).size.width / 2.2,
                    colorList: const [
                      Color(0xff00b4d8),
                      Color(0xff0077b6),
                      Color(0xff03045e),
                      Color(0xff90e0ef),
                      Color(0xffcaf0f8),
                    ],
                    chartType: ChartType.ring,
                    ringStrokeWidth: 30,
                    chartValuesOptions: const ChartValuesOptions(
                      showChartValuesInPercentage: true,
                      showChartValueBackground: false,
                      decimalPlaces: 0,
                      chartValueStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    legendOptions: const LegendOptions(
                      showLegends: true,
                      legendTextStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      centerTitle: true,
      title: const Text(
        Textconstants.piecharttext1,
        style: TextStyle(color: Colors.white, fontFamily: 'Anton'),
      ),
      elevation: 6,
      shadowColor: Colors.black38,
      backgroundColor: const Color(0xff03045e),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
    );
  }
}
