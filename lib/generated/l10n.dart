// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `1.0`
  String get version {
    return Intl.message('1.0', name: 'version', desc: '', args: []);
  }

  /// `Mini Cart`
  String get appTitle {
    return Intl.message('Mini Cart', name: 'appTitle', desc: '', args: []);
  }

  /// `Added to cart`
  String get itemAddedMessage {
    return Intl.message(
      'Added to cart',
      name: 'itemAddedMessage',
      desc: '',
      args: [],
    );
  }

  /// `Item Removed Successfully`
  String get deleteItemMessage {
    return Intl.message(
      'Item Removed Successfully',
      name: 'deleteItemMessage',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yesMessage {
    return Intl.message('Yes', name: 'yesMessage', desc: '', args: []);
  }

  /// `No`
  String get noMessage {
    return Intl.message('No', name: 'noMessage', desc: '', args: []);
  }

  /// `Remove Item`
  String get removeItemTitle {
    return Intl.message(
      'Remove Item',
      name: 'removeItemTitle',
      desc: '',
      args: [],
    );
  }

  /// `Product List`
  String get productTitle {
    return Intl.message(
      'Product List',
      name: 'productTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your Cart`
  String get yourCartTitle {
    return Intl.message('Your Cart', name: 'yourCartTitle', desc: '', args: []);
  }

  /// ` Your Cart is Empty`
  String get YourCartIsEmptyMessage {
    return Intl.message(
      ' Your Cart is Empty',
      name: 'YourCartIsEmptyMessage',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to remove this item from the cart?`
  String get deleteItemConfirmationMessage {
    return Intl.message(
      'Are you sure you want to remove this item from the cart?',
      name: 'deleteItemConfirmationMessage',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong`
  String get errorGeneric {
    return Intl.message(
      'Something went wrong',
      name: 'errorGeneric',
      desc: '',
      args: [],
    );
  }

  /// `Add To Cart`
  String get buttonAddToCart {
    return Intl.message(
      'Add To Cart',
      name: 'buttonAddToCart',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
