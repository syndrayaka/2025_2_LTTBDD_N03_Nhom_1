import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../l10n/app_localizations.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  VideoPlayerController? _controller;
  bool _didNavigate = false;
  bool _hasError = false;
  bool _hasStarted = !kIsWeb;

  @override
  void initState() {
    super.initState();
    _initVideo();
  }

  Future<void> _initVideo() async {
    final candidates = <String>[
      if (kIsWeb) 'assets/videos/rog_ally_for_those_who_dare.webm',
      'assets/videos/rog_ally_for_those_who_dare.mp4',
    ];

    for (final assetPath in candidates) {
      final candidate = VideoPlayerController.asset(assetPath);
      try {
        await candidate.initialize();
        await candidate.setLooping(false);
        await candidate.setVolume(1.0);

        _controller = candidate;
        _controller!.addListener(_handleVideoState);

        if (!mounted) {
          return;
        }

        setState(() {});

        if (_hasStarted) {
          await _controller!.play();
        }
        return;
      } catch (_) {
        await candidate.dispose();
      }
    }

    if (!mounted) {
      return;
    }

    setState(() {
      _hasError = true;
    });
  }

  Future<void> _startApplication() async {
    final controller = _controller;
    if (controller == null || !controller.value.isInitialized || _hasStarted) {
      return;
    }

    try {
      await controller.setVolume(1.0);
      await controller.play();
      if (!mounted) {
        return;
      }
      setState(() {
        _hasStarted = true;
      });
    } catch (_) {
      if (!mounted) {
        return;
      }
      setState(() {
        _hasError = true;
      });
    }
  }

  void _handleVideoState() {
    final controller = _controller;
    if (controller == null || _didNavigate || !controller.value.isInitialized) {
      return;
    }

    final position = controller.value.position;
    final duration = controller.value.duration;

    if (duration > Duration.zero && position >= duration) {
      _didNavigate = true;
      if (!mounted) {
        return;
      }
      Navigator.of(context).pushReplacement(
        MaterialPageRoute<void>(builder: (_) => const HomeScreen()),
      );
    }
  }

  @override
  void dispose() {
    _controller?.removeListener(_handleVideoState);
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final controller = _controller;

    if (_hasError) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Text(
            l10n.splashError,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          if (controller != null && controller.value.isInitialized)
            Center(
              child: AspectRatio(
                aspectRatio: controller.value.aspectRatio,
                child: VideoPlayer(controller),
              ),
            ),
          if (!_hasStarted)
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: _startApplication,
              child: Container(
                color: Colors.black,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  controller == null || !controller.value.isInitialized
                      ? l10n.loadingBoot
                      : l10n.tapToStart,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
