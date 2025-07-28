import 'package:bersihku/controller/user_home_controller.dart';
import 'package:bersihku/ui/user/history/history-screen/history_screen.dart';
import 'package:bersihku/ui/user/home-user/home-screen-user/components/bottom_navbar.dart';
import 'package:bersihku/ui/user/home-user/home-screen-user/components/contraints.dart';
import 'package:bersihku/ui/user/home-user/home-screen-user/components/guide.dart';
import 'package:bersihku/ui/user/home-user/home-screen-user/components/report.dart';
import 'package:bersihku/ui/user/profile-user/profile-user-screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({super.key});

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

final UserHomeController userHomeController = Get.put(UserHomeController());

class _UserHomeScreenState extends State<UserHomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = [
    //dasar untuk bernavigasi via bottom nav bar
    const UserHomeScreen(),
    const HistoryScreen(),
    ProfileScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      /*menyatakan bahwa initial actionnya adalah untuk menampilkan objek yg berada pada index 0*/
      _selectedIndex = index;
    });
  }

  @override
Widget build(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  double screenWidth = size.width;
  double screenHeight = size.height;

  return Scaffold(
    backgroundColor: const Color(0xFF4EBAE5),
    body: _selectedIndex == 0
        ? Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/blue-pettern.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05,
                  vertical: screenHeight * 0.02,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(() {
                      final userName = userHomeController.user.value?.name ?? "User";

                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Hai, $userName 👋🏻",
                                style: TextStyle(
                                  fontSize: screenWidth * 0.055,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Siap menjemput sampah hari ini?",
                                style: TextStyle(
                                  fontSize: screenWidth * 0.04,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    }),
                    SizedBox(height: screenHeight * 0.03),
                    const Guide(),
                    SizedBox(height: screenHeight * 0.025),
                    Text(
                      "Drop In",
                      style: TextStyle(
                        fontSize: screenWidth * 0.06,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    const Report(),
                    SizedBox(height: screenHeight * 0.03),
                    const Constraints(),
                  ],
                ),
              ),
            ),
          )
        : _widgetOptions[_selectedIndex],
    bottomNavigationBar: BottomNavBar(
      selectedIndex: _selectedIndex,
      onItemTapped: _onItemTapped,
    ),
  );
}

}
