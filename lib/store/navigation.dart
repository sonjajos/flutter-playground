import 'package:mobx/mobx.dart';

part 'navigation.g.dart';

class StoredNavigation = StoredNavigationState with _$StoredNavigation;

abstract class StoredNavigationState with Store {
  @observable
  int currentIndex = 0;

  @action
  void selectTab(int index) {
    currentIndex = index;
  }
}

final customNav = StoredNavigation();
