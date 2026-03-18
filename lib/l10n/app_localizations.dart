import 'package:flutter/material.dart';

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;

  static const supportedLocales = [Locale('en'), Locale('vi')];

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static AppLocalizations of(BuildContext context) {
    final localizations = Localizations.of<AppLocalizations>(
      context,
      AppLocalizations,
    );
    return localizations ?? AppLocalizations(const Locale('en'));
  }

  static const Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'appTitle': "syndrayaka's Story App",
      'languageDialogTitle': 'Choose language',
      'languageEnglish': 'English',
      'languageVietnamese': 'Tieng Viet',
      'menuTopTitle': 'The Flashback of syndrayaka',
      'menuHeroTitle': 'The Flashback of\nsyndrayaka',
      'startNewStory': 'Start New Story',
      'continueStory': 'Continue Story',
      'credits': 'Credits',
      'loadingBoot': 'Loading boot animation...',
      'tapToStart': 'Click/tap anywhere to start the application.',
      'splashError': 'Unable to load splash video.',
      'creditsPlaceholder': 'Credits content will be implemented next.',
      'storyTopTitle': 'The Flashback of\nSyndrayaka',
      'decideFate': 'DECIDE THY FATE',
      'makeChoice': 'MAKE YOUR CHOICE',
      'choiceConfess': 'Confess directly -- "I think... I like you."',
      'choiceStepCloser': 'Take a step closer -- "Are you free this weekend?"',
      'choiceDoNothing': 'Do nothing -- Keep things the way they are.',
      'nextChapter': 'Next Chapter',
      'choiceSheYes': 'She says yes',
      'choiceSheElse': 'She hesitates, then chooses someone else',
      'theEnd': 'THE END',
      'pastFates': 'Past Fates',
      'historySubtitle':
          'A record of your journey through the shadows of\nSyndrayaka.',
      'historyChapter0': 'CHAPTER 0: PROLOGUE',
      'historyTitle0': 'The Distance Between Us',
      'historyDecision0':
          '"I stayed close, but let timing decide what came next."',
      'historyOutcome0':
          'From classmates to quiet confidants, the two of you drifted from distance into something fragile and unspoken. You stood at the edge of change.',
      'historyChapter1': 'CHAPTER 1: AFTER TIME HAS PASSED',
      'historyTrueRoute': 'True Ending Route',
      'historyDecisionTrue':
          '"I asked again when I was finally ready for any answer."',
      'historyOutcomeTrue':
          'She smiled and said yes. No rush, no drama, just certainty. After every pause and every detour, both of you stepped forward together.',
      'historyBitterRoute': 'Bittersweet Ending Route',
      'historyDecisionBitter':
          '"I let go with sincerity, even when my heart still wanted to stay."',
      'historyOutcomeBitter':
          'She chose someone else. The pain remained, but it no longer shattered you. You accepted the distance and wished her happiness, honestly.',
      'historyEndRecords': 'End of current records',
      'enchantedMarkers': 'Enchanted\nMarkers',
      'bookmarksSubtitle': 'Your path through the living\ngrimoire',
      'bookmarkTitle0': 'Chapter 0: The Distance Between Us',
      'bookmarkDate0': 'Route Snapshot',
      'bookmarkExcerpt0':
          '"A quiet prologue where distance fades, and one message can change everything."',
      'bookmarkTitle1': 'Chapter 1: After Time Has Passed',
      'bookmarkDate1': 'Ending Snapshot',
      'bookmarkExcerpt1':
          '"One chapter, two endings: certainty in love, or acceptance in silence."',
      'bookmarkHint':
          'Press the silk ribbon icon during your journey\nto capture an echo of your current location.',
      'yourDecision': 'Your Decision:',
      'theOutcome': 'The Outcome:',
      'openingTitle': 'Opening "{title}"...',
      'returnMoment': 'Return to this Moment  >>',
      'tabGrimoire': 'Grimoire',
      'tabHistory': 'History',
      'tabBookmarks': 'Bookmarks',
    },
    'vi': {
      'appTitle': 'Ung dung truyen cua syndrayaka',
      'languageDialogTitle': 'Chon ngon ngu',
      'languageEnglish': 'English',
      'languageVietnamese': 'Tieng Viet',
      'menuTopTitle': 'Hoi uc cua syndrayaka',
      'menuHeroTitle': 'Hoi uc cua\nsyndrayaka',
      'startNewStory': 'Bat dau truyen moi',
      'continueStory': 'Tiep tuc truyen',
      'credits': 'Thong tin doi ngu',
      'loadingBoot': 'Dang tai boot animation...',
      'tapToStart': 'Nhan/cham vao bat cu dau de bat dau ung dung.',
      'splashError': 'Khong the tai video mo dau.',
      'creditsPlaceholder': 'Noi dung Credits se duoc bo sung sau.',
      'storyTopTitle': 'Hoi uc cua\nSyndrayaka',
      'decideFate': 'DINH DOAT SO PHAN',
      'makeChoice': 'HAY CHON HUONG DI',
      'choiceConfess': 'To tinh truc tiep -- "Minh nghi... minh thich cau."',
      'choiceStepCloser': 'Tien them mot buoc -- "Cuoi tuan nay cau ranh khong?"',
      'choiceDoNothing': 'Khong lam gi -- Giu moi thu nhu hien tai.',
      'nextChapter': 'Chuong tiep theo',
      'choiceSheYes': 'Co ay dong y',
      'choiceSheElse': 'Co ay ngap ngung, roi chon nguoi khac',
      'theEnd': 'KET THUC',
      'pastFates': 'Dau vet qua khu',
      'historySubtitle': 'Ban ghi hanh trinh cua ban trong bong toi\nSyndrayaka.',
      'historyChapter0': 'CHUONG 0: MO DAU',
      'historyTitle0': 'Khoang cach giua chung ta',
      'historyDecision0':
          '"Minh van o ben, de thoi diem quyet dinh tat ca."',
      'historyOutcome0':
          'Tu ban cung lop den tri ky tham lang, ca hai dan xich lai trong mot dieu mong manh chua goi ten.',
      'historyChapter1': 'CHUONG 1: SAU MOT KHOANG THOI GIAN',
      'historyTrueRoute': 'Nhanh ket thuc that',
      'historyDecisionTrue':
          '"Minh hoi lai khi da san sang voi moi cau tra loi."',
      'historyOutcomeTrue':
          'Co ay mim cuoi va dong y. Khong kich tinh, chi co su chac chan de ca hai buoc tiep.',
      'historyBitterRoute': 'Nhanh ket thuc bittersweet',
      'historyDecisionBitter':
          '"Minh buong tay chan thanh, du trai tim van muon o lai."',
      'historyOutcomeBitter':
          'Co ay chon mot nguoi khac. Ban chap nhan khoang cach va that long chuc co ay hanh phuc.',
      'historyEndRecords': 'Ket thuc ban ghi hien tai',
      'enchantedMarkers': 'Dau an\nma thuat',
      'bookmarksSubtitle': 'Hanh trinh cua ban qua\ncuon grimoire song',
      'bookmarkTitle0': 'Chuong 0: Khoang cach giua chung ta',
      'bookmarkDate0': 'Moc tuyen truyen',
      'bookmarkExcerpt0':
          '"Phan mo dau lang le, noi khoang cach mo dan va mot tin nhan co the doi moi thu."',
      'bookmarkTitle1': 'Chuong 1: Sau mot khoang thoi gian',
      'bookmarkDate1': 'Moc ket truyen',
      'bookmarkExcerpt1':
          '"Mot chuong, hai cai ket: chac chan trong tinh yeu hoac chap nhan trong lang im."',
      'bookmarkHint':
          'Hay nhan bieu tuong ruy bang trong hanh trinh\nde luu lai moc hien tai.',
      'yourDecision': 'Lua chon cua ban:',
      'theOutcome': 'Ket qua:',
      'openingTitle': 'Dang mo "{title}"...',
      'returnMoment': 'Quay lai khoanh khac nay  >>',
      'tabGrimoire': 'Grimoire',
      'tabHistory': 'Lich su',
      'tabBookmarks': 'Danh dau',
    },
  };

  String _text(String key) {
    final code = _localizedValues.containsKey(locale.languageCode)
        ? locale.languageCode
        : 'en';
    return _localizedValues[code]?[key] ?? _localizedValues['en']![key] ?? key;
  }

  String openingTitle(String title) =>
      _text('openingTitle').replaceAll('{title}', title);

  String get appTitle => _text('appTitle');
  String get languageDialogTitle => _text('languageDialogTitle');
  String get languageEnglish => _text('languageEnglish');
  String get languageVietnamese => _text('languageVietnamese');
  String get menuTopTitle => _text('menuTopTitle');
  String get menuHeroTitle => _text('menuHeroTitle');
  String get startNewStory => _text('startNewStory');
  String get continueStory => _text('continueStory');
  String get credits => _text('credits');
  String get loadingBoot => _text('loadingBoot');
  String get tapToStart => _text('tapToStart');
  String get splashError => _text('splashError');
  String get creditsPlaceholder => _text('creditsPlaceholder');
  String get storyTopTitle => _text('storyTopTitle');
  String get decideFate => _text('decideFate');
  String get makeChoice => _text('makeChoice');
  String get choiceConfess => _text('choiceConfess');
  String get choiceStepCloser => _text('choiceStepCloser');
  String get choiceDoNothing => _text('choiceDoNothing');
  String get nextChapter => _text('nextChapter');
  String get choiceSheYes => _text('choiceSheYes');
  String get choiceSheElse => _text('choiceSheElse');
  String get theEnd => _text('theEnd');
  String get pastFates => _text('pastFates');
  String get historySubtitle => _text('historySubtitle');
  String get historyChapter0 => _text('historyChapter0');
  String get historyTitle0 => _text('historyTitle0');
  String get historyDecision0 => _text('historyDecision0');
  String get historyOutcome0 => _text('historyOutcome0');
  String get historyChapter1 => _text('historyChapter1');
  String get historyTrueRoute => _text('historyTrueRoute');
  String get historyDecisionTrue => _text('historyDecisionTrue');
  String get historyOutcomeTrue => _text('historyOutcomeTrue');
  String get historyBitterRoute => _text('historyBitterRoute');
  String get historyDecisionBitter => _text('historyDecisionBitter');
  String get historyOutcomeBitter => _text('historyOutcomeBitter');
  String get historyEndRecords => _text('historyEndRecords');
  String get enchantedMarkers => _text('enchantedMarkers');
  String get bookmarksSubtitle => _text('bookmarksSubtitle');
  String get bookmarkTitle0 => _text('bookmarkTitle0');
  String get bookmarkDate0 => _text('bookmarkDate0');
  String get bookmarkExcerpt0 => _text('bookmarkExcerpt0');
  String get bookmarkTitle1 => _text('bookmarkTitle1');
  String get bookmarkDate1 => _text('bookmarkDate1');
  String get bookmarkExcerpt1 => _text('bookmarkExcerpt1');
  String get bookmarkHint => _text('bookmarkHint');
  String get yourDecision => _text('yourDecision');
  String get theOutcome => _text('theOutcome');
  String get returnMoment => _text('returnMoment');
  String get tabGrimoire => _text('tabGrimoire');
  String get tabHistory => _text('tabHistory');
  String get tabBookmarks => _text('tabBookmarks');
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      AppLocalizations.supportedLocales
          .map((e) => e.languageCode)
          .contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
