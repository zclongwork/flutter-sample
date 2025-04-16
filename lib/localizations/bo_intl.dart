import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/date_symbol_data_custom.dart' as date_symbol_data_custom;
import 'package:intl/date_symbols.dart' as intl;
import 'package:intl/intl.dart' as intl;
import 'package:intl/number_symbols.dart';
import 'package:intl/number_symbols_data.dart';

/// A custom set of date patterns for the `bo` locale.
///
/// These are not accurate and are just a clone of the date patterns for the
/// `no` locale to demonstrate how one would write and use custom date patterns.
// #docregion date-patterns
const boLocaleDatePatterns = {
  'd': 'd', // DAY
  'E': 'ccc', // ABBR_WEEKDAY
  'EEEE': 'cccc', // WEEKDAY
  'LLL': 'LLL', // ABBR_STANDALONE_MONTH
  'LLLL': 'LLLL', // STANDALONE_MONTH
  'M': 'L', // NUM_MONTH
  'Md': 'M/d', // NUM_MONTH_DAY
  'MEd': 'M/d, EEE', // NUM_MONTH_WEEKDAY_DAY
  'MMM': 'LLL', // ABBR_MONTH
  'MMMd': 'MMMཚེས་d', // ABBR_MONTH_DAY
  'MMMEd': 'MMMཚེས་d, E', // ABBR_MONTH_WEEKDAY_DAY
  'MMMM': 'LLLL', // MONTH
  'MMMMd': 'MMMMའི་ཚེས་d', // MONTH_DAY
  'MMMMEEEEd': 'MMMM d(\'a\'), EEEE', // MONTH_WEEKDAY_DAY
  'QQQ': 'QQQ', // ABBR_QUARTER
  'QQQQ': 'QQQQ', // QUARTER
  'y': 'y', // YEAR
  'yM': 'y/M', // YEAR_NUM_MONTH
  'yMd': 'y/M/d', // YEAR_NUM_MONTH_DAY
  'yMEd': 'y/M/d, EEE', // YEAR_NUM_MONTH_WEEKDAY_DAY
  'yMMM': 'y LLL', // YEAR_ABBR_MONTH
  'yMMMd': 'y ལོའི་MMMཚེས་d', // YEAR_ABBR_MONTH_DAY
  'yMMMEd': 'y MMM d(\'a\'), EEE', // YEAR_ABBR_MONTH_WEEKDAY_DAY
  'yMMMMd': 'སྤྱི་ལོ་y MMMMའི་ཚེས་d', // YEAR_MONTH_DAY
  'yMMMMEEEEd': 'y(\'e\')\'ko\' MMMM\'ren\' d(\'a\'), EEEE',
  // YEAR_MONTH_WEEKDAY_DAY
  'GyMMM': 'G y LLLL',
  'H': 'HH', // HOUR24
  'Hm': 'HH:mm', // HOUR24_MINUTE
  'Hms': 'HH:mm:ss', // HOUR24_MINUTE_SECOND
  'j': 'HH', // HOUR
  'jm': 'HH:mm', // HOUR_MINUTE
  'jms': 'HH:mm:ss', // HOUR_MINUTE_SECOND
  'jmv': 'HH:mm v', // HOUR_MINUTE_GENERIC_TZ
  'jmz': 'HH:mm z', // HOUR_MINUTETZ
  'jz': 'HH (z)', // HOURGENERIC_TZ
  'm': 'm', // MINUTE
  'ms': 'mm:ss', // MINUTE_SECOND
  's': 's', // SECOND
  'v': 'v', // ABBR_GENERIC_TZ
  'z': 'z', // ABBR_SPECIFIC_TZ
  'zzzz': 'zzzz', // SPECIFIC_TZ
  'ZZZZ': 'ZZZZ' // ABBR_UTC_TZ
};

/// A custom set of date symbols for the `bo` locale.
///
/// These are not accurate and are just a clone of the date symbols for the
/// `no` locale to demonstrate how one would write and use custom date symbols.
// #docregion date-symbols
const boDateSymbols = {
  'NAME': 'bo',
  'ERAS': <dynamic>[
    'སྤྱི་ལོ་སྔོན་',
    'ྤྱི་ལོ་',
  ],
// #enddocregion date-symbols
  'ERANAMES': <dynamic>[
    'སྤྱི་ལོ་སྔོན་',
    'སྤྱི་ལོ་',
  ],
  'NARROWMONTHS': <dynamic>[
    'ཟླ་༡',
    'ཟླ་༢',
    'ཟླ་༣',
    'ཟླ་༤',
    'ཟླ་༥',
    'ཟླ་༦',
    'ཟླ་༧',
    'ཟླ་༨',
    'ཟླ་༩',
    'ཟླ་༡༠',
    'ཟླ་༡༡',
    'ཟླ་༡༢',
  ],
  'STANDALONENARROWMONTHS': <dynamic>[
    'ཟླ་༡',
    'ཟླ་༢',
    'ཟླ་༣',
    'ཟླ་༤',
    'ཟླ་༥',
    'ཟླ་༦',
    'ཟླ་༧',
    'ཟླ་༨',
    'ཟླ་༩',
    'ཟླ་༡༠',
    'ཟླ་༡༡',
    'ཟླ་༡༢',
  ],
  'MONTHS': <dynamic>[
    'ཟླ་༡',
    'ཟླ་༢',
    'ཟླ་༣',
    'ཟླ་༤',
    'ཟླ་༥',
    'ཟླ་༦',
    'ཟླ་༧',
    'ཟླ་༨',
    'ཟླ་༩',
    'ཟླ་༡༠',
    'ཟླ་༡༡',
    'ཟླ་༡༢',
  ],
  'STANDALONEMONTHS': <dynamic>[
    'ཟླ་༡',
    'ཟླ་༢',
    'ཟླ་༣',
    'ཟླ་༤',
    'ཟླ་༥',
    'ཟླ་༦',
    'ཟླ་༧',
    'ཟླ་༨',
    'ཟླ་༩',
    'ཟླ་༡༠',
    'ཟླ་༡༡',
    'ཟླ་༡༢',
  ],
  'SHORTMONTHS': <dynamic>[
    'ཟླ་༡',
    'ཟླ་༢',
    'ཟླ་༣',
    'ཟླ་༤',
    'ཟླ་༥',
    'ཟླ་༦',
    'ཟླ་༧',
    'ཟླ་༨',
    'ཟླ་༩',
    'ཟླ་༡༠',
    'ཟླ་༡༡',
    'ཟླ་༡༢',
  ],
  'STANDALONESHORTMONTHS': <dynamic>[
    'ཟླ་༡',
    'ཟླ་༢',
    'ཟླ་༣',
    'ཟླ་༤',
    'ཟླ་༥',
    'ཟླ་༦',
    'ཟླ་༧',
    'ཟླ་༨',
    'ཟླ་༩',
    'ཟླ་༡༠',
    'ཟླ་༡༡',
    'ཟླ་༡༢',
  ],
  'WEEKDAYS': <dynamic>[
    'ཉི་མ་',
    'ཟླ་བ་',
    'མིག་དམར་',
    'ལྷག་པ་',
    'ཕུར་བུ་',
    'པ་སངས་',
    'སྤེན་པ་',
  ],
  'STANDALONEWEEKDAYS': <dynamic>[
    'ཉི་མ་',
    'ཟླ་བ་',
    'མིག་དམར་',
    'ལྷག་པ་',
    'ཕུར་བུ་',
    'པ་སངས་',
    'སྤེན་པ་',
  ],
  'SHORTWEEKDAYS': <dynamic>[
    'ཉི་མ་',
    'ཟླ་བ་',
    'མིག་དམར་',
    'ལྷག་པ་',
    'ཕུར་བུ་',
    'པ་སངས་',
    'སྤེན་པ་',
  ],
  'STANDALONESHORTWEEKDAYS': <dynamic>[
    'ཉི་མ་',
    'ཟླ་བ་',
    'མིག་དམར་',
    'ལྷག་པ་',
    'ཕུར་བུ་',
    'པ་སངས་',
    'སྤེན་པ་',
  ],
  'NARROWWEEKDAYS': <dynamic>[
    'ཉི',
    'ཟླ',
    'མིག',
    'ལྷག',
    'ཕུར',
    'སངས',
    'སྤེན',
  ],
  'STANDALONENARROWWEEKDAYS': <dynamic>[
    'ཉི',
    'ཟླ',
    'མིག',
    'ལྷག',
    'ཕུར',
    'སངས',
    'སྤེན',
  ],
  'SHORTQUARTERS': <dynamic>[
    'དུས་ཚིགས་དང་པོ།',
    'དུས་ཚིགས་གཉིས་པ།',
    'དུས་ཚིགས་གསུམ་པ།',
    'དུས་ཚིགས་བཞི་པ།',
  ],
  'QUARTERS': <dynamic>[
    'དུས་ཚིགས་དང་པོ།',
    'དུས་ཚིགས་གཉིས་པ།',
    'དུས་ཚིགས་གསུམ་པ།',
    'དུས་ཚིགས་བཞི་པ།',
  ],
  'AMPMS': <dynamic>[
    'a.m.',
    'p.m.',
  ],
  'DATEFORMATS': <dynamic>[
    'EEEE d. MMMM y',
    'd. MMMM y',
    'd. MMM y',
    'dd.MM.y',
  ],
  'TIMEFORMATS': <dynamic>[
    'HH:mm:ss zzzz',
    'HH:mm:ss z',
    'HH:mm:ss',
    'HH:mm',
  ],
  'AVAILABLEFORMATS': null,
  'FIRSTDAYOFWEEK': 0,
  'WEEKENDRANGE': <dynamic>[
    5,
    6,
  ],
  'FIRSTWEEKCUTOFFDAY': 3,
  'DATETIMEFORMATS': <dynamic>[
    '{1} {0}',
    '{1} \'kl\'. {0}',
    '{1}, {0}',
    '{1}, {0}',
  ],
};

// #docregion delegate
class _BoMaterialLocalizationsDelegate extends LocalizationsDelegate<MaterialLocalizations> {
  const _BoMaterialLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'bo';

  @override
  Future<MaterialLocalizations> load(Locale locale) async {
    final String localeName = intl.Intl.canonicalizedLocale(locale.toString());
    // The locale (in this case `bo`) needs to be initialized into the custom
    // date symbols and patterns setup that Flutter uses.
    date_symbol_data_custom.initializeDateFormattingCustom(
      locale: localeName,
      patterns: boLocaleDatePatterns,
      symbols: intl.DateSymbols.deserializeFromMap(boDateSymbols),
    );
    numberFormatSymbols.putIfAbsent(
        "bo",
        () => new NumberSymbols(
            NAME: "bo",
            DECIMAL_SEP: '.',
            GROUP_SEP: ',',
            PERCENT: '%',
            ZERO_DIGIT: '0',
            PLUS_SIGN: '+',
            MINUS_SIGN: '-',
            EXP_SYMBOL: 'E',
            PERMILL: '\u2030',
            INFINITY: '\u221E',
            NAN: 'NaN',
            DECIMAL_PATTERN: '#,##0.###',
            SCIENTIFIC_PATTERN: '#E0',
            PERCENT_PATTERN: '#,##0%',
            CURRENCY_PATTERN: '\u00A4#,##0.00',
            DEF_CURRENCY_CODE: 'USD'));
    compactNumberSymbols.putIfAbsent(
        "bo",
        () => new CompactNumberSymbols(COMPACT_DECIMAL_SHORT_PATTERN: const {
              3: {'other': '0K'},
              6: {'other': '0M'},
              9: {'other': '0B'},
              12: {'other': '0T'},
            }, COMPACT_DECIMAL_LONG_PATTERN: const {
              3: {'other': '0 thousand'},
              6: {'other': '0 million'},
              9: {'other': '0 billion'},
              12: {'other': '0 trillion'},
            }, COMPACT_DECIMAL_SHORT_CURRENCY_PATTERN: const {
              3: {'other': '\u00A40K'},
              6: {'other': '\u00A40M'},
              9: {'other': '\u00A40B'},
              12: {'other': '\u00A40T'},
            }));
    return SynchronousFuture<MaterialLocalizations>(
      BoMaterialLocalizations(
        localeName: localeName,
        // The `intl` library's NumberFormat class is generated from CLDR data
        // (see https://github.com/dart-lang/i18n/blob/main/pkgs/intl/lib/number_symbols_data.dart).
        // Unfortunately, there is no way to use a locale that isn't defined in
        // this map and the only way to work around this is to use a listed
        // locale's NumberFormat symbols. So, here we use the number formats
        // for 'en_US' instead.
        decimalFormat: intl.NumberFormat('#,##0.###', localeName),
        twoDigitZeroPaddedFormat: intl.NumberFormat('00', localeName),
        // DateFormat here will use the symbols and patterns provided in the
        // `date_symbol_data_custom.initializeDateFormattingCustom` call above.
        // However, an alternative is to simply use a supported locale's
        // DateFormat symbols, similar to NumberFormat above.
        fullYearFormat: intl.DateFormat('y', localeName),
        compactDateFormat: intl.DateFormat('yMd', localeName),
        shortDateFormat: intl.DateFormat('yMMMd', localeName),
        mediumDateFormat: intl.DateFormat('EEE, MMM d', localeName),
        longDateFormat: intl.DateFormat('EEEE, MMMM d, y', localeName),
        yearMonthFormat: intl.DateFormat('MMMM y', localeName),
        shortMonthDayFormat: intl.DateFormat('MMM d', localeName),
      ),
    );
  }

  @override
  bool shouldReload(_BoMaterialLocalizationsDelegate old) => false;
}

// #enddocregion delegate
/// A custom set of localizations for the 'bo' locale. In this example, only
/// the value for openAppDrawerTooltip was modified to use a custom message as
/// an example. Everything else uses the American English (en_US) messages
/// and formatting.
class BoMaterialLocalizations extends GlobalMaterialLocalizations {
  const BoMaterialLocalizations({
    super.localeName = 'bo',
    required super.fullYearFormat,
    required super.compactDateFormat,
    required super.shortDateFormat,
    required super.mediumDateFormat,
    required super.longDateFormat,
    required super.yearMonthFormat,
    required super.shortMonthDayFormat,
    required super.decimalFormat,
    required super.twoDigitZeroPaddedFormat,
  });

  static const LocalizationsDelegate<MaterialLocalizations> delegate = _BoMaterialLocalizationsDelegate();

  @override
  String get aboutListTileTitleRaw => r'About $applicationName';

  @override
  String get alertDialogLabel => 'Alert';

  @override
  String get anteMeridiemAbbreviation => 'AM';

  @override
  String get backButtonTooltip => 'Back';

  @override
  String get bottomSheetLabel => 'Bottom Sheet';

  @override
  String get calendarModeButtonLabel => 'Switch to calendar';

  @override
  String get cancelButtonLabel => 'རྩིས་མེད།';

  @override
  String get closeButtonLabel => 'Close';

  @override
  String get closeButtonTooltip => 'Close';

  @override
  String get collapsedHint => 'Expanded';

  @override
  String get collapsedIconTapHint => 'Expand';

  @override
  String get continueButtonLabel => 'Continue';

  @override
  String get copyButtonLabel => 'Copy';

  @override
  String get currentDateLabel => 'Today';

  @override
  String get cutButtonLabel => 'Cut';

  @override
  String get dateHelpText => 'mm/dd/yyyy';

  @override
  String get dateInputLabel => 'Enter Date';

  @override
  String get dateOutOfRangeLabel => 'Out of range.';

  @override
  String get datePickerHelpText => 'Select date';

  @override
  String get dateRangeEndDateSemanticLabelRaw => r'End date $fullDate';

  @override
  String get dateRangeEndLabel => 'End Date';

  @override
  String get dateRangePickerHelpText => 'Select range';

  @override
  String get dateRangeStartDateSemanticLabelRaw => r'Start date $fullDate';

  @override
  String get dateRangeStartLabel => 'Start Date';

  @override
  String get dateSeparator => '/';

  @override
  String get deleteButtonTooltip => 'Delete';

  @override
  String get dialModeButtonLabel => 'Switch to dial picker mode';

  @override
  String get dialogLabel => 'Dialog';

  @override
  String get drawerLabel => 'Navigation menu';

  @override
  String get expandedHint => 'Collapsed';

  @override
  String get expandedIconTapHint => 'Collapse';

  @override
  String get expansionTileCollapsedHint => 'double tap to expand';

  @override
  String get expansionTileCollapsedTapHint => 'Expand for more details';

  @override
  String get expansionTileExpandedHint => 'double tap to collapse';

  @override
  String get expansionTileExpandedTapHint => 'Collapse';

  @override
  String get firstPageTooltip => 'First page';

  @override
  String get hideAccountsLabel => 'Hide accounts';

  @override
  String get inputDateModeButtonLabel => 'Switch to input';

  @override
  String get inputTimeModeButtonLabel => 'Switch to text input mode';

  @override
  String get invalidDateFormatLabel => 'Invalid format.';

  @override
  String get invalidDateRangeLabel => 'Invalid range.';

  @override
  String get invalidTimeLabel => 'Enter a valid time';

  @override
  String get keyboardKeyAlt => 'Alt';

  @override
  String get keyboardKeyAltGraph => 'AltGr';

  @override
  String get keyboardKeyBackspace => 'Backspace';

  @override
  String get keyboardKeyCapsLock => 'Caps Lock';

  @override
  String get keyboardKeyChannelDown => 'Channel Down';

  @override
  String get keyboardKeyChannelUp => 'Channel Up';

  @override
  String get keyboardKeyControl => 'Ctrl';

  @override
  String get keyboardKeyDelete => 'Del';

  @override
  String get keyboardKeyEject => 'Eject';

  @override
  String get keyboardKeyEnd => 'End';

  @override
  String get keyboardKeyEscape => 'Esc';

  @override
  String get keyboardKeyFn => 'Fn';

  @override
  String get keyboardKeyHome => 'Home';

  @override
  String get keyboardKeyInsert => 'Insert';

  @override
  String get keyboardKeyMeta => 'Meta';

  @override
  String get keyboardKeyMetaMacOs => 'Command';

  @override
  String get keyboardKeyMetaWindows => 'Win';

  @override
  String get keyboardKeyNumLock => 'Num Lock';

  @override
  String get keyboardKeyNumpad0 => 'Num 0';

  @override
  String get keyboardKeyNumpad1 => 'Num 1';

  @override
  String get keyboardKeyNumpad2 => 'Num 2';

  @override
  String get keyboardKeyNumpad3 => 'Num 3';

  @override
  String get keyboardKeyNumpad4 => 'Num 4';

  @override
  String get keyboardKeyNumpad5 => 'Num 5';

  @override
  String get keyboardKeyNumpad6 => 'Num 6';

  @override
  String get keyboardKeyNumpad7 => 'Num 7';

  @override
  String get keyboardKeyNumpad8 => 'Num 8';

  @override
  String get keyboardKeyNumpad9 => 'Num 9';

  @override
  String get keyboardKeyNumpadAdd => 'Num +';

  @override
  String get keyboardKeyNumpadComma => 'Num ,';

  @override
  String get keyboardKeyNumpadDecimal => 'Num .';

  @override
  String get keyboardKeyNumpadDivide => 'Num /';

  @override
  String get keyboardKeyNumpadEnter => 'Num Enter';

  @override
  String get keyboardKeyNumpadEqual => 'Num =';

  @override
  String get keyboardKeyNumpadMultiply => 'Num *';

  @override
  String get keyboardKeyNumpadParenLeft => 'Num (';

  @override
  String get keyboardKeyNumpadParenRight => 'Num )';

  @override
  String get keyboardKeyNumpadSubtract => 'Num -';

  @override
  String get keyboardKeyPageDown => 'PgDown';

  @override
  String get keyboardKeyPageUp => 'PgUp';

  @override
  String get keyboardKeyPower => 'Power';

  @override
  String get keyboardKeyPowerOff => 'Power Off';

  @override
  String get keyboardKeyPrintScreen => 'Print Screen';

  @override
  String get keyboardKeyScrollLock => 'Scroll Lock';

  @override
  String get keyboardKeySelect => 'Select';

  @override
  String get keyboardKeyShift => 'Shift';

  @override
  String get keyboardKeySpace => 'Space';

  @override
  String get lastPageTooltip => 'Last page';

  @override
  String? get licensesPackageDetailTextFew => null;

  @override
  String? get licensesPackageDetailTextMany => null;

  @override
  String? get licensesPackageDetailTextOne => '1 license';

  @override
  String get licensesPackageDetailTextOther => r'$licenseCount licenses';

  @override
  String? get licensesPackageDetailTextTwo => null;

  @override
  String? get licensesPackageDetailTextZero => 'No licenses';

  @override
  String get licensesPageTitle => 'Licenses';

  @override
  String get lookUpButtonLabel => 'Look Up';

  @override
  String get menuBarMenuLabel => 'Menu bar menu';

  @override
  String get menuDismissLabel => 'Dismiss menu';

  @override
  String get modalBarrierDismissLabel => 'Dismiss';

  @override
  String get moreButtonTooltip => 'More';

  @override
  String get nextMonthTooltip => 'Next month';

  @override
  String get nextPageTooltip => 'Next page';

  @override
  String get okButtonLabel => 'OK';

  @override
  String get openAppDrawerTooltip => 'Open navigation menu';

  @override
  String get pageRowsInfoTitleRaw => r'$firstRow–$lastRow of $rowCount';

  @override
  String get pageRowsInfoTitleApproximateRaw => r'$firstRow–$lastRow of about $rowCount';

  @override
  String get pasteButtonLabel => 'Paste';

  @override
  String get popupMenuLabel => 'Popup menu';

  @override
  String get postMeridiemAbbreviation => 'PM';

  @override
  String get previousMonthTooltip => 'Previous month';

  @override
  String get previousPageTooltip => 'Previous page';

  @override
  String get refreshIndicatorSemanticLabel => 'Refresh';

  @override
  String? get remainingTextFieldCharacterCountFew => null;

  @override
  String? get remainingTextFieldCharacterCountMany => null;

  @override
  String? get remainingTextFieldCharacterCountOne => '1 character remaining';

  @override
  String get remainingTextFieldCharacterCountOther => r'$remainingCount characters remaining';

  @override
  String? get remainingTextFieldCharacterCountTwo => null;

  @override
  String? get remainingTextFieldCharacterCountZero => 'No characters remaining';

  @override
  String get reorderItemDown => 'Move down';

  @override
  String get reorderItemLeft => 'Move left';

  @override
  String get reorderItemRight => 'Move right';

  @override
  String get reorderItemToEnd => 'Move to the end';

  @override
  String get reorderItemToStart => 'Move to the start';

  @override
  String get reorderItemUp => 'Move up';

  @override
  String get rowsPerPageTitle => 'Rows per page:';

  @override
  String get saveButtonLabel => 'Save';

  @override
  String get scanTextButtonLabel => 'Scan text';

  @override
  String get scrimLabel => 'Scrim';

  @override
  String get scrimOnTapHintRaw => r'Close $modalRouteContentName';

  @override
  ScriptCategory get scriptCategory => ScriptCategory.englishLike;

  @override
  String get searchFieldLabel => 'Search';

  @override
  String get searchWebButtonLabel => 'Search Web';

  @override
  String get selectAllButtonLabel => 'Select all';

  @override
  String get selectYearSemanticsLabel => 'Select year';

  @override
  String? get selectedRowCountTitleFew => null;

  @override
  String? get selectedRowCountTitleMany => null;

  @override
  String? get selectedRowCountTitleOne => '1 item selected';

  @override
  String get selectedRowCountTitleOther => r'$selectedRowCount items selected';

  @override
  String? get selectedRowCountTitleTwo => null;

  @override
  String? get selectedRowCountTitleZero => 'No items selected';

  @override
  String get shareButtonLabel => 'Share...';

  @override
  String get showAccountsLabel => 'Show accounts';

  @override
  String get showMenuTooltip => 'Show menu';

  @override
  String get signedInLabel => 'Signed in';

  @override
  String get tabLabelRaw => r'Tab $tabIndex of $tabCount';

  @override
  TimeOfDayFormat get timeOfDayFormatRaw => TimeOfDayFormat.h_colon_mm_space_a;

  @override
  String get timePickerDialHelpText => 'Select time';

  @override
  String get timePickerHourLabel => 'Hour';

  @override
  String get timePickerHourModeAnnouncement => 'Select hours';

  @override
  String get timePickerInputHelpText => 'Enter time';

  @override
  String get timePickerMinuteLabel => 'Minute';

  @override
  String get timePickerMinuteModeAnnouncement => 'Select minutes';

  @override
  String get unspecifiedDate => 'Date';

  @override
  String get unspecifiedDateRange => 'Date Range';

  @override
  String get viewLicensesButtonLabel => 'View licenses';

  @override
  String get clearButtonTooltip => 'Clear text';

  @override
  String get selectedDateLabel => 'Selected';
}
