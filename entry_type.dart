import 'package:flutter/material.dart';
import 'expense_entry.dart';
import 'dashboard.dart';
import 'budget_page.dart';
import 'report_page.dart';
import 'settings_page.dart';

class EntryTypePage extends StatelessWidget {
  final bool isDarkMode;
  const EntryTypePage({super.key, this.isDarkMode = false});

  String _formattedDate() {
    final now = DateTime.now();
    final weekday = [
      'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'
    ][now.weekday - 1];
    return '$weekday. ${now.day.toString().padLeft(2, '0')}/${now.month.toString().padLeft(2, '0')}/${now.year}';
  }

  PageRouteBuilder createSlideRoute(Widget page, {bool fromBottom = false}) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final begin = fromBottom ? const Offset(0.0, 1.0) : const Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);
        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final Color bgColor = isDarkMode ? const Color(0xFF4C3D9A) : const Color(0xFFF6F0FF);
    final Color textColor = isDarkMode ? Colors.white : const Color(0xFF2B1B3F);
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
                const Text(
                  'FinTrack',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 26,
                    color: Color(0xFF2B1B3F),
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
                Text(
                  _formattedDate(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: textColor,
                    letterSpacing: 0.5,
                    shadows: [
                      Shadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Entry Type Title
                Text(
                  'Entry Type',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
                const SizedBox(height: 32),
                // Manual Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                  child: GestureDetector(
                    onTap: () {
                    Navigator.of(context).push(
                      createSlideRoute(const ExpenseEntryPage(), fromBottom: true),
                    );
                    },
                    child: Container(
                      width: double.infinity,
                      height: 80,
                      decoration: BoxDecoration(
                        color: const Color(0xFF2B1B3F),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('icons/manual.png', width: 40, height: 40),
                          const SizedBox(width: 16),
                          Text(
                            'Manual',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // Scan Receipt Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: double.infinity,
                      height: 80,
                      decoration: BoxDecoration(
                        color: const Color(0xFFD6C6F6),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('icons/scan.png', width: 40, height: 40),
                          const SizedBox(width: 16),
                          Text(
                            'Scan Receipt',
                            style: TextStyle(
                              color: const Color(0xFF2B1B3F),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Bottom Navigation Bar
          Container(
            height: 90,
            decoration: const BoxDecoration(
              color: Color(0xFFD6C6F6),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildNavItem('Transaction', 'icons/transac plain.png', true, context, isDarkMode: isDarkMode),
                  _buildNavItem('Report', 'icons/reports.png', false, context, isDarkMode: isDarkMode),
                  _buildNavItem('Budget', 'icons/budget1.png', false, context, isDarkMode: isDarkMode),
                  _buildNavItem('Settings', 'icons/settings.png', false, context, isDarkMode: isDarkMode),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(String label, String iconPath, bool isActive, BuildContext context, {bool isDarkMode = false}) {
    final Color navItemBg = isDarkMode ? const Color(0xFF4C3D9A) : const Color(0xFFD6C6F6);
    final Color navItemText = isDarkMode ? Colors.white : const Color(0xFF2B1B3F);
    final Color navItemIcon = isDarkMode ? Colors.white : const Color(0xFF2B1B3F);
    return GestureDetector(
      onTap: () {
        if (label == 'Transaction') {
          Navigator.of(context).pushReplacement(createSlideRoute(const Dashboard(userName: 'User', income: 0.0)));
        } else if (label == 'Report') {
          Navigator.of(context).pushReplacement(createSlideRoute(const ReportPage()));
        } else if (label == 'Budget') {
          Navigator.of(context).pushReplacement(createSlideRoute(const BudgetPage()));
        } else if (label == 'Settings') {
          Navigator.of(context).pushReplacement(
            createSlideRoute(const SettingsPage()),
          );
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            iconPath,
            width: 34,
            height: 34,
            color: navItemIcon,
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 15,
              color: navItemText,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
} 