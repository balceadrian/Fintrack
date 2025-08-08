import 'package:flutter/material.dart';
import 'category_setting_page.dart';
import 'reminder_page.dart';
import '../widgets/custom_nav_bar.dart';
import 'dashboard.dart';
import 'report_page.dart';
import 'budget_page.dart';
import 'entry_type.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    final Color bgColor = isDarkMode ? const Color(0xFF4C3D9A) : Colors.white;
    final Color headerColor = isDarkMode ? const Color(0xFF4C3D9A) : const Color(0xFFF3EDFF);
    final Color textColor = isDarkMode ? Colors.white : const Color(0xFF1E0B30);
    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        children: [
          // Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 48, left: 24, right: 24, bottom: 16),
            decoration: BoxDecoration(
              color: headerColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(32),
                bottomRight: Radius.circular(32),
              ),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'FinTrack',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          // Top cards (centered)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _SettingsCard(
                  icon: 'icons/category.png',
                  label: 'Category',
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const CategorySettingPage()),
                    );
                  },
                ),
                const SizedBox(width: 16),
                _SettingsCard(
                  icon: 'icons/allowancw.png',
                  label: 'Reminder',
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const ReminderPage()),
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          // Sections
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(height: 32),
                const Text('General', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Switch(
                      value: isDarkMode,
                      onChanged: (val) {
                        setState(() {
                          isDarkMode = val;
                        });
                      },
                      activeColor: const Color(0xFF4C3D9A),
                    ),
                    const SizedBox(width: 8),
                    Text('Dark mode', style: TextStyle(fontSize: 15, color: textColor)),
                  ],
                ),
                const SizedBox(height: 16),
                const Text('Data', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 8),
                _SettingsItem(label: 'Export Data', onTap: () {}),
                const SizedBox(height: 16),
                const Text('About', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 8),
                _SettingsItem(label: 'Privacy Policy', onTap: () {}),
                _SettingsItem(label: 'Rate Us', onTap: () {}),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomNavBar(
        selectedIndex: 3,
        onItemTapped: (index) {
          if (index == 0) {
            Navigator.of(context).pushReplacement(createSlideRoute(const Dashboard(userName: 'User', income: 0.0)));
          } else if (index == 1) {
            Navigator.of(context).pushReplacement(createSlideRoute(const ReportPage()));
          } else if (index == 2) {
            Navigator.of(context).pushReplacement(createSlideRoute(const BudgetPage()));
          } else if (index == 3) {
            // Already on Settings
          }
        },
        onFabPressed: () {
          Navigator.of(context).push(createSlideRoute(const EntryTypePage()));
        },
      ),
    );
  }
}

class _SettingsCard extends StatelessWidget {
  final String icon;
  final String label;
  final VoidCallback onTap;
  const _SettingsCard({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).scaffoldBackgroundColor == const Color(0xFF4C3D9A);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 140,
        height: 90,
        decoration: BoxDecoration(
          color: isDarkMode ? const Color(0xFF4C3D9A) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade300, width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(icon, width: 32, height: 32),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                color: isDarkMode ? Colors.white : const Color(0xFF1E0B30),
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SettingsItem extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _SettingsItem({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).scaffoldBackgroundColor == const Color(0xFF4C3D9A);
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          label,
          style: TextStyle(fontSize: 15, color: isDarkMode ? Colors.white : const Color(0xFF1E0B30)),
        ),
      ),
    );
  }
}

// Removed _SettingsNavBar and _NavBarItem, now handled by CustomNavBar

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
