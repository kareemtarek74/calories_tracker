import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageSelectorWidget extends StatelessWidget {
  final File? image;
  final Function(File?) onImageSelected;

  const ImageSelectorWidget({
    super.key,
    required this.image,
    required this.onImageSelected,
  });

  Future<void> _pickImage(ImageSource source, BuildContext context) async {
    final pickedFile =
        await ImagePicker().pickImage(source: source, imageQuality: 30);
    if (pickedFile != null) {
      onImageSelected(File(pickedFile.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return image == null
        ? DottedBorder(
            borderType: BorderType.RRect,
            color: const Color(0xFF5F33E1),
            strokeWidth: 1.5,
            dashPattern: const [2, 2],
            radius: const Radius.circular(12),
            child: SizedBox(
              height: 56,
              width: double.infinity,
              child: TextButton.icon(
                onPressed: () => _showImageSourceDialog(context),
                icon: const Icon(
                  Icons.add_photo_alternate_outlined,
                  color: Color(0xFF5F33E1),
                  size: 24,
                ),
                label: const Text('Add Meal Img',
                    style: TextStyle(color: Color(0xFF5F33E1), fontSize: 16)),
              ),
            ),
          )
        : GestureDetector(
            onTap: () => onImageSelected(null),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.file(
                image!,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 150,
              ),
            ),
          );
  }

  void _showImageSourceDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text('Choose Image Source'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt, color: Color(0xFF5F33E1)),
                title: const Text('Camera'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.camera, context);
                },
              ),
              ListTile(
                leading:
                    const Icon(Icons.photo_library, color: Color(0xFF5F33E1)),
                title: const Text('Gallery'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.gallery, context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
