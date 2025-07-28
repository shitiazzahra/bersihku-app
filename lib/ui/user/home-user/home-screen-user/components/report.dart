import 'package:bersihku/ui/user/home-user/input-form/input_form_screen.dart';
import 'package:flutter/material.dart';

class Report extends StatelessWidget {
  const Report({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // Responsif settings
    double imageSize = screenWidth * 0.22;
    double spacing = screenWidth * 0.04;
    double fontSizeTitle = screenWidth < 360 ? 11 : 12;
    double fontSizeSubtitle = screenWidth < 360 ? 10 : 11;
    double buttonFontSize = screenWidth < 360 ? 10 : 11;
    double buttonWidth = screenWidth * 0.55;
    double buttonHeight = screenWidth * 0.09;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: spacing,
        vertical: screenWidth * 0.05,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/report-trash.png",
            height: imageSize,
            width: imageSize,
            fit: BoxFit.contain,
          ),
          SizedBox(width: spacing),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Buat Laporan Pengangkutan?",
                  style: TextStyle(
                    fontSize: fontSizeTitle,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  "Buat Laporan untuk hari ini!",
                  style: TextStyle(
                    fontSize: fontSizeSubtitle,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF646464),
                  ),
                ),
                SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const InputFormScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(buttonWidth, buttonHeight),
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    foregroundColor: const Color(0xFF4EBAE5),
                    shadowColor: Colors.transparent,
                    surfaceTintColor: Colors.transparent,
                    splashFactory: NoSplash.splashFactory,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                      side: const BorderSide(
                        color: Color(0xFF4EBAE5),
                        width: 2,
                      ),
                    ),
                  ),
                  child: Text(
                    "Buat Laporan",
                    style: TextStyle(
                      fontSize: buttonFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
