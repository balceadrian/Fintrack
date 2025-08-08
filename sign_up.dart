import 'package:flutter/material.dart';

import 'sign_in.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _obscurePassword = true;
  bool _obscureConfirm = true;
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fullNameController.addListener(_updateButtonState);
    _emailController.addListener(_updateButtonState);
    _passwordController.addListener(_updateButtonState);
    _confirmPasswordController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _updateButtonState() {
    setState(() {});
  }

  bool get _isFormValid {
    return _fullNameController.text.trim().isNotEmpty && 
           _emailController.text.trim().isNotEmpty && 
           _passwordController.text.trim().isNotEmpty && 
           _confirmPasswordController.text.trim().isNotEmpty;
  }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: 393,
          height: 852,
          margin: const EdgeInsets.only(left: 0, top: 0),
          child: Stack(
            children: [
              // Main rounded rectangle background
              Positioned(
                left: 0,
                top: 211,
                child: Container(
                  width: 393,
                  height: 641,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF6E8FF),
                    borderRadius: BorderRadius.circular(55),
                    border: Border.all(color: Color(0xFF1E0B30), width: 4),
                  ),
                ),
              ),
              // Title
              Positioned(
                left: 79,
                top: 92,
                child: SizedBox(
                  width: 241,
                  height: 96,
                  child: Text(
                    'Create Your\nAccount',
                    style: const TextStyle(
                      fontSize: 40,
                      color: Color(0xFF1E0B30),
                      fontFamily: 'Inter',
                      height: 1.2,
                    ),
                  ),
                ),
              ),
              // Full Name label
              Positioned(
                left: 30,
                top: 258,
                child: SizedBox(
                  width: 333,
                  height: 24,
                  child: Text(
                    'Full Name:',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontFamily: 'Inter',
                    ),
                  ),
                ),
              ),
              // Full Name field
              Positioned(
                left: 30,
                top: 288,
                child: Container(
                  width: 333,
                  height: 33,
                  decoration: BoxDecoration(
                    color: Color(0xFFF6EFFF),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color(0xFF1E0B30), width: 2),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: TextField(
                      controller: _fullNameController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter your full name',
                        hintStyle: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ),
              // Email label
              Positioned(
                left: 30,
                top: 344,
                child: SizedBox(
                  width: 333,
                  height: 24,
                  child: Text(
                    'Email:',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontFamily: 'Inter',
                    ),
                  ),
                ),
              ),
              // Email field
              Positioned(
                left: 30,
                top: 374,
                child: Container(
                  width: 333,
                  height: 33,
                  decoration: BoxDecoration(
                    color: Color(0xFFF1D8FF),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color(0xFF1E0B30), width: 2),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter your email',
                        hintStyle: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ),
              // Password label
              Positioned(
                left: 30,
                top: 430,
                child: SizedBox(
                  width: 333,
                  height: 24,
                  child: Text(
                    'Password:',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontFamily: 'Inter',
                    ),
                  ),
                ),
              ),
              // Password field
              Positioned(
                left: 30,
                top: 460,
                child: Container(
                  width: 333,
                  height: 33,
                  decoration: BoxDecoration(
                    color: Color(0xFFF1D8FF),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color(0xFF1E0B30), width: 2),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: TextField(
                            controller: _passwordController,
                            obscureText: _obscurePassword,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter your password',
                              hintStyle: const TextStyle(fontSize: 16),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscurePassword ? Icons.visibility_off : Icons.visibility,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscurePassword = !_obscurePassword;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Confirm Password label
              Positioned(
                left: 30,
                top: 516,
                child: SizedBox(
                  width: 333,
                  height: 24,
                  child: Text(
                    'Confirm Password:',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontFamily: 'Inter',
                    ),
                  ),
                ),
              ),
              // Confirm Password field
              Positioned(
                left: 30,
                top: 546,
                child: Container(
                  width: 333,
                  height: 33,
                  decoration: BoxDecoration(
                    color: Color(0xFFF1D8FF),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color(0xFF1E0B30), width: 2),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: TextField(
                            controller: _confirmPasswordController,
                            obscureText: _obscureConfirm,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Re-enter your password',
                              hintStyle: const TextStyle(fontSize: 16),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscureConfirm ? Icons.visibility_off : Icons.visibility,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscureConfirm = !_obscureConfirm;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Signup button
              Positioned(
                left: 64,
                top: 657,
                child: SizedBox(
                  width: 265,
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _isFormValid ? const Color(0xFF1E0B30) : Colors.grey.shade400,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 4,
                    ),
                    onPressed: _isFormValid ? () {
                      // Show success message
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Account created successfully!'),
                          backgroundColor: Colors.green,
                        ),
                      );
                      
                      // Navigate to sign in page
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => const SignInPage()),
                      );
                    } : null,
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Inter',
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
