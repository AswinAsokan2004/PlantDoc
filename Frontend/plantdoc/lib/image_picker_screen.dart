import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerGrid extends StatefulWidget {
  @override
  _ImagePickerGridState createState() => _ImagePickerGridState();
}

class _ImagePickerGridState extends State<ImagePickerGrid> {
  final List<File> _selectedImages = [];

  Future<void> pickImages() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile> images = await picker.pickMultiImage();

    if (images.isNotEmpty) {
      setState(() {
        _selectedImages.clear();
        // Add the selected images to the list, up to 5 images
        _selectedImages.addAll(images.take(4).map((img) => File(img.path)));
        print(_selectedImages.length);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pick Images')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: pickImages,
            child: const Text("Pick Images"),
          ),
          Expanded(
            child: _selectedImages.isEmpty
                ? const Center(child: Text("No images selected"))
                : GridView.builder(
                    padding: const EdgeInsets.all(10),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1, // 1 image per row
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: _selectedImages.length,
                    itemBuilder: (context, index) {
                      return Image.file(
                        _selectedImages[index],
                        fit: BoxFit.cover,
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
