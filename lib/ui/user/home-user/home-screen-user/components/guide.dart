import 'package:bersihku/ui/user/home-user/guide/guide_screen.dart';
import 'package:flutter/material.dart';

class Guide extends StatelessWidget {
  const Guide({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    double fontSizeText = screenWidth < 360 ? 10 : 11;
    double fontSizeButton = screenWidth < 360 ? 9 : 10;
    double imageWidth = screenWidth < 360 ? 70 : 90;
    double imageHeight = screenWidth < 360 ? 85 : 105;
    double paddingHorizontal = screenWidth * 0.05;
    double paddingVertical = screenWidth * 0.04;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: paddingHorizontal,
        vertical: paddingVertical,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Expanded untuk teks dan button
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Pelajari cara menggunakan aplikasi ini untuk melaporkan dan memantau pengangkutan sampah dengan mudah!",
                  style: TextStyle(
                    fontSize: fontSizeText,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HelpGuideScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: const Color(0xFF4EBAE5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 6,
                    ),
                  ),
                  child: Text(
                    "Panduan Penggunaan Aplikasi",
                    style: TextStyle(
                      fontSize: fontSizeButton,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 10),
          // Gambar di kanan
          Image.asset(
            "assets/images/guide(2).png",
            width: imageWidth,
            height: imageHeight,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
