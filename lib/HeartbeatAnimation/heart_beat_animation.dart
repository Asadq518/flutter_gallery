import 'package:flutter/material.dart';

class HeartBeatAnimation extends StatefulWidget {
  const HeartBeatAnimation({super.key});

  @override
  State<HeartBeatAnimation> createState() => _HeartBeatAnimation();
}

class _HeartBeatAnimation extends State<HeartBeatAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation scaleAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    )..repeat(reverse: true);
    scaleAnimation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.bounceOut,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: scaleAnimation,
            child: const Center(
              child: Icon(
                Icons.favorite,
                size: 50,
                color: Color(0xFFFF5757),
              ),
            ),
            builder: (context, child) {
              return Transform.scale(
                scale: 1.0 + scaleAnimation.value * 2,
                child: child,
              );
            },
          ),
        ],
      ),
    );
  }
}
