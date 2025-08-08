import 'package:flutter/material.dart';
import 'onboarding_budget.dart';
class OnboardingYearLevel extends StatefulWidget {
  final String name;
  const OnboardingYearLevel({super.key, required this.name});

  @override
  State<OnboardingYearLevel> createState() => _OnboardingYearLevelState();
}

class _OnboardingYearLevelState extends State<OnboardingYearLevel> {
  String? _selectedYearLevel;
  final List<String> _yearLevels = [
    '1st year',
    '2nd year',
    '3rd year',
  ];

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
                  '🎓 What year are you in your hospitality program?',
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
                  "Knowing where you are in your journey helps us tailor financial goals — whether you're in training, internship, or about to graduate.",
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
                  'icons/educ.png', // Change to your actual asset if needed
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 32),
              // Year Level Dropdown
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: DropdownButtonFormField<String>(
                  value: _selectedYearLevel,
                  decoration: InputDecoration(
                    labelText: 'Year Level',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  items: _yearLevels
                      .map((level) => DropdownMenuItem(
                            value: level,
                            child: Text(level),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedYearLevel = value;
                    });
                  },
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
                    onPressed: _selectedYearLevel != null
                        ? () {
                           Navigator.of(context).push(
                             MaterialPageRoute(
                               builder: (context) => OnboardingBudget(name: widget.name),
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