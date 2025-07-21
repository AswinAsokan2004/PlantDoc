import 'package:flutter/material.dart';
import 'package:plantdoc/PredictionSection.dart';
import 'package:plantdoc/get_started_section.dart';
import 'package:plantdoc/plant_doc_info.dart';

class PlantDocApp extends StatelessWidget {
  const PlantDocApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Expanded(
                  //   child: PredictionSection(),
                  // ),
                  // SizedBox(width: 20),
                  // Expanded(
                  //   child: PlantDocInfo(),
                  // ),
                  // SizedBox(width: 20),
                  Expanded(
                    child: GetStartedSection(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
