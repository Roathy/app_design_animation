class Theme {
  bool _darkTheme = false;
  bool _customTheme = false;

  bool get darkTheme => _darkTheme;
  set darkTheme(bool state) {
    _darkTheme = state;
    _customTheme = false;
  }

  bool get customTheme => _customTheme;
  set customTheme(bool state) {
    _customTheme = state;
    _darkTheme = false;
  }
}
