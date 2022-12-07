// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reciepes.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ReciepesStore on ReciepesStoreState, Store {
  late final _$dataAtom =
      Atom(name: 'ReciepesStoreState.data', context: context);

  @override
  List<Reciepe> get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(List<Reciepe> value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  late final _$inProgressAtom =
      Atom(name: 'ReciepesStoreState.inProgress', context: context);

  @override
  bool get inProgress {
    _$inProgressAtom.reportRead();
    return super.inProgress;
  }

  @override
  set inProgress(bool value) {
    _$inProgressAtom.reportWrite(value, super.inProgress, () {
      super.inProgress = value;
    });
  }

  late final _$isFetchedAtom =
      Atom(name: 'ReciepesStoreState.isFetched', context: context);

  @override
  bool get isFetched {
    _$isFetchedAtom.reportRead();
    return super.isFetched;
  }

  @override
  set isFetched(bool value) {
    _$isFetchedAtom.reportWrite(value, super.isFetched, () {
      super.isFetched = value;
    });
  }

  late final _$ReciepesStoreStateActionController =
      ActionController(name: 'ReciepesStoreState', context: context);

  @override
  void storeReciepes(List<Reciepe> reciepes) {
    final _$actionInfo = _$ReciepesStoreStateActionController.startAction(
        name: 'ReciepesStoreState.storeReciepes');
    try {
      return super.storeReciepes(reciepes);
    } finally {
      _$ReciepesStoreStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void loadReciepes(bool indicator) {
    final _$actionInfo = _$ReciepesStoreStateActionController.startAction(
        name: 'ReciepesStoreState.loadReciepes');
    try {
      return super.loadReciepes(indicator);
    } finally {
      _$ReciepesStoreStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
data: ${data},
inProgress: ${inProgress},
isFetched: ${isFetched}
    ''';
  }
}
