import '../../feature/store/view_model/product_model.dart';

Map<String, List<ProductModel>> dairyEggsMap = {
  "Milk": [
    ProductModel(
      "Lactaid Fat Free Pure Milk",
      15.0,
      "20 mg",
      "https://cdn.grofers.com/cdn-cgi/image/f=auto,fit=scale-down,q=70,metadata=none,w=270/da/cms-assets/cms/product/9a4088cc-db19-4add-b3ce-2edd4d09f4ae.png",
    ),
    ProductModel(
      "Organic Whole Milk",
      12.5,
      "1 L",
      "https://cdn.grofers.com/cdn-cgi/image/f=auto,fit=scale-down,q=70,metadata=none,w=270/da/cms-assets/cms/product/8b6b5194-6eaa-4db2-9257-2d27ad931303.png",
    ),
  ],
  "Eggs": [
    ProductModel(
      "Farm Fresh Brown Eggs",
      8.0,
      "12 pcs",
      "https://example.com/eggs1.png",
    ),
    ProductModel(
      "Organic White Eggs",
      10.0,
      "6 pcs",
      "https://example.com/eggs2.png",
    ),
  ],
  "Butter & Cheese": [
    ProductModel(
      "Unsalted Butter",
      5.5,
      "200 g",
      "https://example.com/butter.png",
    ),
    ProductModel(
      "Cheddar Cheese Slices",
      7.0,
      "150 g",
      "https://example.com/cheese.png",
    ),
  ],
};

// --- SNACKS ---
Map<String, List<ProductModel>> snacks = {
  "Chips & Crisps": [
    ProductModel("Classic Salted Potato Chips", 3.50, "150 g", "https://example.com/chips1.png"),
    ProductModel("Nacho Cheese Tortilla Chips", 4.00, "180 g", "https://example.com/chips2.png"),
  ],
  "Biscuits & Cookies": [
    ProductModel("Chocolate Chip Cookies", 5.25, "250 g", "https://example.com/cookies.png"),
    ProductModel("Digestive Biscuits", 3.00, "400 g", "https://example.com/biscuits.png"),
  ],
  "Healthy Snacks": [
    ProductModel("Roasted Almonds", 12.00, "200 g", "https://example.com/almonds.png"),
    ProductModel("Mixed Berry Granola Bar", 6.50, "6 pcs", "https://example.com/granola.png"),
  ],
};

// --- SEAFOOD ---
Map<String, List<ProductModel>> seafood = {
  "Fish": [
    ProductModel("Fresh Atlantic Salmon Fillet", 22.00, "500 g", "https://example.com/salmon.png"),
    ProductModel("Whole Sea Bass", 18.50, "800 g", "https://example.com/seabass.png"),
  ],
  "Shellfish": [
    ProductModel("Tiger Prawns (Jumbo)", 25.00, "1 kg", "https://example.com/prawns.png"),
    ProductModel("Fresh Blue Mussels", 14.00, "500 g", "https://example.com/mussels.png"),
  ],
};

// --- FROZEN FOODS ---
Map<String, List<ProductModel>> frozenFoods = {
  "Ready to Eat": [
    ProductModel("Frozen Pepperoni Pizza", 11.00, "450 g", "https://example.com/pizza.png"),
    ProductModel("Chicken Nuggets Family Pack", 15.00, "1 kg", "https://example.com/nuggets.png"),
  ],
  "Vegetables": [
    ProductModel("Frozen Garden Peas", 4.50, "500 g", "https://example.com/peas.png"),
    ProductModel("Mixed Stir-fry Veggies", 5.00, "750 g", "https://example.com/vegmix.png"),
  ],
  "Ice Cream": [
    ProductModel("Vanilla Bean Tub", 7.50, "1 L", "https://example.com/vanilla.png"),
    ProductModel("Chocolate Fudge Bars", 6.00, "4 pcs", "https://example.com/chocobar.png"),
  ],
};