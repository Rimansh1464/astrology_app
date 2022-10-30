import 'package:astrology_app/utils/colors.dart';
import 'package:flutter/cupertino.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDark = true;
  late Color primaryDark = primary;
  late Color primaryDark1 = primary2;
  late Color primaryDark3 = primary3;

  void changeTheme() {
    isDark = !isDark;
    notifyListeners();
  }

  void changDark() {
    primaryDark = isDark == true ? primary : darkprimary;
    primaryDark1 = isDark == true ? primary2 : darkprimary2;
    primaryDark3 = isDark == true ? primary3 : darkprimary2;

    notifyListeners();
  }
}
