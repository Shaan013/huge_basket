import 'package:huge_basket/feature/store/view_model/category_enum.dart';

import '../../feature/store/view_model/category_model.dart';

List<CategoryModel> categoryList = [
  CategoryModel(
    category: CategoryEnum.dairyEggs,
    name: "Dairy & Eggs",
    image: "https://cdn-icons-png.flaticon.com/512/3050/3050158.png",
  ),

  CategoryModel(
    category: CategoryEnum.snacks,
    name: "Snacks",
    image: "https://cdn-icons-png.flaticon.com/512/2553/2553691.png",
  ),

  CategoryModel(
    category: CategoryEnum.seafood,
    name: "Seafood",
    image: "https://cdn-icons-png.flaticon.com/512/1046/1046784.png",
  ),

  CategoryModel(
    category: CategoryEnum.frozenFoods,
    name: "Frozen Foods",
    image: "https://cdn-icons-png.flaticon.com/512/1046/1046857.png",
  ),

  CategoryModel(
    category: CategoryEnum.fruits,
    name: "Fruits",
    image: "https://cdn-icons-png.flaticon.com/512/3194/3194591.png",
  ),

  CategoryModel(
    category: CategoryEnum.vegetables,
    name: "Vegetables",
    image: "https://cdn-icons-png.flaticon.com/512/2153/2153788.png",
  ),
];
