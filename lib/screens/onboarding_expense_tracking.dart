import 'package:flutter/material.dart';
import 'onboarding_update.dart';
class OnboardingExpenseTracking extends StatefulWidget {
  final String name;
  const OnboardingExpenseTracking({super.key, required this.name});

  @override
  State<OnboardingExpenseTracking> createState() => _OnboardingExpenseTrackingState();
}

class _OnboardingExpenseTrackingState extends State<OnboardingExpenseTracking> {
  final List<String> _methods = [
    'Manually',
    'Notes App',
    "I don't track",
    'Other budgeting app',
  ];
  String? _selectedMethod;

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
                  '🧾 How do you usually keep track of your expenses?',
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
                  'This helps us understand your current habits and how FinTrack can support you better.',
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
                  'icons/bill.png', // Change to your actual asset if needed
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 32),
              // Methods (single-select)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 8,
                  runSpacing: 8,
                  children: _methods.map((method) {
                    final selected = _selectedMethod == method;
                    return ChoiceChip(
                      label: Text(method),
                      selected: selected,
                      onSelected: (isSelected) {
                        setState(() {
                          _selectedMethod = isSelected ? method : null;
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
                    onPressed: _selectedMethod != null
                        ? (){
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => OnboardingUpdate(name: widget.name),
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