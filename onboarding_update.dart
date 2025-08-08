import 'package:flutter/material.dart';
import 'dashboard.dart';
class OnboardingUpdate extends StatefulWidget {
  final String name;
  final double income;
  const OnboardingUpdate({super.key, required this.name, required this.income});

  @override
  State<OnboardingUpdate> createState() => _OnboardingUpdateState();
}

class _OnboardingUpdateState extends State<OnboardingUpdate> {
  final List<String> _options = [
    'Daily',
    'Weekly',
    'Monthly',
    'Only when necessary',
  ];
  final Set<String> _selectedOptions = {};

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
                  '⚠️ How often do you want spending\nupdates?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color(0xFF1E0B30),
                  ),
                ),
              ),
              const SizedBox(height: 32),
             
              // Image
              SizedBox(
                width: 180,
                height: 180,
                child: Image.asset(
                  'icons/update.png', // Use the correct asset for the update icon
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 32),
              // Options (multi-select)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 8,
                  runSpacing: 8,
                  children: _options.map((option) {
                    final selected = _selectedOptions.contains(option);
                    return ChoiceChip(
                      label: Text(option),
                      selected: selected,
                      onSelected: (isSelected) {
                        setState(() {
                          if (isSelected) {
                            _selectedOptions.add(option);
                          } else {
                            _selectedOptions.remove(option);
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
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.0),
                child: Text(
                  'We\'ll alert you if you\'re overspending or\nmaking progress — you choose how often.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
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
                    onPressed: _selectedOptions.isNotEmpty
                        ? () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => Dashboard(userName: widget.name, income: widget.income),
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
