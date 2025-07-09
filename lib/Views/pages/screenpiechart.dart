import 'package:first_project_hive/constant/textconstant.dart';
import 'package:first_project_hive/main.dart';
import 'package:first_project_hive/model/mymodel.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:pie_chart/pie_chart.dart';

class Screenpiechart extends StatefulWidget {
  const Screenpiechart({super.key});

  @override
  State<Screenpiechart> createState() => _ScreenpiechartState();
}

class _ScreenpiechartState extends State<Screenpiechart> {
 
 
 

Map<String, double> makePieData() {
  final box = Hive.box<StudentItem>(mykey);
  final items = box.values.cast<StudentItem>();
  Map<String, double> map = {};
  for (var item in items) {
    map[item.subject] = (map[item.subject] ?? 0) + item.duration.toDouble();
  }
  return map;
}
  final List<Color> pieColors = [
    Color(0xff00b4d8), // turquoise
    Color(0xff0077b6), // deep blue
    Color(0xff03045e), // navy
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Textconstants.piecharttext1,style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: const Color(0xff03045e),
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff00b4d8),
              Color(0xff03045e),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: ValueListenableBuilder(
  valueListenable: Hive.box<StudentItem>(mykey).listenable(),
  builder: (context, Box<StudentItem> box, _) {
    final dataMap = makePieData();
    if (dataMap.isEmpty) {
      return const Center(child: Text(Textconstants.piecharttext2));
    }
    return PieChart(
      dataMap: dataMap,
      animationDuration: const Duration(milliseconds: 800),
      chartRadius: MediaQuery.of(context).size.width / 2,
      legendOptions: const LegendOptions(showLegends: true),
      chartValuesOptions: const ChartValuesOptions(
        showChartValuesInPercentage: true,
      ),
    );
  },
),

        ),
      ),
    );
  }
}
