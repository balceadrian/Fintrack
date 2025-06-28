import 'package:flutter/material.dart';
import 'onboarding_year_level.dart';
class OnboardingGender extends StatefulWidget {
  final String name;
  const OnboardingGender({super.key, required this.name});

  @override
  State<OnboardingGender> createState() => _OnboardingGenderState();
}

class _OnboardingGenderState extends State<OnboardingGender> {
  String? _selectedGender;

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
                  '🧬 What is your biological sex?',
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
                  'We collect your gender to help provide more accurate financial insights and tailor your experience based on common spending patterns.',
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
                  'icons/gender.png', // Change to your actual asset if needed
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 32),
              // Gender options
              GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedGender = 'Male';
                  });
                },
                child: Container(
                  width: 120,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: _selectedGender == 'Male' ? const Color(0xFF1E0B30) : Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFF1E0B30), width: 2),
                  ),
                  child: Center(
                    child: Text(
                      'Male',
                      style: TextStyle(
                        color: _selectedGender == 'Male' ? Colors.white : const Color(0xFF1E0B30),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedGender = 'Female';
                  });
                },
                child: Container(
                  width: 120,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: _selectedGender == 'Female' ? const Color(0xFF1E0B30) : Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFF1E0B30), width: 2),
                  ),
                  child: Center(
                    child: Text(
                      'Female',
                      style: TextStyle(
                        color: _selectedGender == 'Female' ? Colors.white : const Color(0xFF1E0B30),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
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
                    onPressed: _selectedGender != null
                        ? () {
                           Navigator.of(context).push(
                             MaterialPageRoute(
                               builder: (context) => OnboardingYearLevel(name: widget.name),
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