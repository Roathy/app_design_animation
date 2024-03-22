import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'floating_menu_provider.g.dart';

@riverpod
class CurrentBtn extends _$CurrentBtn {
  @override
  int build() => 0;

  void setCurrentBtn(int index) {
    state = index;
  }
}
