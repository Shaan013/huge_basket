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

  /// `Hello World`
  String get helloWorld {
    return Intl.message('Hello World', name: 'helloWorld', desc: '', args: []);
  }

  /// `Huge Basket`
  String get appName {
    return Intl.message('Huge Basket', name: 'appName', desc: '', args: []);
  }

  /// `Huge Basket`
  String get hugeBasket {
    return Intl.message('Huge Basket', name: 'hugeBasket', desc: '', args: []);
  }

  /// `Naxt delivery on Wed , 14 Nov 2020`
  String get naxtDeliveryOnWed14Nov2020 {
    return Intl.message(
      'Naxt delivery on Wed , 14 Nov 2020',
      name: 'naxtDeliveryOnWed14Nov2020',
      desc: '',
      args: [],
    );
  }

  /// `Add More Details`
  String get addMoreDetails {
    return Intl.message(
      'Add More Details',
      name: 'addMoreDetails',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message('Add', name: 'add', desc: '', args: []);
  }

  /// `business Name`
  String get businessName {
    return Intl.message(
      'business Name',
      name: 'businessName',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get firstName {
    return Intl.message('First Name', name: 'firstName', desc: '', args: []);
  }

  /// `Last Name`
  String get lastName {
    return Intl.message('Last Name', name: 'lastName', desc: '', args: []);
  }

  /// `Email Address`
  String get emailAddress {
    return Intl.message(
      'Email Address',
      name: 'emailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Zipcode`
  String get zipcode {
    return Intl.message('Zipcode', name: 'zipcode', desc: '', args: []);
  }

  /// `please agree wiht T&C`
  String get pleaseAgreeWihtTc {
    return Intl.message(
      'please agree wiht T&C',
      name: 'pleaseAgreeWihtTc',
      desc: '',
      args: [],
    );
  }

  /// `I agree to The`
  String get iAgreeToThe {
    return Intl.message(
      'I agree to The',
      name: 'iAgreeToThe',
      desc: '',
      args: [],
    );
  }

  /// `Terms & Condition`
  String get termsCondition {
    return Intl.message(
      'Terms & Condition',
      name: 'termsCondition',
      desc: '',
      args: [],
    );
  }

  /// `Verification code has been send on your registered mobile number. Enter Verification code here`
  String get verificationCodeHasBeenSendOnYourRegisteredMobileNumber {
    return Intl.message(
      'Verification code has been send on your registered mobile number. Enter Verification code here',
      name: 'verificationCodeHasBeenSendOnYourRegisteredMobileNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please enter phone number`
  String get pleaseEnterPhoneNumber {
    return Intl.message(
      'Please enter phone number',
      name: 'pleaseEnterPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Phone number too short`
  String get phoneNumberTooShort {
    return Intl.message(
      'Phone number too short',
      name: 'phoneNumberTooShort',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `More`
  String get more {
    return Intl.message('More', name: 'more', desc: '', args: []);
  }

  /// `Choose your Category`
  String get chooseYourCategory {
    return Intl.message(
      'Choose your Category',
      name: 'chooseYourCategory',
      desc: '',
      args: [],
    );
  }

  /// `View All`
  String get viewAll {
    return Intl.message('View All', name: 'viewAll', desc: '', args: []);
  }

  /// `All Reviews`
  String get allReviewsReviewcount {
    return Intl.message(
      'All Reviews',
      name: 'allReviewsReviewcount',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message('Skip', name: 'skip', desc: '', args: []);
  }

  /// `Go`
  String get go {
    return Intl.message('Go', name: 'go', desc: '', args: []);
  }

  /// `Next`
  String get next {
    return Intl.message('Next', name: 'next', desc: '', args: []);
  }

  /// `About Us`
  String get aboutUs {
    return Intl.message('About Us', name: 'aboutUs', desc: '', args: []);
  }

  /// `Reviews`
  String get reviews {
    return Intl.message('Reviews', name: 'reviews', desc: '', args: []);
  }

  /// `Store Details`
  String get storeDetails {
    return Intl.message(
      'Store Details',
      name: 'storeDetails',
      desc: '',
      args: [],
    );
  }

  /// `Product Details`
  String get productDetails {
    return Intl.message(
      'Product Details',
      name: 'productDetails',
      desc: '',
      args: [],
    );
  }

  /// `Add to Card`
  String get addToCard {
    return Intl.message('Add to Card', name: 'addToCard', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Manage Address`
  String get manageAddress {
    return Intl.message(
      'Manage Address',
      name: 'manageAddress',
      desc: '',
      args: [],
    );
  }

  /// `Add New`
  String get addNew {
    return Intl.message('Add New', name: 'addNew', desc: '', args: []);
  }

  /// `Add New Address`
  String get addNewAddress {
    return Intl.message(
      'Add New Address',
      name: 'addNewAddress',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message('Address', name: 'address', desc: '', args: []);
  }

  /// `Delivery Instruction`
  String get deliveryInstruction {
    return Intl.message(
      'Delivery Instruction',
      name: 'deliveryInstruction',
      desc: '',
      args: [],
    );
  }

  /// `State`
  String get state {
    return Intl.message('State', name: 'state', desc: '', args: []);
  }

  /// `City`
  String get city {
    return Intl.message('City', name: 'city', desc: '', args: []);
  }

  /// `Enter Unit Number`
  String get enterUnitNumber {
    return Intl.message(
      'Enter Unit Number',
      name: 'enterUnitNumber',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[Locale.fromSubtags(languageCode: 'en')];
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
