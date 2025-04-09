import 'locator.dart';

// part 'global_data.g.dart';

class GlobalData {
  GlobalData() {}

  String _customerEmail = '';
  void resetEmail() {
    _customerEmail = '';
  }

  void setEmail(String email) {
    _customerEmail = email;
  }

  String get getEmail => _customerEmail;
}
