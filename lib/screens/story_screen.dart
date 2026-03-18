import 'package:flutter/material.dart';

class StoryScreen extends StatefulWidget {
  const StoryScreen({super.key, this.initialTab = 0});

  final int initialTab;

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  static const String _chapter0Title =
      'Chapter 0: Prologue - The Distance Between Us';
  static const String _chapter1Title = 'Chapter 1 - After Time Has Passed';

  static const String _chapter0Story =
      'The first time you saw her... it wasn\'t anything special.\n\n'
      'No dramatic moment. No cinematic lighting. No music playing in the background.\n\n'
      'Just an ordinary afternoon.\n\n'
      'You walked into the classroom, scanning for a familiar seat, when your eyes happened to meet someone else\'s.\n\n'
      'She was sitting by the window.\n\n'
      'Her hair tied loosely, her gaze drifting outside. Sunlight slipped through the glass, resting gently on her face in a way that felt... quiet.\n\n'
      'You looked for a few seconds.\n\n'
      'Then you looked away.\n\n'
      'And that was it.\n\n'
      'Or at least... that\'s what you thought.\n\n'
      'Time passed.\n\n'
      'The two of you started talking just a little. Simple greetings, occasional questions about homework, short conversations that didn\'t really lead anywhere.\n\n'
      'Nothing clear.\n\n'
      'Nothing you could name.\n\n'
      'Until one day.\n\n'
      'You heard that she had broken up with her boyfriend.\n\n'
      'No drama. No noise. Just... an ending.\n\n'
      'She still came to class like usual. Still talked. Still smiled.\n\n'
      'But something had changed.\n\n'
      'And somehow... you found yourself paying more attention.\n\n'
      'Not because she was single now.\n\n'
      'But because you realized at some point, without noticing you had gotten used to her being there.\n\n'
      'Your conversations became longer.\n\n'
      'Messages started to go beyond just schoolwork.\n\n'
      'You began to notice the small things--how she laughed when she felt comfortable, the pauses when she chose not to say anything, the way silence between you didn\'t feel awkward anymore.\n\n'
      'The distance between you... was slowly fading.\n\n'
      'Naturally.\n\n'
      'Dangerously.\n\n'
      'And then one day, a thought hit you.\n\n'
      'If you don\'t do anything now...\n\n'
      'This might be as far as it ever goes.\n\n'
      'Not moving forward.\n\n'
      'But never disappearing either.\n\n'
      'Just... something that almost happened.\n\n'
      'You stare at your phone screen.\n\n'
      'Her name is right there.\n\n'
      'One message.\n\n'
      'One sentence.\n\n'
      'That\'s all it takes to change everything.\n\n'
      'Or lose it.';

  static const String _confessDirectlyStory =
      'You stare at the screen for a long time.\n\n'
      'Then, before you can stop yourself--\n\n'
      '"I think... I like you."\n\n'
      'Sent.\n\n'
      'Everything goes quiet.\n\n'
      'Too quiet.\n\n'
      'You wait.\n\n'
      'And wait.\n\n'
      'When her reply finally comes, it\'s not immediate.\n\n'
      'Not rushed.\n\n'
      'Which somehow makes it feel... heavier.\n\n'
      '"I didn\'t expect that."\n\n'
      'A pause.\n\n'
      'Then another message.\n\n'
      '"Can I think about it a bit?"\n\n'
      'You tell her it\'s okay.\n\n'
      'Of course it is.\n\n'
      'What else could you say?\n\n'
      'Hours pass.\n\n'
      'You try to distract yourself, but your mind keeps circling back.\n\n'
      'Every possible outcome plays out in your head.\n\n'
      'None of them feel real.\n\n'
      'That night--\n\n'
      'Your phone lights up again.\n\n'
      '"I\'m really sorry..."\n\n'
      'Your chest tightens.\n\n'
      'You already know what comes next.\n\n'
      '"I don\'t think I can see you that way."\n\n'
      '"You\'re important to me, but... not like that."\n\n'
      'There\'s no cruelty in her words.\n\n'
      'No coldness.\n\n'
      'Just honesty.\n\n'
      'And that somehow hurts more.\n\n'
      'You stare at the message for a long time.\n\n'
      'Typing something.\n\n'
      'Deleting it.\n\n'
      'Typing again.\n\n'
      '"It\'s okay."\n\n'
      'A lie, maybe.\n\n'
      'But also the only answer you have.\n\n'
      'Nothing changes immediately.\n\n'
      'And yet--\n\n'
      'Everything already has.\n\n'
      '-End of Chapter-';

  static const String _takeStepCloserStory =
      'You hesitate.\n\n'
      'Then type--\n\n'
      '"Are you free this weekend?"\n\n'
      'She replies faster than you expected.\n\n'
      '"Hmm? For what?"\n\n'
      'You pause.\n\n'
      'Then send--\n\n'
      '"Just... hanging out. If you want."\n\n'
      'A few seconds.\n\n'
      'Then--\n\n'
      '"Okay."\n\n'
      'It\'s simple.\n\n'
      'Too simple.\n\n'
      'But it\'s enough.\n\n'
      'The weekend comes.\n\n'
      'You meet her outside, under a sky that feels strangely calm.\n\n'
      'At first, things are normal.\n\n'
      'Easy, even.\n\n'
      'You walk. Talk. Laugh.\n\n'
      'Nothing forced.\n\n'
      'Nothing awkward.\n\n'
      'But somewhere along the way--\n\n'
      'You start noticing it.\n\n'
      'The way you look at her a little longer than you should.\n\n'
      'The way your tone softens without realizing.\n\n'
      'The way your attention never really leaves her.\n\n'
      'And she notices too.\n\n'
      'There\'s a moment--\n\n'
      'A small one.\n\n'
      'When your hands almost brush against each other.\n\n'
      'You pull back a second too late.\n\n'
      'She doesn\'t say anything then.\n\n'
      'But something shifts.\n\n'
      'Subtle.\n\n'
      'Quiet.\n\n'
      'Clear.\n\n'
      'Later that day, when things slow down--\n\n'
      'She speaks.\n\n'
      '"Hey..."\n\n'
      'You turn to her.\n\n'
      '"Can I say something?"\n\n'
      'Your chest tightens slightly.\n\n'
      'But you nod.\n\n'
      'She looks at you for a moment.\n\n'
      'Not avoiding.\n\n'
      'Not hesitating.\n\n'
      'Just... choosing her words carefully.\n\n'
      '"I feel like... you might be starting to see me differently."\n\n'
      'Silence.\n\n'
      'You don\'t deny it.\n\n'
      'You can\'t.\n\n'
      'She exhales softly.\n\n'
      '"I just got out of something."\n\n'
      '"And right now... I don\'t think I\'m ready for anything like that."\n\n'
      'Her voice isn\'t distant.\n\n'
      'If anything, it\'s gentle.\n\n'
      'Careful.\n\n'
      '"I really value what we have now."\n\n'
      '"So... can we keep it like this?"\n\n'
      'There it is.\n\n'
      'Not a rejection.\n\n'
      'But a line.\n\n'
      'Clearly drawn.\n\n'
      'You nod.\n\n'
      'Because again--\n\n'
      'What else can you do?\n\n'
      'The day continues.\n\n'
      'But something has changed.\n\n'
      'Not broken.\n\n'
      'Just... defined.\n\n'
      'End of Chapter';

  static const String _doNothingStory =
      'You stare at her name on your screen.\n\n'
      'Your thumb hovers over the keyboard.\n\n'
      'Then slowly--\n\n'
      'You lock your phone.\n\n'
      'Not today.\n\n'
      'Maybe later.\n\n'
      'Days pass.\n\n'
      'Then weeks.\n\n'
      'You still talk.\n\n'
      'Still laugh.\n\n'
      'Still sit next to each other like nothing has changed.\n\n'
      'And yet--\n\n'
      'Everything feels slightly different.\n\n'
      'At least to you.\n\n'
      'You start noticing the things you didn\'t before.\n\n'
      'How easily conversations with her come to you.\n\n'
      'How natural it feels to stay.\n\n'
      'How hard it is to leave.\n\n'
      'So instead of saying anything--\n\n'
      'You stay.\n\n'
      'You show up.\n\n'
      'You become... consistent.\n\n'
      'One day, the two of you end up going out together.\n\n'
      'Not planned.\n\n'
      'Not labeled.\n\n'
      'Just something that happens.\n\n'
      'It feels nice.\n\n'
      'Too nice.\n\n'
      'You talk longer than usual.\n\n'
      'Walk further than you intended.\n\n'
      'And for a moment--\n\n'
      'It almost feels like something more.\n\n'
      'But just like in Route 2--\n\n'
      'She notices.\n\n'
      'The way you look at her.\n\n'
      'The way you hesitate.\n\n'
      'The way you stay just a little too close.\n\n'
      'And eventually--\n\n'
      'She says it.\n\n'
      '"Hey... can I be honest?"\n\n'
      'You already know.\n\n'
      'Somehow.\n\n'
      '"I feel like you might like me."\n\n'
      'Silence.\n\n'
      'You don\'t answer.\n\n'
      'But you don\'t need to.\n\n'
      'She smiles faintly.\n\n'
      'Not awkward.\n\n'
      'Not uncomfortable.\n\n'
      'Just... understanding.\n\n'
      '"I just don\'t want things to get complicated."\n\n'
      '"Not right now."\n\n'
      'There\'s that line again.\n\n'
      'Different path.\n\n'
      'Same boundary.\n\n'
      'You nod.\n\n'
      'And just like that--\n\n'
      'The moment passes.\n\n'
      'Without ever being fully spoken.\n\n'
      '-End of Chapter-';

  static const String _chapter1Story =
      'After that day--\n\n'
      'things didn\'t end.\n\n'
      'They just... changed shape.\n\n'
      'You still talked.\n\n'
      'Still met each other.\n\n'
      'Still shared the same small moments that once felt so natural.\n\n'
      'Just not as often.\n\n'
      'Not as close.\n\n'
      'Not as before.\n\n'
      'There was a distance now.\n\n'
      'Not forced.\n\n'
      'Not spoken.\n\n'
      'But understood.\n\n'
      'And somehow, both of you learned how to live with it.\n\n'
      'Time moved on.\n\n'
      'Quietly.\n\n'
      'Then one day--\n\n'
      'you heard she was in a new relationship.\n\n'
      'It didn\'t hit as hard as you thought it would.\n\n'
      'Maybe because you had already seen it coming.\n\n'
      'Or maybe--\n\n'
      'because somewhere along the way, you had learned how to accept things you couldn\'t change.\n\n'
      'You didn\'t ask much.\n\n'
      'Didn\'t interfere.\n\n'
      'Just... stayed where you were.\n\n'
      'Not too close.\n\n'
      'Not too far.\n\n'
      'And so--\n\n'
      'life went on.\n\n'
      'Until almost a year later.\n\n'
      'Another message.\n\n'
      'Another piece of news.\n\n'
      'She broke up.\n\n'
      'Again.\n\n'
      'This time, it felt different.\n\n'
      'Not because of her--\n\n'
      'but because of you.\n\n'
      'You weren\'t the same person anymore.\n\n'
      'You didn\'t rush.\n\n'
      'Didn\'t push.\n\n'
      'Didn\'t try to "be the one" right away.\n\n'
      'Instead--\n\n'
      'you stayed.\n\n'
      'Quietly.\n\n'
      'Steadily.\n\n'
      'You listened when she needed to talk.\n\n'
      'Stayed silent when she didn\'t.\n\n'
      'Walked beside her, without trying to lead.\n\n'
      'No pressure.\n\n'
      'No expectations.\n\n'
      'Just... presence.\n\n'
      'And slowly--\n\n'
      'things began to change.\n\n'
      'She started texting you more.\n\n'
      'Calling you more.\n\n'
      'Asking if you were free.\n\n'
      'Sometimes for no reason at all.\n\n'
      'You noticed the way she opened up more easily.\n\n'
      'The way she laughed a little longer.\n\n'
      'The way she looked at you--\n\n'
      'not the same as before.\n\n'
      'And this time--\n\n'
      'you didn\'t rush to name it.\n\n'
      'Because you knew--\n\n'
      'whatever this was...\n\n'
      'it needed time.\n\n'
      'Until one day--\n\n'
      'you realized something.\n\n'
      'The distance that once existed...\n\n'
      'was gone.\n\n'
      'You look at her.\n\n'
      'She looks back.\n\n'
      'No hesitation.\n\n'
      'No confusion.\n\n'
      'Just... something unspoken.\n\n'
      'And for the second time--\n\n'
      'you stand at the same place.\n\n'
      'But this time--\n\n'
      'you\'re different.\n\n'
      'So you ask.\n\n'
      'Not impulsively.\n\n'
      'Not out of fear of losing her.\n\n'
      'But because now--\n\n'
      'you\'re ready for whatever answer comes.\n\n'
      'And this time--\n\n'
      'the choice...\n\n'
      'is hers.';
  static const String _chapter1YesStory =
      'She doesn\'t answer immediately.\n\n'
      'But she doesn\'t look away either.\n\n'
      'There\'s a quiet moment between you.\n\n'
      'Soft.\n\n'
      'Real.\n\n'
      'Then--\n\n'
      'she smiles.\n\n'
      'Not the polite kind.\n\n'
      'Not the uncertain kind.\n\n'
      'But the kind you\'ve never seen before.\n\n'
      '"...I think I\'m ready now."\n\n'
      'Your chest tightens.\n\n'
      'But not in pain.\n\n'
      '"And... I think I want to try. With you."\n\n'
      'No dramatic moment.\n\n'
      'No overwhelming rush.\n\n'
      'Just something calm.\n\n'
      'Something certain.\n\n'
      'After everything--\n\n'
      'after all the distance, the waiting, the silence--\n\n'
      'you finally step forward.\n\n'
      'Together.\n\n'
      'And this time--\n\n'
      'neither of you pulls back.\n\n'
      'End - True Ending';
  static const String _chapter1ElseStory =
      'She doesn\'t answer right away.\n\n'
      'And somehow--\n\n'
      'that tells you everything.\n\n'
      'Days pass.\n\n'
      'Then weeks.\n\n'
      'You don\'t push.\n\n'
      'Don\'t ask again.\n\n'
      'Until one day--\n\n'
      'she tells you.\n\n'
      '"I\'m sorry... I thought about it a lot."\n\n'
      'You already know what\'s coming.\n\n'
      '"I really care about you."\n\n'
      '"But... I don\'t think I can be with you like that."\n\n'
      'A pause.\n\n'
      'Then--\n\n'
      '"I met someone."\n\n'
      'There it is.\n\n'
      'This time, it doesn\'t break you the same way.\n\n'
      'It still hurts.\n\n'
      'Of course it does.\n\n'
      'But not like before.\n\n'
      'Because now you understand--\n\n'
      'sometimes, timing matters more than feelings.\n\n'
      'You look at her.\n\n'
      'And for once--\n\n'
      'you don\'t try to hold on.\n\n'
      'You just nod.\n\n'
      '"I hope you\'re happy."\n\n'
      'And this time--\n\n'
      'you mean it.\n\n'
      'She smiles.\n\n'
      'A little sad.\n\n'
      'A little grateful.\n\n'
      'Then slowly--\n\n'
      'the distance returns.\n\n'
      'Not suddenly.\n\n'
      'Not painfully.\n\n'
      'Just... naturally.\n\n'
      'Like it was always meant to be there.\n\n'
      'End - Bittersweet Ending';

  final ScrollController _scrollController = ScrollController();
  late int _currentTab;
  bool _canScrollMore = true;
  String _typedStory = '';
  bool _isTyping = false;
  String _activeStory = _chapter0Story;
  String _activeChapterTitle = _chapter0Title;

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
    if (!_scrollController.hasClients) return;
    final atBottom =
        _scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 6;
    final nextCanScrollMore = !atBottom;
    if (nextCanScrollMore == _canScrollMore) return;
    setState(() {
      _canScrollMore = nextCanScrollMore;
    });
  }

  Future<void> _scrollByStep() async {
    if (!_scrollController.hasClients) return;
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
    if (_isTyping || _typedStory.length >= _activeStory.length) return;

    _isTyping = true;
    for (var i = _typedStory.length + 1; i <= _activeStory.length; i++) {
      if (!mounted) return;
      setState(() {
        _typedStory = _activeStory.substring(0, i);
      });
      await Future<void>.delayed(const Duration(milliseconds: 12));
    }
    _isTyping = false;
  }

  Future<void> _setStory(String title, String story) async {
    if (_isTyping) return;
    setState(() {
      _activeChapterTitle = title;
      _activeStory = story;
      _typedStory = '';
    });

    await _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 260),
      curve: Curves.easeOutCubic,
    );

    await _startTypewriter();
  }

  Future<void> _onSelectConfessDirectly() async {
    if (_activeStory != _chapter0Story) return;
    await _setStory(_chapter0Title, _confessDirectlyStory);
  }

  Future<void> _onSelectTakeStepCloser() async {
    if (_activeStory != _chapter0Story) return;
    await _setStory(_chapter0Title, _takeStepCloserStory);
  }

  Future<void> _onSelectDoNothing() async {
    if (_activeStory != _chapter0Story) return;
    await _setStory(_chapter0Title, _doNothingStory);
  }

  Future<void> _onNextChapter() async {
    if (_activeStory == _chapter1Story || _activeStory == _chapter0Story)
      return;
    await _setStory(_chapter1Title, _chapter1Story);
  }

  Future<void> _onChapter1ChoiceYes() async {
    if (_activeStory != _chapter1Story) return;
    await _setStory(_chapter1Title, _chapter1YesStory);
  }

  Future<void> _onChapter1ChoiceElse() async {
    if (_activeStory != _chapter1Story) return;
    await _setStory(_chapter1Title, _chapter1ElseStory);
  }

  void _onTabChanged(int index) {
    if (_currentTab == index) return;
    setState(() {
      _currentTab = index;
    });

    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 260),
      curve: Curves.easeOutCubic,
    );

    if (index == 0) _startTypewriter();
  }

  @override
  Widget build(BuildContext context) {
    final isChapter0Base = _activeStory == _chapter0Story;
    final isChapter1Base = _activeStory == _chapter1Story;
    final storyDone = _typedStory.length >= _activeStory.length;
    final isChapter0RouteStory =
        _activeChapterTitle == _chapter0Title && !isChapter0Base;

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
                            chapterTitle: _activeChapterTitle,
                            typedStory: _typedStory,
                            showChapter0Choices: isChapter0Base && storyDone,
                            showChapter1Choices: isChapter1Base && storyDone,
                            showNextChapterButton:
                                isChapter0RouteStory && storyDone,
                            onSelectConfessDirectly: _onSelectConfessDirectly,
                            onSelectTakeStepCloser: _onSelectTakeStepCloser,
                            onSelectDoNothing: _onSelectDoNothing,
                            onNextChapter: _onNextChapter,
                            onChapter1ChoiceYes: _onChapter1ChoiceYes,
                            onChapter1ChoiceElse: _onChapter1ChoiceElse,
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
  const _StoryBody({
    required this.tab,
    required this.chapterTitle,
    required this.typedStory,
    required this.showChapter0Choices,
    required this.showChapter1Choices,
    required this.showNextChapterButton,
    required this.onSelectConfessDirectly,
    required this.onSelectTakeStepCloser,
    required this.onSelectDoNothing,
    required this.onNextChapter,
    required this.onChapter1ChoiceYes,
    required this.onChapter1ChoiceElse,
  });

  final int tab;
  final String chapterTitle;
  final String typedStory;
  final bool showChapter0Choices;
  final bool showChapter1Choices;
  final bool showNextChapterButton;
  final VoidCallback onSelectConfessDirectly;
  final VoidCallback onSelectTakeStepCloser;
  final VoidCallback onSelectDoNothing;
  final VoidCallback onNextChapter;
  final VoidCallback onChapter1ChoiceYes;
  final VoidCallback onChapter1ChoiceElse;

  @override
  Widget build(BuildContext context) {
    switch (tab) {
      case 1:
        return const _HistoryView();
      case 2:
        return const _BookmarksView();
      default:
        return _GrimoireView(
          chapterTitle: chapterTitle,
          typedStory: typedStory,
          showChapter0Choices: showChapter0Choices,
          showChapter1Choices: showChapter1Choices,
          showNextChapterButton: showNextChapterButton,
          onSelectConfessDirectly: onSelectConfessDirectly,
          onSelectTakeStepCloser: onSelectTakeStepCloser,
          onSelectDoNothing: onSelectDoNothing,
          onNextChapter: onNextChapter,
          onChapter1ChoiceYes: onChapter1ChoiceYes,
          onChapter1ChoiceElse: onChapter1ChoiceElse,
        );
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
  const _GrimoireView({
    required this.chapterTitle,
    required this.typedStory,
    required this.showChapter0Choices,
    required this.showChapter1Choices,
    required this.showNextChapterButton,
    required this.onSelectConfessDirectly,
    required this.onSelectTakeStepCloser,
    required this.onSelectDoNothing,
    required this.onNextChapter,
    required this.onChapter1ChoiceYes,
    required this.onChapter1ChoiceElse,
  });

  final String chapterTitle;
  final String typedStory;
  final bool showChapter0Choices;
  final bool showChapter1Choices;
  final bool showNextChapterButton;
  final VoidCallback onSelectConfessDirectly;
  final VoidCallback onSelectTakeStepCloser;
  final VoidCallback onSelectDoNothing;
  final VoidCallback onNextChapter;
  final VoidCallback onChapter1ChoiceYes;
  final VoidCallback onChapter1ChoiceElse;

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
        Text(
          chapterTitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xFF3A1E22),
            fontSize: 60,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.italic,
            height: 1.04,
          ),
        ),
        const SizedBox(height: 24),
        _TypedStoryBlock(text: typedStory),
        if (showChapter0Choices) ...[
          const SizedBox(height: 44),
          const _SectionLabel(text: 'DECIDE THY FATE'),
          const SizedBox(height: 24),
          _ChoiceCard(
            icon: Icons.forest,
            text: 'Confess directly -- "I think... I like you."',
            onTap: onSelectConfessDirectly,
          ),
          const SizedBox(height: 16),
          _ChoiceCard(
            icon: Icons.menu_book_rounded,
            text: 'Take a step closer -- "Are you free this weekend?"',
            onTap: onSelectTakeStepCloser,
          ),
          const SizedBox(height: 16),
          _ChoiceCard(
            icon: Icons.local_fire_department,
            text: 'Do nothing -- Keep things the way they are.',
            onTap: onSelectDoNothing,
          ),
        ],
        if (showNextChapterButton) ...[
          const SizedBox(height: 32),
          FilledButton.icon(
            onPressed: onNextChapter,
            icon: const Icon(Icons.skip_next_rounded),
            label: const Text('Next Chapter'),
            style: FilledButton.styleFrom(
              backgroundColor: const Color(0xFF5B2A2E),
              foregroundColor: const Color(0xFFF4EBDD),
              padding: const EdgeInsets.symmetric(vertical: 16),
              textStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
        if (showChapter1Choices) ...[
          const SizedBox(height: 44),
          const _SectionLabel(text: 'MAKE YOUR CHOICE'),
          const SizedBox(height: 24),
          _ChoiceCard(
            icon: Icons.favorite,
            text: 'She says yes',
            onTap: onChapter1ChoiceYes,
          ),
          const SizedBox(height: 16),
          _ChoiceCard(
            icon: Icons.heart_broken,
            text: 'She hesitates, then chooses someone else',
            onTap: onChapter1ChoiceElse,
          ),
        ],
        if (typedStory.endsWith('End - True Ending') ||
            typedStory.endsWith('End - Bittersweet Ending')) ...[
          const SizedBox(height: 34),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
            decoration: BoxDecoration(
              color: const Color(0xFFF0E6DA),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0x22A57F67)),
            ),
            child: const Text(
              'THE END',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF5B2A2E),
                fontSize: 20,
                fontWeight: FontWeight.w800,
                letterSpacing: 2.2,
              ),
            ),
          ),
        ],
      ],
    );
  }
}

class _TypedStoryBlock extends StatelessWidget {
  const _TypedStoryBlock({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    if (text.isEmpty) return const SizedBox.shrink();

    final bodyStyle = const TextStyle(
      color: Color(0xFF2F2325),
      fontSize: 21,
      height: 1.55,
    );

    final spans = <TextSpan>[
      TextSpan(
        text: text.substring(0, 1),
        style: const TextStyle(
          color: Color(0xFF9D2E43),
          fontSize: 74,
          fontWeight: FontWeight.w700,
          height: 1,
        ),
      ),
    ];

    const endings = ['End - True Ending', 'End - Bittersweet Ending'];
    var remaining = text.substring(1);
    while (remaining.isNotEmpty) {
      var nearestIndex = -1;
      String? nearestEnding;

      for (final ending in endings) {
        final idx = remaining.indexOf(ending);
        if (idx >= 0 && (nearestIndex == -1 || idx < nearestIndex)) {
          nearestIndex = idx;
          nearestEnding = ending;
        }
      }

      if (nearestIndex == -1 || nearestEnding == null) {
        spans.add(TextSpan(text: remaining, style: bodyStyle));
        break;
      }

      if (nearestIndex > 0) {
        spans.add(
          TextSpan(
            text: remaining.substring(0, nearestIndex),
            style: bodyStyle,
          ),
        );
      }

      spans.add(
        TextSpan(
          text: nearestEnding,
          style: const TextStyle(
            color: Color(0xFF2F2325),
            fontSize: 21,
            height: 1.55,
            fontWeight: FontWeight.w800,
          ),
        ),
      );

      remaining = remaining.substring(nearestIndex + nearestEnding.length);
    }

    return RichText(text: TextSpan(children: spans));
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
          chapter: 'CHAPTER 0: PROLOGUE',
          title: 'The Distance Between Us',
          decision: '"I stayed close, but let timing decide what came next."',
          outcome:
              'From classmates to quiet confidants, the two of you drifted from distance into '
              'something fragile and unspoken. You stood at the edge of change.',
          icon: Icons.menu_book_rounded,
        ),
        const SizedBox(height: 26),
        const _HistoryEntry(
          chapter: 'CHAPTER 1: AFTER TIME HAS PASSED',
          title: 'True Ending Route',
          decision: '"I asked again when I was finally ready for any answer."',
          outcome:
              'She smiled and said yes. No rush, no drama, just certainty. '
              'After every pause and every detour, both of you stepped forward together.',
          icon: Icons.favorite,
        ),
        const SizedBox(height: 26),
        const _HistoryEntry(
          chapter: 'CHAPTER 1: AFTER TIME HAS PASSED',
          title: 'Bittersweet Ending Route',
          decision:
              '"I let go with sincerity, even when my heart still wanted to stay."',
          outcome:
              'She chose someone else. The pain remained, but it no longer shattered you. '
              'You accepted the distance and wished her happiness, honestly.',
          icon: Icons.heart_broken,
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
          title: 'Chapter 0: The Distance Between Us',
          tintColor: Color(0xFF5F3B2E),
          imagePath: 'assets/backgrounds/ending1.jpg',
          date: 'Route Snapshot',
          excerpt:
              '"A quiet prologue where distance fades, and one message can change everything."',
          icon: Icons.menu_book_rounded,
        ),
        const SizedBox(height: 22),
        const _BookmarkCard(
          title: 'Chapter 1: After Time Has Passed',
          tintColor: Color(0xFF6A727D),
          imagePath: 'assets/backgrounds/ending2.jpg',
          date: 'Ending Snapshot',
          excerpt:
              '"One chapter, two endings: certainty in love, or acceptance in silence."',
          icon: Icons.auto_stories,
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
    required this.icon,
    required this.tintColor,
    this.imagePath,
  });

  final String title;
  final String date;
  final String excerpt;
  final IconData icon;
  final Color tintColor;
  final String? imagePath;

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
              Container(
                height: 230,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      tintColor.withOpacity(0.90),
                      tintColor.withOpacity(0.45),
                      const Color(0xFFE9DECF),
                    ],
                  ),
                ),
                child: imagePath == null
                    ? const Center(
                        child: Icon(
                          Icons.landscape_rounded,
                          color: Color(0x88FFF7EC),
                          size: 70,
                        ),
                      )
                    : ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        child: Image.asset(
                          imagePath!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 230,
                        ),
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
                    child: const Text('Return to this Moment  >>'),
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

