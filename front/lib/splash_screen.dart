import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:front/core/utils/app_ext.dart';
import 'package:front/core/utils/shared_pref_manager.dart';
import 'package:front/features/auth/presentation/views/register_screen.dart';
import 'package:front/features/home/presentation/views/home_screen.dart';
import 'package:front/gen/fonts.gen.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SubtleBackground extends StatelessWidget {
  const SubtleBackground({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colors.primaryContainer.withValues(alpha: 0.4),
            colors.surfaceContainerLowest,
          ],
        ),
      ),
      child: Stack(
        children: [
          _AnimatedGlowCircle(
            alignment: const Alignment(-1.2, -1.2),
            size: 200,
            color: colors.primaryContainer.withValues(alpha: 0.3),
            duration: const Duration(seconds: 2),
          ),
          _AnimatedGlowCircle(
            alignment: const Alignment(1.2, 1.2),
            size: 250,
            color: colors.primary.withValues(alpha: 0.2),
            duration: const Duration(seconds: 2),
          ),
          Center(
            child: _AnimatedGlowCircle(
              size: 150,
              color: colors.onPrimary.withValues(alpha: 0.1),
              duration: const Duration(seconds: 2),
            ),
          ),
        ],
      ),
    );
  }
}

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
            opacity: value,
            child: Transform.scale(
              scale: 1.0 + value * 0.2,
              child: Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color.withValues(alpha: (color.a * value).clamp(0.0, 1.0)),
                  boxShadow: [
                    BoxShadow(
                      color: color.withValues(alpha: 0.4 * value),
                      blurRadius: size * 0.5,
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
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        _animateLogo = true;
      });
    });

    Future.delayed(const Duration(milliseconds: 1800), () {
      setState(() {
        _showLoader = true;
      });
    });

    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      SharedPref.instance.init().then((_) {
        final token = SharedPref.instance.getString('token');
        log('Token from Shared Preferences: $token');
        if (token != null) {
          if (!mounted) return;
          context.navigateR(const HomeScreen());
        } else {
          if (!mounted) return;
          context.navigateR(RegisterScreen());
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SubtleBackground(),
          Center(
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 700),
              curve: Curves.easeOutCubic,
              opacity: _animateLogo ? 1.0 : 0.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text.rich(
                    TextSpan(
                      text: 'L',
                      style: TextStyle(
                        fontFamily: FontFamily.bobbers,
                        fontSize: 80,
                        fontWeight: FontWeight.w900,
                        color: colors.onSurface,
                        height: 0.8,
                      ),
                      children: [
                        TextSpan(
                          text: 'inksy',
                          style: TextStyle(
                            fontFamily: FontFamily.bobbers,
                            fontSize: 70,
                            fontWeight: FontWeight.w700,
                            color: colors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 18),
                  Text(
                    'Effortless Connections.',
                    style: TextStyle(
                      color: colors.onSurface.withValues(alpha: 0.75),
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.6,
                    ),
                  ),
                ],
              ),
            ),
          ),
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
                    color: colors.primary,
                    size: 40,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Initializing your journey...',
                    style: TextStyle(
                      color: colors.onSurface.withValues(alpha: 0.65),
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
