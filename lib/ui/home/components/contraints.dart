import 'package:flutter/material.dart';

class Constraints extends StatelessWidget {
  const Constraints({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "assets/images/constrains-trash.png",
            width: 95,
            height: 92.51,
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Ada Kendala Pengangkutan?",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                width: 200, 
                child: Text(
                  "Laporkan Jika Mengalami Kendala Pengangkutan",
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF646464),
                  ),
                ),
              ),
              SizedBox(height: 3),
              Align(
                alignment: Alignment.centerLeft,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(200, 30),
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    foregroundColor: Color(0xFF4EBAE5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                      side: BorderSide(color: Color(0xFF4EBAE5), width: 2),
                    ),
                  ),
                  child: Text(
                    "Buat Laporan",
                    style: TextStyle(
                      fontSize: 11.31,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
