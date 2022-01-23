import 'package:mobx/mobx.dart';

part 'web_menu_store.g.dart';

class WebMenuStore = WebMenuStoreBase with _$WebMenuStore;

abstract class WebMenuStoreBase with Store {

  @observable
  int selectedIndex = 0;

  @observable
  List<String> menuItems = ['Home', 'Newsletter', 'About Us', 'Store', 'Courses'];

  @action
  void updateIndex(int newIndex){
    selectedIndex = newIndex;
  }


}
