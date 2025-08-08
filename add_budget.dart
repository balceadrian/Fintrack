import 'package:flutter/material.dart';
import '../widgets/custom_nav_bar.dart';
import 'dashboard.dart';
import 'report_page.dart';
import 'entry_type.dart';

class AddBudgetPage extends StatefulWidget {
  const AddBudgetPage({super.key});

  @override
  State<AddBudgetPage> createState() => _AddBudgetPageState();
}

class _AddBudgetPageState extends State<AddBudgetPage> {
  String budgetType = 'Income';
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController(text: '0.00');
  final TextEditingController _forController = TextEditingController();
  String period = '22/06 - 28/06';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F0FF),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 180),
                child: Column(
                  children: [
                    // Top Bar
                    Container(
                      color: const Color(0xFFD6C6F6),
                      padding: const EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 18),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.of(context).pop(),
                            child: const Icon(Icons.arrow_back_ios_new, color: Color(0xFF2B1B3F), size: 28),
                          ),
                          const SizedBox(width: 12),
                          const Text(
                            'Add Budget',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 24,
                              color: Color(0xFF2B1B3F),
                              letterSpacing: 1.1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 18),
                    // Name
                    _sectionLabelWithIcon('Name', 'icons/category.png'),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                      child: TextField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          hintText: 'Enter Budget Name',
                          border: InputBorder.none,
                          isDense: true,
                        ),
                      ),
                    ),
                    const Divider(height: 1, thickness: 1, color: Color(0xFFB7AFCB)),
                    // Amount
                    _sectionLabelWithIcon('Amount', 'icons/money.png'),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                      child: Row(
                        children: [
                          Image.asset('icons/money.png', width: 24, height: 24),
                          const SizedBox(width: 8),
                          const Text('₱', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF2B1B3F))),
                          const SizedBox(width: 4),
                          Expanded(
                            child: TextField(
                              controller: _amountController,
                              keyboardType: const TextInputType.numberWithOptions(decimal: true),
                              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF2B1B3F)),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                isDense: true,
                                contentPadding: EdgeInsets.zero,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(height: 1, thickness: 1, color: Color(0xFFB7AFCB)),
                    // Budget Type
                    _sectionLabelWithIcon('Budget Type', 'icons/budget1.png'),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      child: Row(
                        children: [
                          _budgetTypeButton('Income'),
                          const SizedBox(width: 12),
                          _budgetTypeButton('Expense'),
                        ],
                      ),
                    ),
                    const Divider(height: 1, thickness: 1, color: Color(0xFFB7AFCB)),
                    // Budget For
                    _sectionLabelWithIcon('Budget For', 'icons/allowancw.png'),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                      child: TextField(
                        controller: _forController,
                        decoration: const InputDecoration(
                          hintText: 'Catering Project',
                          border: InputBorder.none,
                          isDense: true,
                        ),
                      ),
                    ),
                    const Divider(height: 1, thickness: 1, color: Color(0xFFB7AFCB)),
                    // Budget Period
                    _sectionLabelWithIcon('Budget Period', 'icons/date.png'),
                    InkWell(
                      onTap: _pickBudgetPeriod,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                period,
                                style: const TextStyle(fontSize: 16, color: Color(0xFF2B1B3F)),
                              ),
                            ),
                            const Icon(Icons.calendar_today, size: 20, color: Color(0xFFB7AFCB)),
                          ],
                        ),
                      ),
                    ),
                    const Divider(height: 1, thickness: 1, color: Color(0xFFB7AFCB)),
                    const SizedBox(height: 32),
                    Center(
                      child: SizedBox(
                        width: 180,
                        height: 44,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF2B1B3F),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Save',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ],
        ),
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
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Settings page not implemented')));
          }
        },
        onFabPressed: () {
          Navigator.of(context).push(createSlideRoute(const EntryTypePage()));
        },
      ),
    );
  }

  Widget _sectionLabelWithIcon(String label, String iconPath) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 12, bottom: 2),
      child: Row(
        children: [
          Image.asset(iconPath, width: 24, height: 24),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Color(0xFF2B1B3F),
            ),
          ),
        ],
      ),
    );
  }

  Widget _budgetTypeButton(String type) {
    final bool isSelected = budgetType == type;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => budgetType = type),
        child: Container(
          height: 38,
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF2B1B3F) : const Color(0xFFF6F0FF),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFB7AFCB)),
          ),
          child: Center(
            child: Text(
              type,
              style: TextStyle(
                color: isSelected ? Colors.white : const Color(0xFFB7AFCB),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
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

  Future<void> _pickBudgetPeriod() async {
    final now = DateTime.now();
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(now.year - 5),
      lastDate: DateTime(now.year + 5),
      initialDateRange: DateTimeRange(
        start: now,
        end: now.add(const Duration(days: 6)),
      ),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xFF2B1B3F),
              foregroundColor: Colors.white,
              titleTextStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              iconTheme: IconThemeData(color: Colors.white),
              actionsIconTheme: IconThemeData(color: Colors.white),
              elevation: 0,
            ),
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF2B1B3F), // selected day circle
              onPrimary: Colors.white,
              onSurface: Color(0xFF2B1B3F),
              surface: Color(0xFFF6F0FF),
              secondary: Color(0xFF7B6F8E), // not used by picker
              // Custom colors for range selection
              // These are used by the picker for the range bar
              // But Flutter uses primary for selected day, and primaryContainer for range
              primaryContainer: Color(0xFF7B6F8E), // violet for range bar
            ),
            textTheme: const TextTheme(
              titleLarge: TextStyle(
                color: Color(0xFF2B1B3F),
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              bodyLarge: TextStyle(
                color: Color(0xFF2B1B3F),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              bodyMedium: TextStyle(
                color: Color(0xFF2B1B3F),
                fontSize: 16,
              ),
              labelLarge: TextStyle(
                color: Color(0xFF2B1B3F),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        period = '${_pad(picked.start.day)}/${_pad(picked.start.month)} - ${_pad(picked.end.day)}/${_pad(picked.end.month)}';
      });
    }
  }

  String _pad(int n) => n.toString().padLeft(2, '0');
} 