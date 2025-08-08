import 'onboarding.dart';
import 'package:flutter/material.dart';
import '/widgets/custom_button.dart';
import  'sign_in.dart' as sign_in;
import  'sign_up.dart' as sign_up;

Route createSignInRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const sign_in.SignInPage(),
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

Route createSignUpRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const sign_up.SignUpPage(),
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

Route createOnboardingRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const Onboarding(),
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

class Mainpage extends StatelessWidget {
  const Mainpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4C3D9A),
      body: Center(
        child: SizedBox(
          width: 393,
          height: 852,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _InteractiveLogo(size: 210),
              const SizedBox(height: 80),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    width: 170,
                    height: 48,
                    borderColor: const Color(0xFF2C2C2C),
                    fillColor: const Color(0xFF1E0B30),
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 18,
                        color: Colors.white,
                        height: 1.0,
                        letterSpacing: 0,
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(createSignInRoute());
                    },
                  ),
                  const SizedBox(height: 24),
                  CustomButton(
                    width: 170,
                    height: 48,
                    borderColor: const Color(0xFF2C2C2C),
                    fillColor: const Color(0xFF1E0B30),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 18,
                        color: Colors.white,
                        height: 1.0,
                        letterSpacing: 0,
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(createSignUpRoute());
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InteractiveLogo extends StatefulWidget {
  final double size;
  const _InteractiveLogo({this.size = 180});
  @override
  State<_InteractiveLogo> createState() => _InteractiveLogoState();
}

class _InteractiveLogoState extends State<_InteractiveLogo> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 120),
      lowerBound: 0.95,
      upperBound: 1.15,
      value: 1.0,
    );
    _scaleAnimation = _controller.drive(Tween(begin: 1.0, end: 1.15));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    _controller.animateTo(1.15, duration: const Duration(milliseconds: 120));
  }

  void _onTapUp(TapUpDetails details) {
    _controller.animateBack(1.0, duration: const Duration(milliseconds: 120));
  }

  void _onTapCancel() {
    _controller.animateBack(1.0, duration: const Duration(milliseconds: 120));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.scale(
            scale: _controller.value,
            child: child,
          );
        },
        child: SizedBox(
          width: widget.size,
          height: widget.size,
          child: Image.asset(
            'icons/logo1.jpg',
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}