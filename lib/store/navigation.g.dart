// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StoredNavigation on StoredNavigationState, Store {
  late final _$currentIndexAtom =
      Atom(name: 'StoredNavigationState.currentIndex', context: context);

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  late final _$StoredNavigationStateActionController =
      ActionController(name: 'StoredNavigationState', context: context);

  @override
  void selectTab(int index) {
    final _$actionInfo = _$StoredNavigationStateActionController.startAction(
        name: 'StoredNavigationState.selectTab');
    try {
      return super.selectTab(index);
    } finally {
      _$StoredNavigationStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentIndex: ${currentIndex}
    ''';
  }
}
