// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // Ukuran responsif berdasarkan lebar layar
    double iconSize = screenWidth < 400 ? 24 : 30;
    double fontSize = screenWidth < 400 ? 12 : 14;
    double paddingHorizontal = screenWidth < 400 ? 8 : 12;
    double paddingVertical = screenWidth < 400 ? 8 : 10;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, -2),
          )
        ],
        border: Border(
          top: BorderSide(color: Colors.grey.withOpacity(0.15)),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.home_filled, "Home", 0, iconSize, fontSize, paddingHorizontal, paddingVertical),
          _buildNavItem(Icons.history, "Riwayat", 1, iconSize, fontSize, paddingHorizontal, paddingVertical),
          _buildNavItem(Icons.person_outline_outlined, "Profil", 2, iconSize, fontSize, paddingHorizontal, paddingVertical),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    IconData icon,
    String label,
    int index,
    double iconSize,
    double fontSize,
    double paddingHorizontal,
    double paddingVertical,
  ) {
    bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: isSelected ? 0.9 : 1.0, end: isSelected ? 1.0 : 0.9),
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
        builder: (context, scale, child) {
          return Transform.scale(
            scale: scale,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              padding: EdgeInsets.symmetric(
                horizontal: isSelected ? paddingHorizontal : 0,
                vertical: paddingVertical,
              ),
              decoration: BoxDecoration(
                color: isSelected ? Color(0xFFF66D06) : Colors.transparent,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  Icon(
                    icon,
                    size: iconSize,
                    color: isSelected ? Colors.white : Colors.grey,
                  ),
                  AnimatedSize(
                    duration: Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                    child: isSelected
                        ? Padding(
                            padding: const EdgeInsets.only(left: 6),
                            child: Text(
                              label,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: fontSize,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        : SizedBox(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
