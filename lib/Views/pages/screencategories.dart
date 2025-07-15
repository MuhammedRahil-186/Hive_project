import 'package:first_project_hive/constant/textconstant.dart';
import 'package:first_project_hive/main.dart';
import 'package:first_project_hive/model/mymodel.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Screencategories extends StatefulWidget {
  @override
  State<Screencategories> createState() => _ScreencategoriesState();
}

class _ScreencategoriesState extends State<Screencategories> {
  final TextEditingController durationController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController topicController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void savedata() {
    final mybox = Hive.box<StudentItem>(mykey);
    final duration = double.tryParse(durationController.text) ?? 0;

    final data = StudentItem(
      subject: subjectController.text.trim(),
      topic: topicController.text.trim(),
      duration: duration,
    );

    mybox.add(data);
  }

  @override
  void dispose() {
    durationController.dispose();
    topicController.dispose();
    subjectController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(Textconstants.categoriestext1),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff00b4d8), Color(0xff03045e)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.95),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 12,
                      offset: Offset(4, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Add Study Session',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal.shade700,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: subjectController,
                      validator:
                          (value) =>
                              value == null || value.isEmpty
                                  ? 'Enter subject'
                                  : null,
                      decoration: inputDecoration('Subject'),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: topicController,
                      validator:
                          (value) =>
                              value == null || value.isEmpty
                                  ? 'Enter topic'
                                  : null,
                      decoration: inputDecoration('Topic Studied'),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: durationController,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return 'Enter duration';
                        final num = double.tryParse(value);
                        if (num == null || num <= 0) return 'Invalid duration';
                        return null;
                      },
                      decoration: inputDecoration('Duration (minutes)'),
                    ),
                    const SizedBox(height: 25),
                    ElevatedButton.icon(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          savedata();
                          Navigator.pop(context);
                        }
                      },
                      icon: const Icon(Icons.save_alt_rounded),
                      label: const Text('Save'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal.shade600,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 14,
                        ),
                        textStyle: const TextStyle(fontSize: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        elevation: 5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      filled: true,
      fillColor: Colors.white,
      labelStyle: TextStyle(color: Colors.grey[800]),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Colors.teal),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Colors.blue, width: 2),
      ),
    );
  }
}
