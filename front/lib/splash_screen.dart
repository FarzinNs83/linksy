import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:front/core/utils/app_ext.dart';
import 'package:front/core/utils/shared_pref_manager.dart';
import 'package:front/features/auth/presentation/views/login_screen.dart';
import 'package:front/features/auth/presentation/views/register_screen.dart';
import 'package:front/features/home/presentation/views/home_screen.dart';
import 'package:front/gen/fonts.gen.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

// انیمیشن پس‌زمینه با گرادینت نرم و دایره‌های محو
class SubtleBackground extends StatelessWidget {
  const SubtleBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          // رنگ‌های آرام و ملایم
          colors: [
            Color(0xFFE0E7FF), // آبی روشن ملایم
            Color(0xFFF5F7FA), // کرم خیلی روشن
          ],
        ),
      ),
      child: Stack(
        children: [
          // دایره محو در بالا سمت چپ
          _AnimatedGlowCircle(
            alignment: const Alignment(-1.2, -1.2), // کمی خارج از صفحه
            size: 200,
            color: const Color(0xFFB3B6FF).withOpacity(0.3),
            duration: const Duration(seconds: 2),
          ),
          // دایره محو در پایین سمت راست
          _AnimatedGlowCircle(
            alignment: const Alignment(1.2, 1.2), // کمی خارج از صفحه
            size: 250,
            color: const Color(0xFF6C72FF).withOpacity(0.2),
            duration: const Duration(seconds: 2),
          ),
          // دایره محو در مرکز (برای کمی درخشش)
          Center(
            child: _AnimatedGlowCircle(
              size: 150,
              color: Colors.white.withOpacity(0.1),
              duration: const Duration(seconds: 2),
            ),
          ),
        ],
      ),
    );
  }
}

// ویجت دایره درخشان متحرک
class _AnimatedGlowCircle extends StatelessWidget {
  final Alignment alignment;
  final double size;
  final Color color;
  final Duration duration;

  const _AnimatedGlowCircle({
    this.alignment = Alignment.center,
    required this.size,
    required this.color,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: duration,
      curve: Curves.easeInOut,
      builder: (context, value, child) {
        return Align(
          alignment: alignment,
          child: Opacity(
            opacity: value, // ظاهر شدن تدریجی
            child: Transform.scale(
              scale: 1.0 + value * 0.2, // کمی بزرگ شدن
              child: Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color.withOpacity(
                    color.opacity * value,
                  ), // شفافیت متغیر
                  boxShadow: [
                    BoxShadow(
                      color: color.withOpacity(0.4 * value),
                      blurRadius: size * 0.5, // شعاع بلور بر اساس سایز
                      spreadRadius: size * 0.1,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _animateLogo = false;
  bool _showLoader = false;
  

  @override
  void initState() {
    super.initState();
    // نمایش لوگو بعد از 300 میلی‌ثانیه
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        _animateLogo = true;
      });
    });

    // نمایش لودر بعد از 1.8 ثانیه
    Future.delayed(const Duration(milliseconds: 1800), () {
      setState(() {
        _showLoader = true;
      });
    });

    // رفتن به صفحه بعد بعد از 3.5 ثانیه
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      SharedPref.instance.init().then((_) {
        final token = SharedPref.instance.getString('token');
        log('Token from Shared Preferences: $token');
        if (token != null) {
          if(!mounted) return;
          context.navigateR(const HomeScreen());
        } else {
          if(!mounted) return;
          context.navigateR(RegisterScreen());
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
         SubtleBackground(), // پس‌زمینه ظریف و متحرک
          Center(
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 700),
              curve: Curves.easeOutCubic,
              opacity: _animateLogo ? 1.0 : 0.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // نام اپلیکیشن با فونت سفارشی
                  Text.rich(
                    TextSpan(
                      text: 'L',
                      style: TextStyle(
                        fontFamily: FontFamily.bobbers,
                        fontSize: 80, // خیلی بزرگ
                        fontWeight: FontWeight.w900,
                        color: const Color(0xFF2E3192), // رنگ تیره اصلی
                        height: 0.8, // تنظیم ارتفاع خط برای ظاهر بهتر
                      ),
                      children: [
                        TextSpan(
                          text: 'inksy',
                          style: TextStyle(
                            fontFamily: FontFamily.bobbers,
                            fontSize: 70, // کمی کوچکتر از اولی
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF6C72FF), // رنگ دوم
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 18),
                  // شعار اپلیکیشن
                  Text(
                    'Effortless Connections.',
                    style: TextStyle(
                      color: const Color(0xFF2E3192).withOpacity(0.75),
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.6,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // لودر در پایین صفحه
          Positioned(
            left: 0,
            right: 0,
            bottom: 35,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInCubic,
              opacity: _showLoader ? 1.0 : 0.0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  LoadingAnimationWidget.staggeredDotsWave(
                    color: const Color(0xFF6C72FF), // رنگ اصلی
                    size: 40,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Initializing your journey...',
                    style: TextStyle(
                      color: const Color(0xFF2E3192).withOpacity(0.65),
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
