import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewPage extends StatelessWidget {
  final String imagePath;

  const PhotoViewPage({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        iconTheme: IconThemeData(color: Colors.white), // Set arrow color to white
        backgroundColor: Color.fromARGB(255, 0, 0, 0), // Make the app bar transparent
        elevation: 0, // Remove the shadow
        title: Center(
          child: Container(
            height: kToolbarHeight * 0.7,
            child: const Image(
              image: AssetImage('assets/images/X.png'),
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
      ),

      body: Center(
        child: PhotoView(
          imageProvider: AssetImage(imagePath),
          minScale: PhotoViewComputedScale.contained,
          maxScale: PhotoViewComputedScale.covered * 2.5,
        ),
      ),
    );
  }
}
