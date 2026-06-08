import 'dart:math' as math;
import 'package:flutter/material.dart';

class AnimatedLikeButton extends StatefulWidget {
  final int likeCount;
  final bool isLiked;
  final VoidCallback onLike;
  final VoidCallback onUnlike;

  const AnimatedLikeButton({
    super.key,
    required this.likeCount,
    required this.isLiked,
    required this.onLike,
    required this.onUnlike,
  });

  @override
  State<AnimatedLikeButton> createState() => _AnimatedLikeButtonState();
}

class _AnimatedLikeButtonState extends State<AnimatedLikeButton>
    with TickerProviderStateMixin {
  late AnimationController _scaleController;
  late AnimationController _particleController;
  late Animation<double> _scaleAnimation;

  bool _isLiked = false;

  @override
  void initState() {
    super.initState();
    _isLiked = widget.isLiked;

    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _particleController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.3).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.elasticOut),
    );
  }

  @override
  void dispose() {
    _scaleController.dispose();
    _particleController.dispose();
    super.dispose();
  }

  void _onTap() {
    if (!_isLiked) {
      _scaleController.forward(from: 0.0);
      _particleController.forward(from: 0.0);
      setState(() => _isLiked = true);
      widget.onLike();
    } else {
      setState(() => _isLiked = false);
      widget.onUnlike();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (_isLiked && _particleController.isAnimating)
            ..._buildParticles(),
          ScaleTransition(
            scale: _scaleAnimation,
            child: Icon(
              _isLiked ? Icons.favorite : Icons.favorite_border_outlined,
              size: 32,
              color: _isLiked ? Colors.red : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildParticles() {
    final particles = <Widget>[];
    const particleCount = 8;

    for (int i = 0; i < particleCount; i++) {
      final angle = (2 * math.pi / particleCount) * i;
      final distance = 50.0;

      particles.add(
        Positioned(
          child: ScaleTransition(
            scale: Tween<double>(begin: 1.0, end: 0.0).animate(
              CurvedAnimation(parent: _particleController, curve: Curves.easeOut),
            ),
            child: Opacity(
              opacity: Tween<double>(begin: 1.0, end: 0.0).evaluate(
                CurvedAnimation(parent: _particleController, curve: Curves.easeOut),
              ),
              child: Transform.translate(
                offset: Offset(
                  distance * math.cos(angle),
                  distance * math.sin(angle),
                ),
                child: const Icon(
                  Icons.favorite,
                  size: 12,
                  color: Colors.red,
                ),
              ),
            ),
          ),
        ),
      );
    }

    return particles;
  }
}
