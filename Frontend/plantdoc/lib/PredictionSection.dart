import 'package:flutter/material.dart';

class PredictionSection extends StatelessWidget {
  const PredictionSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF56FF46), // Background color
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1.246,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.network(
                        'https://cdn.builder.io/api/v1/image/assets/43a603419f9c47e690eea65da5b5c01e/276385d070ad1d5c511f66d9116554be220b8205da2da9ea5a43c5b1a65b85ef?apiKey=43a603419f9c47e690eea65da5b5c01e',
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(child: CircularProgressIndicator());
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return Center(
                              child: Icon(Icons.broken_image,
                                  size: 50, color: Colors.red));
                        },
                      ),
                    ),
                    Positioned(
                      top: 10,
                      left: 6,
                      child: Image.network(
                        'https://cdn.builder.io/api/v1/image/assets/43a603419f9c47e690eea65da5b5c01e/02d95fa7d489a6c7713ae2775127e6699e1f3c2f940cfd2d31fb5db256efe2fe?apiKey=43a603419f9c47e690eea65da5b5c01e',
                        width: 30,
                        fit: BoxFit.contain,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                              child: CircularProgressIndicator(strokeWidth: 2));
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(Icons.arrow_back,
                              size: 30,
                              color: Colors.black); // Fallback to back icon
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 19.0),
                child: Center(
                  child: Text(
                    'Prediction:',
                    style: TextStyle(
                        fontSize: 36,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 6, 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Prediction:',
                      style: TextStyle(
                          fontSize: 36,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'PlantDoc is an advanced mobile application that utilizes Convolutional Neural Networks (CNNs) to detect plant diseases by analyzing images of leaves. Since most plant diseases exhibit visible symptoms on leaves, users can simply capture photos of affected plants and receive an accurate diagnosis. The app processes images in batches, allowing multiple leaves to be analyzed at once, making it an efficient tool for farmers, gardeners, and researchers.\n\nBy leveraging deep learning, PlantDoc can identify various plant diseases with high accuracy. Once a disease is detected, the app provides comprehensive details, including its causes and possible treatments. Additionally, it offers preventive measures to help users protect their plants from future infections.\n\nDesigned with a user-friendly interface, PlantDoc makes plant health monitoring accessible to everyone, from agricultural professionals to hobbyists. Whether for large-scale farming or home gardening, this AI-powered tool serves as a reliable assistant for early disease detection and effective plant care.',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          height: 1.43,
                          letterSpacing: 0.1),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
