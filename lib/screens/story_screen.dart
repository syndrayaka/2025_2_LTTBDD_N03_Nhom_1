import 'package:flutter/material.dart';

class StoryScreen extends StatefulWidget {
  const StoryScreen({super.key, this.initialTab = 0});

  final int initialTab;

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  static const String _fullStory =
      'The air grows heavy with the scent of damp earth and crushed nightshade. '
      'Before you stands the threshold of the Whispering Woods, where the shadows '
      'move with a life of their own. The Grimoire in your satchel pulses with a '
      'rhythmic warmth, its ink-stained pages seemingly eager for the choices yet '
      'to be inscribed.\n\n'
      'To your left, a narrow path winds through the gnarled roots, disappearing '
      'into a silver mist. To your right, the silhouette of a stone hut clings to '
      'the hillside, the dwelling of the Elder, whose knowledge of the forest is '
      'said to be as deep as the roots themselves.\n\n'
      'A sudden chill grips your heart as a low growl echoes from the darkness. '
      'You reach for your belt, feeling the cold iron of your torch. The story '
      'awaits your ink.';

  final ScrollController _scrollController = ScrollController();
  late int _currentTab;
  bool _canScrollMore = true;
  String _typedStory = '';
  bool _isTyping = false;

  @override
  void initState() {
    super.initState();
    _currentTab = widget.initialTab.clamp(0, 2);
    _scrollController.addListener(_handleScroll);
    _startTypewriter();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_handleScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _handleScroll() {
    if (!_scrollController.hasClients) {
      return;
    }
    final atBottom =
        _scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 6;
    final nextCanScrollMore = !atBottom;
    if (nextCanScrollMore == _canScrollMore) {
      return;
    }
    setState(() {
      _canScrollMore = nextCanScrollMore;
    });
  }

  Future<void> _scrollByStep() async {
    if (!_scrollController.hasClients) {
      return;
    }

    final viewport = _scrollController.position.viewportDimension;
    final current = _scrollController.offset;
    final maxOffset = _scrollController.position.maxScrollExtent;

    final target = _canScrollMore
        ? (current + viewport * 0.72).clamp(0.0, maxOffset)
        : (current - viewport * 0.72).clamp(0.0, maxOffset);

    await _scrollController.animateTo(
      target,
      duration: const Duration(milliseconds: 460),
      curve: Curves.easeOutCubic,
    );
  }

  Future<void> _startTypewriter() async {
    if (_isTyping || _typedStory.length >= _fullStory.length) {
      return;
    }

    _isTyping = true;
    for (var i = _typedStory.length + 1; i <= _fullStory.length; i++) {
      if (!mounted) {
        return;
      }
      setState(() {
        _typedStory = _fullStory.substring(0, i);
      });
      await Future<void>.delayed(const Duration(milliseconds: 12));
    }
    _isTyping = false;
  }

  void _onTabChanged(int index) {
    if (_currentTab == index) {
      return;
    }
    setState(() {
      _currentTab = index;
    });

    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 260),
      curve: Curves.easeOutCubic,
    );

    if (index == 0) {
      _startTypewriter();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5EFEA),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Scrollbar(
                    controller: _scrollController,
                    thumbVisibility: true,
                    radius: const Radius.circular(10),
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 110),
                      child: Center(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 760),
                          child: _StoryBody(
                            tab: _currentTab,
                            typedStory: _typedStory,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                _BottomStoryTabs(
                  currentTab: _currentTab,
                  onChanged: _onTabChanged,
                ),
              ],
            ),
            Positioned(
              right: 16,
              bottom: 96,
              child: FloatingActionButton.small(
                heroTag: 'story-scroll',
                onPressed: _scrollByStep,
                backgroundColor: const Color(0xFFEBDDCB),
                foregroundColor: const Color(0xFF503236),
                child: Icon(
                  _canScrollMore
                      ? Icons.keyboard_arrow_down
                      : Icons.keyboard_arrow_up,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StoryBody extends StatelessWidget {
  const _StoryBody({required this.tab, required this.typedStory});

  final int tab;
  final String typedStory;

  @override
  Widget build(BuildContext context) {
    switch (tab) {
      case 1:
        return const _HistoryView();
      case 2:
        return const _BookmarksView();
      default:
        return _GrimoireView(typedStory: typedStory);
    }
  }
}

class _TopStoryBar extends StatelessWidget {
  const _TopStoryBar({required this.onMenuTap, required this.onSettingsTap});

  final VoidCallback onMenuTap;
  final VoidCallback onSettingsTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: onMenuTap,
          icon: const Icon(Icons.menu, size: 30, color: Color(0xFF4A3131)),
        ),
        const Expanded(
          child: Text(
            'The Flashback of\nSyndrayaka',
            style: TextStyle(
              color: Color(0xFF2C1518),
              fontSize: 28,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        IconButton(
          onPressed: onSettingsTap,
          icon: const Icon(Icons.settings, size: 30, color: Color(0xFF4A3131)),
        ),
      ],
    );
  }
}

class _GrimoireView extends StatelessWidget {
  const _GrimoireView({required this.typedStory});

  final String typedStory;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _TopStoryBar(
          onMenuTap: () => Navigator.of(context).pop(),
          onSettingsTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Settings is coming soon.')),
            );
          },
        ),
        const SizedBox(height: 28),
        const Icon(Icons.wb_sunny_outlined, size: 30, color: Color(0x99816D5E)),
        const SizedBox(height: 20),
        const Text(
          'The Whisper of the\nAncient Oak',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF3A1E22),
            fontSize: 60,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.italic,
            height: 1.04,
          ),
        ),
        const SizedBox(height: 24),
        _TypedStoryBlock(text: typedStory),
        const SizedBox(height: 28),
        ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Image.asset(
            'assets/backgrounds/chapterscreen.png',
            fit: BoxFit.cover,
            height: 300,
          ),
        ),
        const SizedBox(height: 44),
        const _SectionLabel(text: 'DECIDE THY FATE'),
        const SizedBox(height: 24),
        _ChoiceCard(
          icon: Icons.forest,
          text: 'Venture into the Woods',
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Choice selected: Venture into the Woods'),
              ),
            );
          },
        ),
        const SizedBox(height: 16),
        _ChoiceCard(
          icon: Icons.menu_book_rounded,
          text: 'Consult the Elder',
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Choice selected: Consult the Elder'),
              ),
            );
          },
        ),
        const SizedBox(height: 16),
        _ChoiceCard(
          icon: Icons.local_fire_department,
          text: 'Ignite the Torch',
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Choice selected: Ignite the Torch'),
              ),
            );
          },
        ),
      ],
    );
  }
}

class _TypedStoryBlock extends StatelessWidget {
  const _TypedStoryBlock({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    if (text.isEmpty) {
      return const SizedBox.shrink();
    }

    final first = text.substring(0, 1);
    final rest = text.substring(1);

    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: first,
            style: const TextStyle(
              color: Color(0xFF9D2E43),
              fontSize: 74,
              fontWeight: FontWeight.w700,
              height: 1,
            ),
          ),
          TextSpan(
            text: rest,
            style: const TextStyle(
              color: Color(0xFF2F2325),
              fontSize: 21,
              height: 1.55,
            ),
          ),
        ],
      ),
    );
  }
}

class _HistoryView extends StatelessWidget {
  const _HistoryView();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _TopStoryBar(
          onMenuTap: () => Navigator.of(context).pop(),
          onSettingsTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Settings is coming soon.')),
            );
          },
        ),
        const SizedBox(height: 18),
        const Text(
          'Past Fates',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF3A1E22),
            fontSize: 56,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'A record of your journey through the shadows of\nSyndrayaka.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xAA6D5851),
            fontSize: 16,
            fontStyle: FontStyle.italic,
          ),
        ),
        const SizedBox(height: 28),
        const _HistoryEntry(
          chapter: 'CHAPTER I: THE VEILED ARRIVAL',
          title: 'The Crossroads of Echoes',
          decision: '"I chose to enter the Silver Grove without an offering."',
          outcome:
              'The spirits whispered of your insolence, but the Grove itself seemed curious. '
              'You gained the Mark of the Unbidden, but lost 10 points of Affinity with the Elder Tree.',
          icon: Icons.park,
        ),
        const SizedBox(height: 26),
        const _HistoryEntry(
          chapter: 'CHAPTER II: SILENT WHISPERS',
          title: 'The Midnight Archive',
          decision: '"I decided to steal the Forbidden Scroll of Syndra."',
          outcome:
              'The ink stained your fingers permanently. You now possess the ancient knowledge, '
              'but the Archive Sentinels are forever hunting your scent through time.',
          icon: Icons.hourglass_bottom,
        ),
        const SizedBox(height: 26),
        const _HistoryEntry(
          chapter: 'CHAPTER III: BLOOD & PARCHMENT',
          title: 'The Crimson Feast',
          decision: '"I shared my blood to break the curse."',
          outcome:
              'A heavy price paid. The villagers are free, but your connection to the physical '
              'realm has grown thin. You are now half-ghost, gaining the ability Ethereal Step.',
          icon: Icons.bookmark,
        ),
        const SizedBox(height: 18),
        const Icon(Icons.fingerprint, color: Color(0x886D5851), size: 30),
        const SizedBox(height: 8),
        const Text(
          'End of current records',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0x886D5851),
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }
}

class _BookmarksView extends StatelessWidget {
  const _BookmarksView();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _TopStoryBar(
          onMenuTap: () => Navigator.of(context).pop(),
          onSettingsTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Settings is coming soon.')),
            );
          },
        ),
        const SizedBox(height: 18),
        const Text(
          'Enchanted\nMarkers',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF3A1E22),
            fontSize: 54,
            fontWeight: FontWeight.w700,
            height: 1.02,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Your path through the living\ngrimoire',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xAA6D5851),
            fontSize: 16,
            fontStyle: FontStyle.italic,
          ),
        ),
        const SizedBox(height: 24),
        const _BookmarkCard(
          title: 'The Whispering Archive',
          date: 'Saved on Oct 24, 1892',
          excerpt:
              '"The scent of dust and old ink was overwhelming as the shelves began to..."',
          imageAsset: 'assets/backgrounds/chapterscreen.png',
          icon: Icons.auto_stories,
        ),
        const SizedBox(height: 22),
        const _BookmarkCard(
          title: 'Thirteen Strokes',
          date: 'Saved on Nov 02, 1892',
          excerpt:
              '"Time itself seemed to fracture as the great clock struck a thirteenth hour..."',
          imageAsset: 'assets/backgrounds/menu.png',
          icon: Icons.hourglass_top,
        ),
        const SizedBox(height: 22),
        const _BookmarkCard(
          title: 'Veil of the Woods',
          date: 'Saved on Dec 15, 1892',
          excerpt:
              '"The blue bioluminescence guided our path, each step sinking into moss that felt..."',
          imageAsset: 'assets/backgrounds/storytextfield.png',
          icon: Icons.spa,
        ),
        const SizedBox(height: 22),
        const Icon(Icons.bookmark_border, color: Color(0x886D5851), size: 30),
        const SizedBox(height: 8),
        const Text(
          'Press the silk ribbon icon during your journey\nto capture an echo of your current location.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0x886D5851),
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }
}

class _HistoryEntry extends StatelessWidget {
  const _HistoryEntry({
    required this.chapter,
    required this.title,
    required this.decision,
    required this.outcome,
    required this.icon,
  });

  final String chapter;
  final String title;
  final String decision;
  final String outcome;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 8),
          width: 34,
          height: 34,
          decoration: BoxDecoration(
            color: const Color(0xFFE8DBCB),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, size: 18, color: const Color(0xFF593231)),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                chapter,
                style: const TextStyle(
                  color: Color(0xFF9D2E43),
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.1,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                title,
                style: const TextStyle(
                  color: Color(0xFF2D181B),
                  fontSize: 44,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: const Color(0xFFF0E6DA),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Your Decision:',
                      style: TextStyle(
                        color: Color(0xAA6D5851),
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    Text(
                      decision,
                      style: const TextStyle(
                        color: Color(0xFF9D2E43),
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                        height: 1.3,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'The Outcome:',
                      style: TextStyle(
                        color: Color(0xAA6D5851),
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    Text(
                      outcome,
                      style: const TextStyle(
                        color: Color(0xFF2D181B),
                        fontSize: 16,
                        height: 1.45,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _BookmarkCard extends StatelessWidget {
  const _BookmarkCard({
    required this.title,
    required this.date,
    required this.excerpt,
    required this.imageAsset,
    required this.icon,
  });

  final String title;
  final String date;
  final String excerpt;
  final String imageAsset;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFEEE2D2),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0x22A57F67)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image.asset(
                  imageAsset,
                  height: 230,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              Positioned(
                right: 10,
                top: 0,
                child: Container(
                  width: 26,
                  height: 34,
                  decoration: const BoxDecoration(
                    color: Color(0xFF9D2E43),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(4),
                      bottomRight: Radius.circular(4),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: const Color(0xFF7D2A38),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x33000000),
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Icon(
                        icon,
                        color: const Color(0xFFF6ECE1),
                        size: 22,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF2D181B),
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  date,
                  style: const TextStyle(
                    color: Color(0xAA6D5851),
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  excerpt,
                  style: const TextStyle(
                    color: Color(0xCC4A3434),
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Opening "$title"...')),
                      );
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xFF5B2A2E),
                      foregroundColor: const Color(0xFFF4EBDD),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('Return to this Moment  �'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(color: Color(0x22A48774))),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Text(
            text,
            style: const TextStyle(
              color: Color(0xAA8A6A58),
              fontSize: 16,
              letterSpacing: 3,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const Expanded(child: Divider(color: Color(0x22A48774))),
      ],
    );
  }
}

class _ChoiceCard extends StatelessWidget {
  const _ChoiceCard({
    required this.icon,
    required this.text,
    required this.onTap,
  });

  final IconData icon;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Ink(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          decoration: BoxDecoration(
            color: const Color(0xFFEEE2D2),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: const Color(0x22A57F67)),
          ),
          child: Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: const Color(0xFF8D2137),
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x33000000),
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Icon(icon, color: const Color(0xFFF6ECE1), size: 28),
              ),
              const SizedBox(width: 18),
              Expanded(
                child: Text(
                  text,
                  style: const TextStyle(
                    color: Color(0xFF2D181B),
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
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

class _BottomStoryTabs extends StatelessWidget {
  const _BottomStoryTabs({required this.currentTab, required this.onChanged});

  final int currentTab;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
      decoration: const BoxDecoration(
        color: Color(0xFFF5EFEA),
        border: Border(top: BorderSide(color: Color(0x22A48774))),
      ),
      child: Row(
        children: [
          Expanded(
            child: _TabButton(
              icon: Icons.menu_book_rounded,
              label: 'Grimoire',
              active: currentTab == 0,
              onTap: () => onChanged(0),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: _TabButton(
              icon: Icons.history_edu,
              label: 'History',
              active: currentTab == 1,
              onTap: () => onChanged(1),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: _TabButton(
              icon: Icons.bookmark,
              label: 'Bookmarks',
              active: currentTab == 2,
              onTap: () => onChanged(2),
            ),
          ),
        ],
      ),
    );
  }
}

class _TabButton extends StatelessWidget {
  const _TabButton({
    required this.icon,
    required this.label,
    required this.active,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      child: Ink(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: active ? const Color(0xFFE8DBCB) : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 22,
              color: active ? const Color(0xFF2A171D) : const Color(0x8A5E4A4A),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                color: active
                    ? const Color(0xFF2A171D)
                    : const Color(0x8A5E4A4A),
                fontSize: 12,
                fontWeight: active ? FontWeight.w700 : FontWeight.w500,
                letterSpacing: 0.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
