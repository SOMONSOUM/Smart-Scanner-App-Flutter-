import 'package:crud_app/utils/Icons.dart';

enum BottomMenu {
  home,
  category,
  new_arrival,
  account,
  more,
}

String menuItemName(BottomMenu layoutType) {
  switch (layoutType) {
    case BottomMenu.home:
      return 'Home';
    case BottomMenu.category:
      return 'Category';
    case BottomMenu.new_arrival:
      return 'New Arrival';
    case BottomMenu.account:
      return 'Account';
    case BottomMenu.more:
      return 'More';
    default:
      return '';
  }
}

menuIcon(BottomMenu layoutType) {
  switch (layoutType) {
    case BottomMenu.home:
      return iosHome;
    case BottomMenu.category:
      return iosCategory;
    case BottomMenu.new_arrival:
      return iosNewArrival;
    case BottomMenu.account:
      return iosAccount;
    case BottomMenu.more:
      return iosMore;
    default:
      return null;
  }
}
