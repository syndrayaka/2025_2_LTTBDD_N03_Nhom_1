import 'package:flutter/material.dart';
import 'package:flutter/painting.dart' show applyBoxFit;

import 'credits_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const Size _sourceImageSize = Size(1536, 1024);
  static const double _iconBoxSizeInSource = 130;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/backgrounds/menu.png', fit: BoxFit.cover),
          Container(color: Colors.black.withValues(alpha: 0.08)),
          SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final fullOutput = Offset.zero & constraints.biggest;
                final fitted = applyBoxFit(
                  BoxFit.cover,
                  _sourceImageSize,
                  constraints.biggest,
                );
                final sourceRect = Alignment.center.inscribe(
                  fitted.source,
                  Offset.zero & _sourceImageSize,
                );
                final outputRect = Alignment.center.inscribe(
                  fitted.destination,
                  fullOutput,
                );

                return Stack(
                  children: [
                    _IconLabelHotspot(
                      centerInSource: const Offset(350, 370),
                      sourceRect: sourceRect,
                      outputRect: outputRect,
                      sourceIconSize: _iconBoxSizeInSource,
                      label: 'Start New Story',
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Start New Story clicked'),
                          ),
                        );
                      },
                    ),
                    _IconLabelHotspot(
                      centerInSource: const Offset(350, 530),
                      sourceRect: sourceRect,
                      outputRect: outputRect,
                      sourceIconSize: _iconBoxSizeInSource,
                      label: 'Continue Your Saved Story',
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Continue Saved Game clicked'),
                          ),
                        );
                      },
                    ),
                    _IconLabelHotspot(
                      centerInSource: const Offset(350, 700),
                      sourceRect: sourceRect,
                      outputRect: outputRect,
                      sourceIconSize: _iconBoxSizeInSource,
                      label: 'Credits',
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (_) => const CreditsScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _IconLabelHotspot extends StatelessWidget {
  const _IconLabelHotspot({
    required this.centerInSource,
    required this.sourceRect,
    required this.outputRect,
    required this.sourceIconSize,
    required this.label,
    required this.onTap,
  });

  final Offset centerInSource;
  final Rect sourceRect;
  final Rect outputRect;
  final double sourceIconSize;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final scaleX = outputRect.width / sourceRect.width;
    final scaleY = outputRect.height / sourceRect.height;

    final iconCenter = Offset(
      outputRect.left + (centerInSource.dx - sourceRect.left) * scaleX,
      outputRect.top + (centerInSource.dy - sourceRect.top) * scaleY,
    );

    final iconWidth = sourceIconSize * scaleX;
    final iconHeight = sourceIconSize * scaleY;
    final textWidth = 240 * scaleX;

    return Positioned(
      left: iconCenter.dx - textWidth / 2,
      top: iconCenter.dy - iconHeight / 2,
      child: SizedBox(
        width: textWidth,
        child: Column(
          children: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: onTap,
              child: SizedBox(width: iconWidth, height: iconHeight),
            ),
            SizedBox(height: 6 * scaleY),
            GestureDetector(
              onTap: onTap,
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.96),
                  fontSize: (20 * scaleX).clamp(12, 22),
                  fontWeight: FontWeight.w700,
                  shadows: const [
                    Shadow(color: Colors.black87, blurRadius: 10),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
