import 'package:first_project_hive/Views/pages/screencategories.dart';
import 'package:first_project_hive/Views/widgets/carousel.dart';
import 'package:first_project_hive/constant/textconstant.dart';
import 'package:first_project_hive/main.dart';
import 'package:first_project_hive/model/mymodel.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';

final mybox = Hive.box<StudentItem>(mykey);

class Screenhome extends StatefulWidget {
  const Screenhome({super.key});

  @override
  State<Screenhome> createState() => _ScreenhomeState();
}

class _ScreenhomeState extends State<Screenhome> {
  var data = mybox.values.toList();

  String username = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 4,
          shadowColor: Colors.indigo.shade200,
          title: Text(
            Textconstants.homeappBarName,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
              letterSpacing: 1,
              color: Colors.indigo,
            ),
          ),
          centerTitle: true,
        ),

        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff00b4d8), Color(0xff03045e)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(10),
                  Myslider(),
                  Gap(20),
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        final eachdata = data[index];
                        return Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFFe0f7fa), Color(0xFF80deea)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(14),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 6,
                                offset: Offset(0, 4),
                              ),
                            ],
                            border: Border.all(color: Colors.white70, width: 1),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      eachdata.subject,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.indigo,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      eachdata.topic,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        color: Colors.indigoAccent,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.timer,
                                          size: 16,
                                          color: Colors.indigo,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          '${eachdata.duration} minimum',
                                          style: const TextStyle(
                                            fontSize: 13,
                                            color: Colors.indigo,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              IconButton(
                                icon: const Icon(
                                  Icons.delete_outline,
                                  color: Colors.redAccent,
                                ),
                                onPressed: () {
                                  setState(() {
                                    mybox.deleteAt(index);
                                    data =
                                        mybox.values
                                            .cast<StudentItem>()
                                            .toList();
                                  });
                                },
                                tooltip: 'Delete',
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => Divider(),
                      itemCount: data.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        floatingActionButton: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Screencategories()),
            );
          },
          icon: const Icon(Icons.add, color: Colors.white, size: 50),
        ),
      ),
    );
  }
}
