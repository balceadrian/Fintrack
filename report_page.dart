import 'package:flutter/material.dart';
import '../widgets/custom_nav_bar.dart';
import 'dashboard.dart';
import 'budget_page.dart';
import 'entry_type.dart';

class ReportPage extends StatefulWidget {
  final bool isDarkMode;
  const ReportPage({super.key, this.isDarkMode = false});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  String selectedTab = 'Expense';

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
                    onTap: () => setState(() => selectedTab = 'Expense'),
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
                    onTap: () => setState(() => selectedTab = 'Income'),
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
            // Expense by category
            Container(
              width: double.infinity,
              color: const Color(0xFFF6F0FF),
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
              child: const Padding(
                padding: EdgeInsets.only(left: 20.0, bottom: 8),
                child: Text(
                  'Expense by category',
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
                          painter: _DonutChartPainter(),
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
                            '500.00',
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
            // Expense ranking
            const Padding(
              padding: EdgeInsets.only(left: 20.0, top: 16, bottom: 4),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Expense ranking',
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
                    Image.asset('icons/foodndrink.png', width: 32, height: 32),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Text(
                        'Food & Drink',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color(0xFF2B1B3F),
                        ),
                      ),
                    ),
                    const Text(
                      '500 (100%)',
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
                  'Expense trending',
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
      bottomNavigationBar: CustomNavBar(
        selectedIndex: 1,
        onItemTapped: (index) {
          if (index == 0) {
            Navigator.of(context).pushReplacement(createSlideRoute(const Dashboard(userName: 'User', income: 0.0)));
          } else if (index == 1) {
            // Already on Report
          } else if (index == 2) {
            Navigator.of(context).pushReplacement(createSlideRoute(const BudgetPage()));
          } else if (index == 3) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Settings page not implemented')));
          }
        },
        onFabPressed: () {
          Navigator.of(context).push(createSlideRoute(const EntryTypePage()));
        },
      ),
    );
  }
}

class _DonutChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFFFC727)
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