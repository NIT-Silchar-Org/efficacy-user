
import 'package:efficacy_user/utils/enums.dart';
import 'package:flutter/foundation.dart';

class BaseModel with ChangeNotifier {
  ViewState _state = ViewState.idle;

  ViewState get state => _state;

  set state(ViewState viewState) {
    debugPrint('State:$viewState');
    _state = viewState;
    notifyListeners();
  }

  void update() {
    debugPrint('calling listener');
    notifyListeners();
  }
}