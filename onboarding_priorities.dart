import 'package:flutter/material.dart';
import 'onboarding_expense_tracking.dart';
class OnboardingPriorities extends StatefulWidget {
  final String name;
  final double income;
  const OnboardingPriorities({super.key, required this.name, required this.income});

  @override
  State<OnboardingPriorities> createState() => _OnboardingPrioritiesState();
}

class _OnboardingPrioritiesState extends State<OnboardingPriorities> {
  final List<String> _priorities = [
    'Daily Expenses',
    'Emergency Fund',
    'Uniform & Supplies',
    'Future Business',
    'Other',
  ];
  final Set<String> _selectedPriorities = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          width: 393,
          height: 852,
          child: Column(
            children: [
              const SizedBox(height: 60),
              // Title
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.0),
                child: Text(
                  '🔍 What are your biggest financial priorities right now?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color(0xFF1E0B30),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Subtitle
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.0),
                child: Text(
                  "Tell us what you're saving for — from catering supplies and daily cooking needs to your next event planning project or future business venture!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              // Image
              SizedBox(
                width: 180,
                height: 180,
                child: Image.asset(
                  'icons/moneybag.png', // Change to your actual asset if needed
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 32),
              // Priorities (multi-select)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 8,
                  runSpacing: 8,
                  children: _priorities.map((priority) {
                    final selected = _selectedPriorities.contains(priority);
                    return ChoiceChip(
                      label: Text(priority),
                      selected: selected,
                      onSelected: (isSelected) {
                        setState(() {
                          if (isSelected) {
                            _selectedPriorities.add(priority);
                          } else {
                            _selectedPriorities.remove(priority);
                          }
                        });
                      },
                      selectedColor: const Color(0xFF1E0B30),
                      labelStyle: TextStyle(
                        color: selected ? Colors.white : const Color(0xFF1E0B30),
                        fontWeight: FontWeight.bold,
                      ),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(color: Color(0xFF1E0B30), width: 2),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const Spacer(),
              // Continue Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 44,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1E0B30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: _selectedPriorities.isNotEmpty
                        ? () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => OnboardingExpenseTracking(name: widget.name, income: widget.income),
                              ),
                            );
                          }
                        : null,
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 