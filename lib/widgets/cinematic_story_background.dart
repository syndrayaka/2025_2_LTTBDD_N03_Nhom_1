import 'dart:math' as math;

import 'package:flutter/material.dart';

class CinematicStoryBackground extends StatefulWidget {
  const CinematicStoryBackground({super.key});

  @override
  State<CinematicStoryBackground> createState() =>
      _CinematicStoryBackgroundState();
}

class _CinematicStoryBackgroundState extends State<CinematicStoryBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final List<_Particle> _particles;

  @override
  void initState() {
    super.initState();
    final random = math.Random(2026);
    _particles = List<_Particle>.generate(
      48,
      (_) => _Particle(
        x: random.nextDouble(),
        y: random.nextDouble(),
        radius: 1.0 + random.nextDouble() * 2.8,
        speed: 0.015 + random.nextDouble() * 0.035,
        sway: random.nextDouble() * math.pi * 2,
        alpha: 0.18 + random.nextDouble() * 0.4,
      ),
    );

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 18),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return CustomPaint(
          painter: _CinematicBackgroundPainter(
            t: _controller.value,
            particles: _particles,
          ),
          child: Container(),
        );
      },
    );
  }
}

class _Particle {
  const _Particle({
    required this.x,
    required this.y,
    required this.radius,
    required this.speed,
    required this.sway,
    required this.alpha,
  });

  final double x;
  final double y;
  final double radius;
  final double speed;
  final double sway;
  final double alpha;
}

class _CinematicBackgroundPainter extends CustomPainter {
  const _CinematicBackgroundPainter({required this.t, required this.particles});

  final double t;
  final List<_Particle> particles;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final shift = (math.sin(t * math.pi * 2) + 1) / 2;

    final top = Color.lerp(
      const Color(0xFF090B13),
      const Color(0xFF0F1426),
      shift,
    )!;
    final mid = Color.lerp(
      const Color(0xFF1B0F1D),
      const Color(0xFF0B2A33),
      shift,
    )!;
    final bottom = Color.lerp(
      const Color(0xFF2C0B10),
      const Color(0xFF1D1029),
      shift,
    )!;

    final bgPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [top, mid, bottom],
        stops: const [0.05, 0.5, 1.0],
      ).createShader(rect);

    canvas.drawRect(rect, bgPaint);

    final beamPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: const [
          Color(0x00000000),
          Color(0x55FF3D2E),
          Color(0x2200E5FF),
          Color(0x00000000),
        ],
        stops: const [0.0, 0.28, 0.72, 1.0],
        transform: GradientRotation((-0.22 + t * 0.44) * math.pi),
      ).createShader(rect)
      ..blendMode = BlendMode.screen;
    canvas.drawRect(rect, beamPaint);

    for (final p in particles) {
      final x = ((p.x + t * p.speed + math.sin((t * 10) + p.sway) * 0.02) % 1) *
          size.width;
      final y = ((p.y - t * p.speed * 0.55) % 1) * size.height;
      final pulse = 0.6 + 0.4 * math.sin((t * math.pi * 2 * 1.5) + p.sway);

      final particlePaint = Paint()
        ..color = Color.lerp(
          const Color(0xFFFF5A45),
          const Color(0xFF5FDFFF),
          (math.sin(p.sway + t * math.pi * 2) + 1) / 2,
        )!
            .withValues(alpha: (p.alpha * pulse).clamp(0.0, 1.0));

      canvas.drawCircle(Offset(x, y), p.radius * pulse, particlePaint);
    }

    final vignette = Paint()
      ..shader = RadialGradient(
        center: Alignment.center,
        radius: 0.92,
        colors: const [Color(0x00000000), Color(0xCC000000)],
        stops: const [0.58, 1.0],
      ).createShader(rect);
    canvas.drawRect(rect, vignette);
  }

  @override
  bool shouldRepaint(covariant _CinematicBackgroundPainter oldDelegate) {
    return oldDelegate.t != t || oldDelegate.particles != particles;
  }
}
