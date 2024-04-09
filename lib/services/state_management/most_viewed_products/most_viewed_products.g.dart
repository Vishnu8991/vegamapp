// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'most_viewed_products.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MostViewedData on _MostViewedDataBase, Store {
  Computed<Map<String, dynamic>>? _$dataComputed;

  @override
  Map<String, dynamic> get data =>
      (_$dataComputed ??= Computed<Map<String, dynamic>>(() => super.data,
              name: '_MostViewedDataBase.data'))
          .value;
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_MostViewedDataBase.isLoading'))
          .value;
  Computed<bool>? _$hasExceptionsComputed;

  @override
  bool get hasExceptions =>
      (_$hasExceptionsComputed ??= Computed<bool>(() => super.hasExceptions,
              name: '_MostViewedDataBase.hasExceptions'))
          .value;
  Computed<String?>? _$errorMsgComputed;

  @override
  String? get errorMsg =>
      (_$errorMsgComputed ??= Computed<String?>(() => super.errorMsg,
              name: '_MostViewedDataBase.errorMsg'))
          .value;

  late final _$_dataAtom =
      Atom(name: '_MostViewedDataBase._data', context: context);

  @override
  Map<String, dynamic> get _data {
    _$_dataAtom.reportRead();
    return super._data;
  }

  @override
  set _data(Map<String, dynamic> value) {
    _$_dataAtom.reportWrite(value, super._data, () {
      super._data = value;
    });
  }

  late final _$_isLoadingAtom =
      Atom(name: '_MostViewedDataBase._isLoading', context: context);

  @override
  bool get _isLoading {
    _$_isLoadingAtom.reportRead();
    return super._isLoading;
  }

  @override
  set _isLoading(bool value) {
    _$_isLoadingAtom.reportWrite(value, super._isLoading, () {
      super._isLoading = value;
    });
  }

  late final _$_errorMsgAtom =
      Atom(name: '_MostViewedDataBase._errorMsg', context: context);

  @override
  String? get _errorMsg {
    _$_errorMsgAtom.reportRead();
    return super._errorMsg;
  }

  @override
  set _errorMsg(String? value) {
    _$_errorMsgAtom.reportWrite(value, super._errorMsg, () {
      super._errorMsg = value;
    });
  }

  late final _$_hasExceptionsAtom =
      Atom(name: '_MostViewedDataBase._hasExceptions', context: context);

  @override
  bool get _hasExceptions {
    _$_hasExceptionsAtom.reportRead();
    return super._hasExceptions;
  }

  @override
  set _hasExceptions(bool value) {
    _$_hasExceptionsAtom.reportWrite(value, super._hasExceptions, () {
      super._hasExceptions = value;
    });
  }

  late final _$fetchMostViewedDataAsyncAction =
      AsyncAction('_MostViewedDataBase.fetchMostViewedData', context: context);

  @override
  Future<void> fetchMostViewedData(BuildContext context) {
    return _$fetchMostViewedDataAsyncAction
        .run(() => super.fetchMostViewedData(context));
  }

  late final _$_MostViewedDataBaseActionController =
      ActionController(name: '_MostViewedDataBase', context: context);

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_MostViewedDataBaseActionController.startAction(
        name: '_MostViewedDataBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_MostViewedDataBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
data: ${data},
isLoading: ${isLoading},
hasExceptions: ${hasExceptions},
errorMsg: ${errorMsg}
    ''';
  }
}
