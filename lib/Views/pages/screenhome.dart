import 'package:first_project_hive/Views/pages/screencategories.dart';
import 'package:first_project_hive/Views/widgets/carousel.dart';
import 'package:first_project_hive/constant/textconstant.dart';
import 'package:first_project_hive/main.dart';
import 'package:first_project_hive/model/mymodel.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';

final mybox = Hive.box<StudentItem>(mykey);

class Screenhome extends StatelessWidget {
  const Screenhome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff00b4d8), Color(0xff03045e)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            children: [
              const Gap(10),
              const Myslider(),
              const Gap(20),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async => await Future.delayed(Duration(milliseconds: 300)),
                  child: ValueListenableBuilder(
                    valueListenable: mybox.listenable(),
                    builder: (context, Box<StudentItem> box, _) {
                      final data = box.values.toList();

                      if (data.isEmpty) {
                        return const Center(
                          child: Text(
                            'No Study Sessions Found',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontFamily: 'Anton',
                            ),
                          ),
                        );
                      }

                      return ListView.separated(
                        itemCount: data.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 8),
                        padding: const EdgeInsets.only(bottom: 100),
                        itemBuilder: (context, index) => _buildCard(context, box, data[index], index),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.indigo,
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Screencategories()),
          ),
          child: const Icon(Icons.add, size: 30),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(60),
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xffbdcbd8), Color(0xff0077b6)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            Textconstants.homeappBarName,
            style: const TextStyle(
              fontFamily: 'Anton',
              fontSize: 24,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, Box<StudentItem> box, StudentItem data, int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xffcaf0f8), Color(0xffade8f4)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(2, 3)),
        ],
        border: Border.all(color: Colors.white70),
      ),
      child: Row(
        children: [
          Icon(Icons.bookmark_added_rounded, color: Colors.indigo.shade400, size: 30),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data.subject,
                    style: const TextStyle(
                      fontFamily: 'Anton',
                      fontSize: 18,
                      color: Color(0xff03045e),
                    )),
                const SizedBox(height: 4),
                Text(data.topic,
                    style: const TextStyle(
                      fontFamily: 'Anton',
                      fontSize: 15,
                      color: Color(0xff0077b6),
                    )),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.timer, size: 14, color: Color(0xff023e8a)),
                    const SizedBox(width: 6),
                    Text('${data.duration} mins',
                        style: const TextStyle(
                          fontFamily: 'Anton',
                          fontSize: 13,
                          color: Color(0xff023e8a),
                        )),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
            onPressed: () {
              box.deleteAt(index);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('${data.topic} deleted'),
                duration: const Duration(seconds: 1),
                backgroundColor: Colors.redAccent,
              ));
            },
          ),
        ],
      ),
    );
  }
}
