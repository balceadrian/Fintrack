import 'package:flutter/material.dart';
import 'entry_type.dart';
import 'budget_page.dart';
import 'report_page.dart';
import 'settings_page.dart';
import '../widgets/custom_nav_bar.dart';

class Dashboard extends StatefulWidget {
  final String userName;
  final double income;
  final bool isDarkMode;
  const Dashboard({super.key, required this.userName, required this.income, this.isDarkMode = false});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  // Removed _selectedIndex, now handled by CustomNavBar
  String _selectedFilter = 'Daily';

  @override
  Widget build(BuildContext context) {
    final bool isDark = widget.isDarkMode;
    final Color bgColor = isDark ? const Color(0xFF4C3D9A) : const Color(0xFFF6F0FF);
    final Color textColor = isDark ? Colors.white : const Color(0xFF2B1B3F);
    // Removed navBg, now handled by CustomNavBar
    final Color iconColor = isDark ? Colors.white : const Color(0xFF2B1B3F);
    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(
        children: [
          Column(
            children: [
              // Header
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
                    Row(
                      children: [
                        const Icon(Icons.chevron_left, color: Color(0xFF2B1B3F)),
                        const Text(
                          '< 2025 Jun >',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color(0xFF2B1B3F),
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
                        const Icon(Icons.chevron_right, color: Color(0xFF2B1B3F)),
                      ],
                    ),
                  ],
                ),
              ),
              // Total Balance
              Container(
                color: const Color(0xFFD6C6F6),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    const Text(
                      'Total Balance',
                      style: TextStyle(
                        color: Color(0xFF7B6F8E),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '₱${widget.income.toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: Color(0xFF2B1B3F),
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildSummaryCard(
                          icon: 'icons/expense.png',
                          label: 'Expense',
                          value: '₱0.00',
                          iconBg: const Color(0xFFF6E1E1),
                          iconColor: Color(0xFFB95B5B),
                        ),
                        const SizedBox(width: 16),
                        _buildSummaryCard(
                          icon: 'icons/income.png',
                          label: 'Income',
                          value: '₱${widget.income.toStringAsFixed(2)}',
                          iconBg: Color(0xFFE1F6E8),
                          iconColor: Color(0xFF4CB97B),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              // Transactions Section
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFFF6F0FF),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Transactions',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Color(0xFF2B1B3F),
                              ),
                            ),
                            DropdownButton<String>(
                              value: _selectedFilter,
                              underline: const SizedBox(),
                              icon: const Icon(Icons.arrow_drop_down, color: Color(0xFF2B1B3F)),
                              items: ['Daily', 'Weekly', 'Monthly']
                                  .map((e) => DropdownMenuItem(
                                        value: e,
                                        child: Text(e),
                                      ))
                                  .toList(),
                              onChanged: (val) {
                                setState(() {
                                  _selectedFilter = val!;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      // Transaction List
                      Expanded(
                        child: ListView(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          children: [
                            // Transaction items will be dynamically added from user input in expense entry and entry type.
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: CustomNavBar(
        selectedIndex: 0,
        onItemTapped: (index) {
          if (index == 0) {
            // Already on Dashboard
          } else if (index == 1) {
            Navigator.of(context).pushReplacement(createSlideRoute(const ReportPage()));
          } else if (index == 2) {
            Navigator.of(context).pushReplacement(createSlideRoute(const BudgetPage()));
          } else if (index == 3) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const SettingsPage()),
            );
          }
        },
        onFabPressed: () {
          Navigator.of(context).push(createSlideRoute(const EntryTypePage()));
        },
      ),
    );
  }

  Widget _buildSummaryCard({
    required String icon,
    required String label,
    required String value,
    required Color iconBg,
    required Color iconColor,
  }) {
    return Container(
      width: 140,
      height: 70,
      margin: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Image.asset(
                icon,
                width: 22,
                height: 22,
                color: iconColor,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xFF7B6F8E),
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2B1B3F),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionItem({
    required String date,
    required String description,
    required String amount,
    required bool isIncome,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                date,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF7B6F8E),
                ),
              ),
              Text(
                amount,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: isIncome ? const Color(0xFF4CB97B) : const Color(0xFFB95B5B),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Text(
            description,
            style: TextStyle(
              fontSize: 15,
              color: isIncome ? const Color(0xFF4CB97B) : const Color(0xFFB95B5B),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
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