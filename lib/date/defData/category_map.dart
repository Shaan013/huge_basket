import 'package:huge_basket/feature/store/view_model/category_enum.dart';
import 'package:huge_basket/date/defData/dairy_eggs_map.dart';

Map<CategoryEnum, Map> categoryMap = {
  CategoryEnum.dairyEggs: dairyEggsMap,
  CategoryEnum.snacks: snackList,
  CategoryEnum.frozenFoods: frozenfoodList,
  // CategoryEnum.seafood: seafood
};