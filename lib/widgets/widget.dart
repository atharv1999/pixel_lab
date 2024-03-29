import 'package:flutter/material.dart';
import 'package:pixel_lab/model/wallpaper_model.dart';
import 'package:pixel_lab/views/image_view.dart';
import 'package:google_fonts/google_fonts.dart';

Widget brandName() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        'Pixe',
        style: GoogleFonts.overpass(
          textStyle: TextStyle(
              color: Colors.black87,
              fontFamily: 'Overpass',
              fontWeight: FontWeight.w700,
              fontSize: 25),
        ),
      ),
      Text(
        'Lab',
        style: GoogleFonts.overpass(
          textStyle: TextStyle(
              color: Colors.blue,
              fontFamily: 'Overpass',
              fontWeight: FontWeight.w700,
              fontSize: 25),
        ),
      ),
    ],
  );
}

Widget wallpapersList({List<WallpaperModel>? wallpapers, context}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 24),
    child: GridView.count(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
      children: wallpapers!.map((wallpaper) {
        return GridTile(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ImageView(imgUrl: wallpaper.src!.portrait!),
                ),
              );
            },
            child: Hero(
              tag: wallpaper.src!.portrait!,
              child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    wallpaper.src!.portrait!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    ),
  );
}
