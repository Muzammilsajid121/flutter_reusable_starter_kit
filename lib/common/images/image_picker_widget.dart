import 'dart:io'; // File class ke liye
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';
//-- This is an image picker border box widget that can show preview images that picked.
class DragDropWidget extends StatefulWidget {
  final Function(List<XFile>) onImagesSelected;  // callback function to send selected images to parent widget

  const DragDropWidget({super.key, required this.onImagesSelected});

  @override
  State<DragDropWidget> createState() => _DragDropWidgetState();
}

class _DragDropWidgetState extends State<DragDropWidget> {
  final ImagePicker _picker = ImagePicker();
  List<XFile> _selectedFiles = []; // Local list state handle 

  Future<void> _pickImages() async {
    try {
      final List<XFile> selectedImages = await _picker.pickMultiImage();
      if (selectedImages.isNotEmpty) {
        setState(() {
          _selectedFiles = selectedImages;
        });
        widget.onImagesSelected(selectedImages);
      }
    } catch (e) {
      debugPrint("Error picking images: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImages,
      child: DottedBorder(
        options: RoundedRectDottedBorderOptions(
            radius: Radius.circular(12),
            color: Colors.grey.shade300,
            strokeWidth: 2,
            dashPattern: [8, 4],
        ),
      
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(12),
          ),
          child: _selectedFiles.isEmpty 
              ? _buildPlaceholder() // if no image is selected
              : _buildImagePreview(), // if image is  selected
        ),
      ),
    );
  }

  //--Drag & Drop Design
  Widget _buildPlaceholder() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey.shade200,
            child: const Icon(Icons.cloud_upload_outlined, color: Colors.brown),
          ),
          const SizedBox(height: 12),
          RichText(
            text: const TextSpan(
              style: TextStyle(color: Colors.black, fontSize: 14),
              children: [
                TextSpan(text: "DRAG & DROP OR "),
                TextSpan(text: "BROWSE", style: TextStyle(color: Colors.brown, decoration: TextDecoration.underline, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Text("SUPPORTS JPG, PNG UP TO 10MB", style: TextStyle(color: Colors.grey.shade400, fontSize: 10)),
        ],
      ),
    );
  }

  //-- New Image Preview Design
  Widget _buildImagePreview() {
    return Column(
      children: [
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _selectedFiles.length > 8 ? 8 : _selectedFiles.length, // Max 8 dikhayenge
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, // Ek row mein 4 images
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.file(
                File(_selectedFiles[index].path),
                fit: BoxFit.cover,
              ),
            );
          },
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.image, size: 16, color: Colors.brown),
            const SizedBox(width: 6),
            Text(
              "${_selectedFiles.length} Images Selected",
              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.brown, fontSize: 13),
            ),
            const SizedBox(width: 10),
            const Text("|", style: TextStyle(color: Colors.grey)),
            TextButton(
              onPressed: _pickImages,
              child: const Text("Change", style: TextStyle(color: Colors.blue, fontSize: 12)),
            ),
            const Text("|", style: TextStyle(color: Colors.grey)),
            //--Remove images button
            TextButton(
              onPressed: () {
                setState(() {
                  _selectedFiles = [];
                });
                widget.onImagesSelected([]);
              },
              child: const Text("Remove", style: TextStyle(color: Colors.red, fontSize: 12)),
            )
          ],
        ),
      ],
    );
  }

}


          // //--How to use in page--
          // DragDropWidget(
          //   onImagesSelected: (files) {
          //     setState(() { mySelectedFiles = files; });
          //     print("Total images selected: ${files.length}");
          //   },
          // ),