import 'package:flutter/material.dart';

class PlantDocInfo extends StatelessWidget {
  const PlantDocInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF56FF46),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(67),
            child: Image.network(
              'https://cdn.builder.io/api/v1/image/assets/43a603419f9c47e690eea65da5b5c01e/92cbe5e22f382f005c33dc64986d4f141b99e39c1149bb110983b90c6b1449c7?apiKey=43a603419f9c47e690eea65da5b5c01e&',
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(17, 30, 6, 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'PlantDoc',
                  style: TextStyle(
                    fontSize: 36,
                    fontFamily: 'Roboto',
                  ),
                ),
                SizedBox(height: 21),
                Text(
                  'PlantDoc is an advanced mobile application that utilizes Convolutional Neural Networks (CNNs) to detect plant diseases by analyzing images of leaves. Since most plant diseases exhibit visible symptoms on leaves, users can simply capture photos of affected plants and receive an accurate diagnosis. The app processes images in batches, allowing multiple leaves to be analyzed at once, making it an efficient tool for farmers, gardeners, and researchers.\n\nBy leveraging deep learning, PlantDoc can identify various plant diseases with high accuracy. Once a disease is detected, the app provides comprehensive details, including its causes and possible treatments. Additionally, it offers preventive measures to help users protect their plants from future infections.\n\nDesigned with a user-friendly interface, PlantDoc makes plant health monitoring accessible to everyone, from agricultural professionals to hobbyists. Whether for large-scale farming or home gardening, this AI-powered tool serves as a reliable assistant for early disease detection and effective plant care',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    height: 1.43,
                    letterSpacing: 0.1,
                    fontFamily: 'Roboto',
                  ),
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            height: 48,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(100),
                                bottomLeft: Radius.circular(100),
                              ),
                              border: Border.all(color: Color(0xFF919282)),
                              color: Color(0xFF3A4B3A),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'System',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Roboto',
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 40),
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            height: 48,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(100),
                                bottomRight: Radius.circular(100),
                              ),
                              border: Border.all(color: Color(0xFF919282)),
                              color: Color(0xFF3A4B3A),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Camera',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Roboto',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
