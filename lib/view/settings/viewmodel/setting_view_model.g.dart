// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SettingsViewModel on _SettingsViewModelBase, Store {
  late final _$appLocaleAtom =
      Atom(name: '_SettingsViewModelBase.appLocale', context: context);

  @override
  Locale get appLocale {
    _$appLocaleAtom.reportRead();
    return super.appLocale;
  }

  @override
  set appLocale(Locale value) {
    _$appLocaleAtom.reportWrite(value, super.appLocale, () {
      super.appLocale = value;
    });
  }

  late final _$_SettingsViewModelBaseActionController =
      ActionController(name: '_SettingsViewModelBase', context: context);

  @override
  void changeAppLocalization(Locale? locale) {
    final _$actionInfo = _$_SettingsViewModelBaseActionController.startAction(
        name: '_SettingsViewModelBase.changeAppLocalization');
    try {
      return super.changeAppLocalization(locale);
    } finally {
      _$_SettingsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
appLocale: ${appLocale}
    ''';
  }
}
