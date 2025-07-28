import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Constraints extends StatelessWidget {
  const Constraints({super.key});

  static const String adminPhoneNumber = '6285694787246';

  Future<void> _launchWhatsApp() async {
    final Uri whatsappUrl = Uri.parse("https://wa.me/$adminPhoneNumber");

    if (!await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication)) {
      debugPrint("Could not launch WhatsApp: $whatsappUrl");
      throw 'Could not launch WhatsApp';
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    double imageSize = screenWidth * 0.22;
    double spacing = screenWidth * 0.04;
    double fontSizeTitle = screenWidth < 360 ? 11 : 12;
    double fontSizeSubtitle = screenWidth < 360 ? 10 : 11;
    double buttonFontSize = screenWidth < 360 ? 10 : 11;
    double buttonWidth = screenWidth * 0.55;
    double buttonHeight = screenWidth * 0.09;

    return Container(
      padding: EdgeInsets.all(screenWidth * 0.05),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/constrains-trash.png",
            height: imageSize,
            width: imageSize,
            fit: BoxFit.contain,
          ),
          SizedBox(width: spacing),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Ada Kendala Pengangkutan?",
                  style: TextStyle(
                    fontSize: fontSizeTitle,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Laporkan Jika Mengalami Kendala Pengangkutan",
                  style: TextStyle(
                    fontSize: fontSizeSubtitle,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF646464),
                  ),
                ),
                SizedBox(height: 8),
                ElevatedButton(
                  onPressed: _launchWhatsApp,
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(buttonWidth, buttonHeight),
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    foregroundColor: const Color(0xFF4EBAE5),
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                      side: const BorderSide(
                        color: Color(0xFF4EBAE5),
                        width: 2,
                      ),
                    ),
                  ),
                  child: Text(
                    "Beri Tahu admin di Sini!",
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
