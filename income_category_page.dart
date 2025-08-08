import 'package:flutter/material.dart';

class IncomeCategoryPage extends StatelessWidget {
  const IncomeCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
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
          // Tabs (only Income)
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color(0xFFB7AFCB),
                        width: 2,
                      ),
                    ),
                  ),
                  child: const Text(
                    'Income',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF1E0B30),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Divider(height: 1, thickness: 1),
          // Category List
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade300, width: 1),
            ),
            child: ListTile(
              leading: Image.asset('icons/allowancw.png', width: 32, height: 32),
              title: const Text(
                'Allowance',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              onTap: () {},
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade300, width: 1),
            ),
            child: ListTile(
              leading: Image.asset('icons/wallet plain.png', width: 32, height: 32),
              title: const Text(
                'Add Income',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color(0xFF1E0B30),
                ),
              ),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
} 