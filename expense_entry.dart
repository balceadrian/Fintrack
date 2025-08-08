import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dashboard.dart';
import 'report_page.dart' as report;
import 'settings_page.dart' as settings;

class ExpenseEntryPage extends StatefulWidget {
  final bool isDarkMode;
  const ExpenseEntryPage({super.key, this.isDarkMode = false});

  @override
  State<ExpenseEntryPage> createState() => _ExpenseEntryPageState();
}

class _ExpenseEntryPageState extends State<ExpenseEntryPage> {
  String selectedTab = 'Expense';
  double amount = 500.00;
  final TextEditingController _amountController = TextEditingController();
  String category = 'Food & Drink';
  String subCategory = 'Breakfast';
  String paymentMethod = 'Cash';
  String date = 'Monday. 23/06/2025';
  String note = '';

  final List<Map<String, String>> _categories = [
    {'icon': 'icons/foodndrink.png', 'label': 'Food & Drink'},
    {'icon': 'icons/educ.png', 'label': 'Education'},
    {'icon': 'icons/home.png', 'label': 'House'},
    {'icon': 'icons/cash.png', 'label': 'Cash'},
    {'icon': 'icons/money.png', 'label': 'Money'},
    {'icon': 'icons/budget1.png', 'label': 'Budget'},
    {'icon': 'icons/allowancw.png', 'label': 'Allowance'},
    {'icon': 'icons/note.png', 'label': 'Note'},
    {'icon': 'icons/manual.png', 'label': 'Manual'},
  ];

  @override
  void initState() {
    super.initState();
    _amountController.text = '0.00';
    // Ensure initial category is valid
    final validLabels = _categories.map((c) => c['label']).toList();
    if (!validLabels.contains(category)) {
      category = validLabels.first ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color bgColor = widget.isDarkMode ? const Color(0xFF4C3D9A) : Colors.white;
    final Color textColor = widget.isDarkMode ? Colors.white : const Color(0xFF2B1B3F);
    final Color iconColor = widget.isDarkMode ? Colors.white : const Color(0xFF2B1B3F);
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Section: Tab Bar + Amount
            Container(
              margin: const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 16),
              padding: const EdgeInsets.only(left: 0, right: 0, top: 40, bottom: 32),
              decoration: BoxDecoration(
                color: const Color(0xFFD6C6F6),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 0, bottom: 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFF2B1B3F), size: 28),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        const SizedBox(width: 2),
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
                        const SizedBox(width: 56),
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
                        const SizedBox(width: 24),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          '₱',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2B1B3F),
                          ),
                        ),
                        const SizedBox(width: 8),
                        SizedBox(
                          width: 180,
                          child: TextField(
                            controller: _amountController,
                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                            style: const TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2B1B3F),
                            ),
                            textAlign: TextAlign.left,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              isDense: true,
                              contentPadding: EdgeInsets.zero,
                            ),
                            onChanged: (val) {
                              setState(() {
                                amount = double.tryParse(val) ?? 0.0;
                              });
                            },
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1, thickness: 1, color: Color(0xFFB7AFCB)),
            // Category
            _buildSectionLabel('Category'),
            _buildCategoryDropdown(context),
            const Divider(height: 1, thickness: 1, color: Color(0xFFB7AFCB)),
            // Payment Method
            _buildSectionLabel('Payment Method'),
            _buildSelectorRow(
              icon: 'icons/cash.png',
              label: paymentMethod,
              onTap: () {},
            ),
            const Divider(height: 1, thickness: 1, color: Color(0xFFB7AFCB)),
            // Date
            _buildSectionLabel('Date'),
            _buildSelectorRow(
              icon: 'icons/calendar.png',
              label: date,
              onTap: _pickDate,
            ),
            const Divider(height: 1, thickness: 1, color: Color(0xFFB7AFCB)),
            // Note
            _buildSectionLabel('Note'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Click here to fill in the remarks',
                  border: InputBorder.none,
                  isDense: true,
                ),
                onChanged: (val) => setState(() => note = val),
                minLines: 1,
                maxLines: 2,
              ),
            ),
            const Divider(height: 1, thickness: 1, color: Color(0xFFB7AFCB)),
            const SizedBox(height: 16),
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
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  Widget _buildSectionLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 12, bottom: 4),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 14,
          color: Color(0xFF7B6F8E),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildSelectorRow({
    required String icon,
    required String label,
    String? trailing,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Row(
          children: [
            Image.asset(icon, width: 28, height: 28),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 18,
                  color: Color(0xFF2B1B3F),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            if (trailing != null) ...[
              const Icon(Icons.arrow_right, color: Color(0xFF2B1B3F)),
              Text(
                trailing,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFF2B1B3F),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
            const Icon(Icons.arrow_forward_ios, size: 16, color: Color(0xFF2B1B3F)),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(String label, String iconPath, bool isActive, BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (label == 'Transaction') {
          Navigator.of(context).pushReplacement(
            report.createSlideRoute(const Dashboard(userName: 'User', income: 0.0)),
          );
        } else if (label == 'Report') {
          Navigator.of(context).pushReplacement(
            report.createSlideRoute(const report.ReportPage()),
          );
        } else if (label == 'Budget') {
          // TODO: Replace with actual Budget page
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Budget page not implemented')));
        } else if (label == 'Settings') {
          Navigator.of(context).pushReplacement(
            settings.createSlideRoute(const settings.SettingsPage()),
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

  void _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(now.year - 5),
      lastDate: DateTime(now.year + 5),
    );
    if (picked != null) {
      setState(() {
        date = '${_weekdayString(picked.weekday)}. ${_pad(picked.day)}/${_pad(picked.month)}/${picked.year}';
      });
    }
  }

  String _weekdayString(int weekday) {
    switch (weekday) {
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      case 7:
        return 'Sunday';
      default:
        return '';
    }
  }

  String _pad(int n) => n.toString().padLeft(2, '0');

  Widget _buildCategoryDropdown(BuildContext context) {
    return InkWell(
      onTap: () async {
        final selected = await showDialog<String>(
          context: context,
          barrierDismissible: true,
          builder: (context) {
            return Dialog(
              backgroundColor: const Color(0xFFF6F0FF),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              child: Container(
                width: 260,
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      decoration: BoxDecoration(
                        color: const Color(0xFFD6C6F6),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(14),
                          topRight: Radius.circular(14),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Category',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Color(0xFF2B1B3F),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.of(context).pop(),
                            child: const Icon(Icons.close, color: Color(0xFF2B1B3F)),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            ..._categories.map((cat) => ListTile(
                                  leading: Image.asset(cat['icon']!, width: 32, height: 32),
                                  title: Text(
                                    cat['label']!,
                                    style: const TextStyle(
                                      fontSize: 17,
                                      color: Color(0xFF2B1B3F),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  onTap: () => Navigator.of(context).pop(cat['label']),
                                )),
                            const Divider(height: 1, thickness: 1, color: Color(0xFFB7AFCB)),
                            ListTile(
                              leading: const Icon(Icons.add, color: Color(0xFF2B1B3F)),
                              title: const Text(
                                '+ ADD NEW',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Color(0xFF2B1B3F),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onTap: () => Navigator.of(context).pop(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
        if (selected != null && selected.isNotEmpty) {
          setState(() {
            category = selected;
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Row(
          children: [
            Image.asset(
              _categories.firstWhere((c) => c['label'] == category, orElse: () => _categories[0])['icon']!,
              width: 28,
              height: 28,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                category,
                style: const TextStyle(
                  fontSize: 18,
                  color: Color(0xFF2B1B3F),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Icon(Icons.arrow_drop_down, size: 24, color: Color(0xFF2B1B3F)),
          ],
        ),
      ),
    );
  }
} 