import 'package:flutter/material.dart';

class CategorySettingPage extends StatefulWidget {
  const CategorySettingPage({super.key});

  @override
  State<CategorySettingPage> createState() => _CategorySettingPageState();
}

class _CategorySettingPageState extends State<CategorySettingPage> {
  bool isExpense = true;

  final List<Map<String, String>> expenseCategories = [
    {'name': 'Food & Drink'},
    {'name': 'Bills'},
    {'name': 'Transportation'},
    {'name': 'Education'},
    {'name': 'Entertainment'},
  ];

  final List<Map<String, String>> incomeCategories = [
    {'name': 'Salary'},
    {'name': 'Allowance'},
    {'name': 'Bonus'},
  ];

  @override
  Widget build(BuildContext context) {
    final categories = isExpense ? expenseCategories : incomeCategories;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1E0B30)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Category',
          style: TextStyle(
            color: Color(0xFF1E0B30),
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: false,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Tabs
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => isExpense = true),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: isExpense ? const Color(0xFF1E0B30) : Colors.transparent,
                          width: 2,
                        ),
                      ),
                    ),
                    child: Text(
                      'Expense',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: isExpense ? const Color(0xFF1E0B30) : Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => isExpense = false),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: !isExpense ? const Color(0xFFB7AFCB) : Colors.transparent,
                          width: 2,
                        ),
                      ),
                    ),
                    child: Text(
                      'Income',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: !isExpense ? const Color(0xFFB7AFCB) : Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Divider(height: 1, thickness: 1),
          // Category List
          Expanded(
            child: ListView.builder(
              itemCount: categories.length + 1,
              itemBuilder: (context, index) {
                if (index < categories.length) {
                  final cat = categories[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade300, width: 1),
                    ),
                    child: ListTile(
                      title: Text(
                        cat['name']!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      onTap: () {},
                    ),
                  );
                } else {
                  // Add Category
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade300, width: 1),
                    ),
                    child: ListTile(
                      title: Row(
                        children: const [
                          Icon(Icons.add_box, color: Color(0xFF1E0B30)),
                          SizedBox(width: 8),
                          Text(
                            'Add Category',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Color(0xFF1E0B30),
                            ),
                          ),
                        ],
                      ),
                      onTap: () {},
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
} 