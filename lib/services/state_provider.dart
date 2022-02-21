import 'package:flutter/cupertino.dart';
import 'package:gstin_app/models/gst_model.dart';
import 'package:gstin_app/services/error_handling.dart';
import 'package:gstin_app/services/gst_service.dart';

enum AppState {
  initial,
  loading,
  loaded,
}

class StateNotifier extends ChangeNotifier {
  final _gstService = GstService();
  AppState _state = AppState.initial;
  AppState get state => _state;
  late String _id;

  String get gstId => _id;
  void setGstId(String id) {
    _id = id;
    notifyListeners();
  }

  void _setState(AppState state) {
    _state = state;
    notifyListeners();
  }

  late GstModel _gstModel;
  GstModel get gstModel => _gstModel;
  void _setGstModel(GstModel gstModel) {
    _gstModel = gstModel;
    notifyListeners();
  }

  late GstReturnStatus _gstReturnStatus;
  GstReturnStatus get gstReturnStatus => _gstReturnStatus;
  void _setGstReturnStatus(GstReturnStatus gstReturnStatus) {
    _gstReturnStatus = gstReturnStatus;
    notifyListeners();
  }

  Failure? _failure;
  Failure? get failure => _failure;
  void _setFailure(Failure failure) {
    _failure = failure;
    notifyListeners();
  }

  void getGstDetails() async {
    _setState(AppState.loading);
    try {
      final GstModel gstModel = await _gstService.getGstDetails(_id);
      _setGstModel(gstModel);
    } on Failure catch (f) {
      _setFailure(f);
    }
    _setState(AppState.loaded);
  }

  void getReturnDetails() async {
    _setState(AppState.loading);
    try {
      final GstReturnStatus gstReturnStatus =
          await _gstService.getReturnDetails(_id);
      _setGstReturnStatus(gstReturnStatus);
    } on Failure catch (f) {
      _setFailure(f);
    }
    _setState(AppState.loaded);
  }
}
