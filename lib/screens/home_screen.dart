import 'dart:ui';

import 'package:flutter/material.dart';

import 'credits_screen.dart';
import 'story_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF3A1F25),
              Color(0xFF402028),
              Color(0xFF2A171D),
            ],
          ),
        ),
        child: Stack(
          children: [
            const _BackgroundMood(),
            SafeArea(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final width = constraints.maxWidth;
                  final isDesktop = width >= 1100;
                  final isTablet = width >= 760 && width < 1100;

                  final maxContentWidth = isDesktop
                      ? 1200.0
                      : isTablet
                          ? 860.0
                          : 560.0;

                  final titleSize = isDesktop ? 60.0 : isTablet ? 50.0 : 44.0;

                  return Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: maxContentWidth),
                      child: SingleChildScrollView(
                        padding: EdgeInsets.symmetric(
                          horizontal: isDesktop ? 28 : 20,
                          vertical: 12,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            _TopBar(
                              isDesktop: isDesktop,
                              onSettingsTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Settings is coming soon.'),
                                  ),
                                );
                              },
                            ),
                            SizedBox(height: isDesktop ? 28 : 22),
                            if (isDesktop)
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 11,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        const _BookHeroCard(isCompact: false),
                                        const SizedBox(height: 22),
                                        Text(
                                          'The Flashback of\nsyndrayaka',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: const Color(0xFFF3E7D8),
                                            fontSize: titleSize,
                                            height: 1.03,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 28),
                                  Expanded(
                                    flex: 10,
                                    child: _MenuPanel(
                                      isCompact: false,
                                      onStartTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute<void>(
                                            builder: (_) => const StoryScreen(),
                                          ),
                                        );
                                      },
                                      onContinueTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute<void>(
                                            builder: (_) => const StoryScreen(initialTab: 1),
                                          ),
                                        );
                                      },
                                      onCreditsTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute<void>(
                                            builder: (_) => const CreditsScreen(),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              )
                            else ...[
                              _BookHeroCard(isCompact: !isTablet),
                              const SizedBox(height: 18),
                              Text(
                                'The Flashback of\nsyndrayaka',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: const Color(0xFFF3E7D8),
                                  fontSize: titleSize,
                                  height: 1.05,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: isTablet ? 24 : 18),
                              _MenuPanel(
                                isCompact: !isTablet,
                                onStartTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute<void>(
                                      builder: (_) => const StoryScreen(),
                                    ),
                                  );
                                },
                                onContinueTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute<void>(
                                            builder: (_) => const StoryScreen(initialTab: 1),
                                          ),
                                        );
                                      },
                                onCreditsTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute<void>(
                                      builder: (_) => const CreditsScreen(),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuPanel extends StatelessWidget {
  const _MenuPanel({
    required this.isCompact,
    required this.onStartTap,
    required this.onContinueTap,
    required this.onCreditsTap,
  });

  final bool isCompact;
  final VoidCallback onStartTap;
  final VoidCallback onContinueTap;
  final VoidCallback onCreditsTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _MenuActionTile(
          title: 'Start New Story',
          leadingIcon: Icons.note_alt_outlined,
          trailingIcon: Icons.chevron_right,
          onTap: onStartTap,
          isCompact: isCompact,
        ),
        SizedBox(height: isCompact ? 12 : 16),
        _MenuActionTile(
          title: 'Continue Story',
          leadingIcon: Icons.play_arrow_rounded,
          trailingIcon: Icons.history,
          isLight: true,
          onTap: onContinueTap,
          isCompact: isCompact,
        ),
        SizedBox(height: isCompact ? 12 : 16),
        _MenuActionTile(
          title: 'Credits',
          leadingIcon: Icons.info,
          trailingIcon: Icons.groups_rounded,
          isMuted: true,
          onTap: onCreditsTap,
          isCompact: isCompact,
        ),
      ],
    );
  }
}

class _BackgroundMood extends StatelessWidget {
  const _BackgroundMood();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: const Alignment(-0.5, -0.8),
                radius: 1.2,
                colors: [const Color(0x99AA4A5B), Colors.transparent],
              ),
            ),
          ),
        ),
        Positioned(
          left: -80,
          top: 180,
          child: _GlowBlob(size: 220, color: const Color(0x66A95A49)),
        ),
        Positioned(
          right: -90,
          top: 380,
          child: _GlowBlob(size: 240, color: const Color(0x554C5DA5)),
        ),
        Positioned(
          left: 90,
          bottom: -40,
          child: _GlowBlob(size: 180, color: const Color(0x446E3D4C)),
        ),
      ],
    );
  }
}

class _GlowBlob extends StatelessWidget {
  const _GlowBlob({required this.size, required this.color});

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaX: 42, sigmaY: 42),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar({required this.onSettingsTap, required this.isDesktop});

  final VoidCallback onSettingsTap;
  final bool isDesktop;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.menu_book_rounded,
          color: const Color(0xFFF3E7D8),
          size: isDesktop ? 40 : 34,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            'The Flashback of syndrayaka',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: const Color(0xFFF3E7D8),
              fontSize: isDesktop ? 28 : 22,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        IconButton(
          onPressed: onSettingsTap,
          icon: Icon(
            Icons.settings,
            color: const Color(0xFFF3E7D8),
            size: isDesktop ? 40 : 36,
          ),
        ),
      ],
    );
  }
}

class _BookHeroCard extends StatelessWidget {
  const _BookHeroCard({required this.isCompact});

  final bool isCompact;

  @override
  Widget build(BuildContext context) {
    final cardRadius = isCompact ? 22.0 : 26.0;
    final iconBoxSize = isCompact ? 116.0 : 148.0;
    final iconSize = isCompact ? 54.0 : 68.0;

    return AspectRatio(
      aspectRatio: isCompact ? 0.90 : 0.84,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(cardRadius),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF2A231F), Color(0xFF1B1816)],
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x99000000),
              blurRadius: 24,
              offset: Offset(0, 14),
            ),
          ],
          border: Border.all(color: const Color(0x44B89E7A), width: 1),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF3A322D), Color(0xFF201C19)],
                  ),
                  border: Border.all(color: const Color(0x448A735C), width: 1.2),
                ),
              ),
            ),
            Positioned(
              left: 18,
              top: 14,
              bottom: 14,
              child: Container(width: 9, color: const Color(0xFF1A1715)),
            ),
            Center(
              child: Container(
                width: iconBoxSize,
                height: iconBoxSize,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(38),
                  color: const Color(0x664A332E),
                  border: Border.all(color: const Color(0x66C6B195), width: 1),
                ),
                child: Icon(
                  Icons.menu_book_rounded,
                  color: const Color(0xFFF3E7D8),
                  size: iconSize,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuActionTile extends StatelessWidget {
  const _MenuActionTile({
    required this.title,
    required this.leadingIcon,
    required this.trailingIcon,
    required this.onTap,
    required this.isCompact,
    this.isLight = false,
    this.isMuted = false,
  });

  final String title;
  final IconData leadingIcon;
  final IconData trailingIcon;
  final VoidCallback onTap;
  final bool isCompact;
  final bool isLight;
  final bool isMuted;

  @override
  Widget build(BuildContext context) {
    final bgColor = isLight
        ? const Color(0xFFF1E8DA)
        : isMuted
            ? const Color(0xFFBFB0AA)
            : const Color(0x55311F27);
    final textColor = isLight ? const Color(0xFF3A1F1E) : const Color(0xFFF1E8DA);
    final iconBoxColor = isLight ? const Color(0xFFE3D5C4) : const Color(0x44FFFFFF);

    final tilePadding = isCompact ? 12.0 : 14.0;
    final iconBoxSize = isCompact ? 50.0 : 58.0;
    final iconSize = isCompact ? 30.0 : 34.0;
    final textSize = isCompact ? 20.0 : 22.0;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: onTap,
        child: Ink(
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: tilePadding),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: const Color(0x22FFFFFF), width: 1),
            boxShadow: const [
              BoxShadow(
                color: Color(0x22000000),
                blurRadius: 12,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: iconBoxSize,
                height: iconBoxSize,
                decoration: BoxDecoration(
                  color: iconBoxColor,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Icon(leadingIcon, color: textColor, size: iconSize),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    color: textColor,
                    fontSize: textSize,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Icon(
                trailingIcon,
                color: textColor.withValues(alpha: 0.7),
                size: isCompact ? 30 : 32,
              ),
            ],
          ),
        ),
      ),
    );
  }
}




