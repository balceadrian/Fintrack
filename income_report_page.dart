import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'budget_page.dart';
import 'settings_page.dart';

class IncomeReportPage extends StatefulWidget {
  final bool isDarkMode;
  const IncomeReportPage({super.key, this.isDarkMode = false});

  @override
  State<IncomeReportPage> createState() => _IncomeReportPageState();
}

class _IncomeReportPageState extends State<IncomeReportPage> {
  String selectedTab = 'Income';

  @override
  Widget build(BuildContext context) {
    final Color bgColor = widget.isDarkMode ? const Color(0xFF4C3D9A) : const Color(0xFFF6F0FF);
    final Color textColor = widget.isDarkMode ? Colors.white : const Color(0xFF2B1B3F);
    final Color iconColor = widget.isDarkMode ? Colors.white : const Color(0xFF2B1B3F);
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          children: [
            // Top Bar with Tabs
            Container(
              color: const Color(0xFFD6C6F6),
              padding: const EdgeInsets.only(top: 40, left: 0, right: 0, bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Expense',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        color: selectedTab == 'Expense'
                            ? const Color(0xFF2B1B3F)
                            : const Color(0xFFB7AFCB),
                      ),
                    ),
                  ),
                  const SizedBox(width: 64),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Income',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        color: selectedTab == 'Income'
                            ? const Color(0xFF2B1B3F)
                            : const Color(0xFFB7AFCB),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Income by category
            Container(
              width: double.infinity,
              color: const Color(0xFFF6F0FF),
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
              child: const Padding(
                padding: EdgeInsets.only(left: 20.0, bottom: 8),
                child: Text(
                  'Income by category',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color(0xFF2B1B3F),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                width: double.infinity,
                height: 180,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 140,
                        height: 140,
                        child: CustomPaint(
                          painter: _IncomeDonutChartPainter(),
                        ),
                      ),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '100%',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Color(0xFFB7AFCB),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '15,000.00',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Color(0xFF2B1B3F),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Income ranking
            const Padding(
              padding: EdgeInsets.only(left: 20.0, top: 16, bottom: 4),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Income ranking',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color(0xFF2B1B3F),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFF6F0FF)),
                ),
                child: Row(
                  children: [
                    Image.asset('icons/allowancw.png', width: 32, height: 32),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Text(
                        'Allowance',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color(0xFF2B1B3F),
                        ),
                      ),
                    ),
                    const Text(
                      '15,000.00 (100%)',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color(0xFF2B1B3F),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20.0, top: 16, bottom: 4),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Income trending',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color(0xFF2B1B3F),
                  ),
                ),
              ),
            ),
            // Add more trending widgets here
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 80,
        width: 80,
        margin: const EdgeInsets.only(bottom: 45),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: const Color(0xFF2B1B3F),
                shape: BoxShape.circle,
                border: Border.all(color: Color(0xFFF6F0FF), width: 6),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.add, color: Colors.white, size: 40),
              onPressed: () {},
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
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
              _buildNavItem('Transaction', 'icons/transac plain.png', false, context),
              _buildNavItem('Report', 'icons/reports.png', true, context),
              const SizedBox(width: 80),
              _buildNavItem('Budget', 'icons/budget1.png', false, context),
              _buildNavItem('Settings', 'icons/settings.png', false, context),
            ],
          ),
        ),
      ),
    );
  }
}

class _IncomeDonutChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF4CB97B)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 24;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 12;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -1.5708, // start angle (top)
      6.2832, // sweep angle (full circle)
      false,
      paint,
    );
    // Draw inner white circle
    final innerPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, radius - 24 / 2, innerPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

Widget _buildNavItem(String label, String iconPath, bool isActive, BuildContext context) {
  return GestureDetector(
    onTap: () {
      if (label == 'Transaction') {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const Dashboard(userName: 'User', income: 0.0)),
        );
      } else if (label == 'Report') {
        // Already on Report page
      } else if (label == 'Budget') {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const BudgetPage()),
        );
      } else if (label == 'Settings') {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const SettingsPage()),
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
          color: isActive ? const Color(0xFF2B1B3F) : const Color(0xFFB7AFCB),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: TextStyle(
            fontSize: 15,
            color: isActive ? const Color(0xFF2B1B3F) : const Color(0xFFB7AFCB),
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    ),
  );
} 