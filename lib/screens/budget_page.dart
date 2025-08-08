import 'package:flutter/material.dart';
import 'add_budget.dart';
import 'dashboard.dart';
import 'report_page.dart';
import 'settings_page.dart';
import 'entry_type.dart';
import '../widgets/custom_nav_bar.dart';

class BudgetPage extends StatelessWidget {
  final bool isDarkMode;
  const BudgetPage({super.key, this.isDarkMode = false});

  @override
  Widget build(BuildContext context) {
    final Color bgColor = isDarkMode ? const Color(0xFF4C3D9A) : const Color(0xFFF6F0FF);
    final Color textColor = isDarkMode ? Colors.white : const Color(0xFF2B1B3F);
    final Color navBg = isDarkMode ? const Color(0xFF4C3D9A) : const Color(0xFFD6C6F6);
    final Color iconColor = isDarkMode ? Colors.white : const Color(0xFF2B1B3F);
    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        children: [
          // Top Bar
          Container(
            padding: const EdgeInsets.only(top: 48, left: 20, right: 20, bottom: 20),
            color: const Color(0xFFD6C6F6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'FinTrack',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 26,
                    color: textColor,
                    letterSpacing: 1.2,
                    shadows: [
                      Shadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.add_circle_outline, color: iconColor, size: 28),
                      onPressed: () {},
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Image.asset(
                        'icons/budget1.png',
                        width: 28,
                        height: 28,
                        color: iconColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          // Center Card
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  createSlideRoute(const AddBudgetPage()),
                );
              },
              child: Container(
                width: 260,
                height: 110,
                decoration: BoxDecoration(
                  color: const Color(0xFF2B1B3F),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 16,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('icons/budget1.png', width: 48, height: 48),
                    const SizedBox(width: 16),
                    Text(
                      'Create new budgets',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Spacer(),
          const SizedBox(height: 60), // for FAB overlap
        ],
      ),
      bottomNavigationBar: CustomNavBar(
        selectedIndex: 2,
        onItemTapped: (index) {
          if (index == 0) {
            Navigator.of(context).pushReplacement(createSlideRoute(const Dashboard(userName: 'User', income: 0.0)));
          } else if (index == 1) {
            Navigator.of(context).pushReplacement(createSlideRoute(const ReportPage()));
          } else if (index == 2) {
            // Already on Budget
          } else if (index == 3) {
            Navigator.of(context).pushReplacement(
              createSlideRoute(const SettingsPage()),
            );
          }
        },
        onFabPressed: () {
          Navigator.of(context).push(createSlideRoute(const EntryTypePage()));
        },
      ),
    );
  }

  // Removed _buildNavItem, now handled by CustomNavBar

  PageRouteBuilder createSlideRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);
        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }
} 