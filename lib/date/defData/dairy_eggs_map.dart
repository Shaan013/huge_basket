import '../modals/address_model.dart';

// --- DAIRY, BREAD & EGGS ---
Map<String, List<ProductModel>> dairyEggsMap = {
  "Milk": [
    ProductModel(
      id: 101,
      name: "Amul Taaza Toned Milk",
      price: 54.0,
      weight: "1 L",
      imageUrl:
          "https://cdn.grofers.com/cdn-cgi/image/f=auto,fit=scale-down,q=70,metadata=none,w=360/app/images/products/full_screen/pro_391465.jpg",
    ),
    ProductModel(
      id: 102,
      name: "Mother Dairy Full Cream Milk",
      price: 66.0,
      weight: "1 L",
      imageUrl:
          "https://cdn.grofers.com/cdn-cgi/image/f=auto,fit=scale-down,q=70,metadata=none,w=360/app/images/products/full_screen/pro_160.jpg",
    ),
    ProductModel(
      id: 103,
      name: "Nestle A+ Slim Milk",
      price: 95.0,
      weight: "1 L",
      imageUrl:
          "https://cdn-icons-png.flaticon.com/512/1046/1046857.png",
    ),
  ],
  "Butter & Cheese": [
    ProductModel(
      id: 201,
      name: "Amul Butter",
      price: 52.0,
      weight: "100 g",
      imageUrl:
          "https://cdn.grofers.com/cdn-cgi/image/f=auto,fit=scale-down,q=70,metadata=none,w=360/app/images/products/full_screen/pro_16.jpg",
    ),
    ProductModel(
      id: 202,
      name: "Amul Cheese Slices",
      price: 155.0,
      weight: "200 g",
      imageUrl:
          "https://cdn.grofers.com/cdn-cgi/image/f=auto,fit=scale-down,q=70,metadata=none,w=360/app/images/products/full_screen/pro_103.jpg",
    ),
    ProductModel(
      id: 203,
      name: "Britannia Cheese Block",
      price: 135.0,
      weight: "200 g",
      imageUrl:
          "https://cdn.grofers.com/cdn-cgi/image/f=auto,fit=scale-down,q=70,metadata=none,w=360/app/images/products/full_screen/pro_102.jpg",
    ),
  ],
};

// --- FRUITS & VEGETABLES ---
Map<String, List<ProductModel>> freshProduce = {
  "Vegetables": [
    ProductModel(
      id: 301,
      name: "Hybrid Tomato",
      price: 35.0,
      weight: "500 g",
      imageUrl:
          "https://cdn.grofers.com/cdn-cgi/image/f=auto,fit=scale-down,q=70,metadata=none,w=360/app/images/products/full_screen/pro_444534.jpg",
    ),
    ProductModel(
      id: 302,
      name: "Onion",
      price: 48.0,
      weight: "1 kg",
      imageUrl:
          "https://cdn.grofers.com/cdn-cgi/image/f=auto,fit=scale-down,q=70,metadata=none,w=360/app/images/products/full_screen/pro_3911.jpg",
    ),
    ProductModel(
      id: 303,
      name: "Potato / Aloo",
      price: 32.0,
      weight: "1 kg",
      imageUrl:
          "https://cdn.grofers.com/cdn-cgi/image/f=auto,fit=scale-down,q=70,metadata=none,w=360/app/images/products/full_screen/pro_3902.jpg",
    ),
  ],
  "Fruits": [
    ProductModel(
      id: 401,
      name: "Banana (Robusta)",
      price: 45.0,
      weight: "6 pcs",
      imageUrl:
          "https://cdn.grofers.com/cdn-cgi/image/f=auto,fit=scale-down,q=70,metadata=none,w=360/app/images/products/full_screen/pro_448373.jpg",
    ),
    ProductModel(
      id: 402,
      name: "Royal Gala Apple",
      price: 180.0,
      weight: "4 pcs",
      imageUrl:
          "https://cdn.grofers.com/cdn-cgi/image/f=auto,fit=scale-down,q=70,metadata=none,w=360/app/images/products/full_screen/pro_444454.jpg",
    ),
  ],
};

// --- BEVERAGES ---
Map<String, List<ProductModel>> beverages = {
  "Soft Drinks": [
    ProductModel(
      id: 501,
      name: "Coca-Cola Soft Drink",
      price: 40.0,
      weight: "750 ml",
      imageUrl:
          "https://cdn.grofers.com/cdn-cgi/image/f=auto,fit=scale-down,q=70,metadata=none,w=360/app/images/products/full_screen/pro_16035.jpg",
    ),
    ProductModel(
      id: 502,
      name: "Sprite Lime Flavor",
      price: 40.0,
      weight: "750 ml",
      imageUrl:
          "https://cdn.grofers.com/cdn-cgi/image/f=auto,fit=scale-down,q=70,metadata=none,w=360/app/images/products/full_screen/pro_241551.jpg",
    ),
  ],
  "Tea & Coffee": [
    ProductModel(
      id: 601,
      name: "Tata Tea Gold",
      price: 165.0,
      weight: "250 g",
      imageUrl:
          "https://cdn.grofers.com/cdn-cgi/image/f=auto,fit=scale-down,q=70,metadata=none,w=360/app/images/products/full_screen/pro_124.jpg",
    ),
    ProductModel(
      id: 602,
      name: "Nescafe Classic Coffee",
      price: 185.0,
      weight: "50 g",
      imageUrl:
          "https://cdn.grofers.com/cdn-cgi/image/f=auto,fit=scale-down,q=70,metadata=none,w=360/app/images/products/full_screen/pro_111.jpg",
    ),
  ],
};

Map<String, List<ProductModel>> snackList = {
  "Chips & Crisps": [
    ProductModel(
      id: 701,
      name: "Lay's Classic Salted Chips",
      price: 20.0,
      weight: "50 g",
      imageUrl:
          "https://cdn.grofers.com/cdn-cgi/image/f=auto,fit=scale-down,q=70,metadata=none,w=360/app/images/products/full_screen/pro_111.jpg",
    ),
    ProductModel(
      id: 702,
      name: "Doritos Cheese Nachos",
      price: 50.0,
      weight: "80 g",
      imageUrl:
          "https://cdn.grofers.com/cdn-cgi/image/f=auto,fit=scale-down,q=70,metadata=none,w=360/app/images/products/full_screen/pro_323490.jpg",
    ),
    ProductModel(
      id: 703,
      name: "Pringles Potato Chips",
      price: 105.0,
      weight: "107 g",
      imageUrl:
          "https://cdn.grofers.com/cdn-cgi/image/f=auto,fit=scale-down,q=70,metadata=none,w=360/app/images/products/full_screen/pro_241551.jpg",
    ),
  ],
  "Biscuits & Cookies": [
    ProductModel(
      id: 801,
      name: "Oreo Vanilla Cream Biscuits",
      price: 40.0,
      weight: "120 g",
      imageUrl:
          "https://cdn.grofers.com/cdn-cgi/image/f=auto,fit=scale-down,q=70,metadata=none,w=360/app/images/products/full_screen/pro_111.jpg",
    ),
    ProductModel(
      id: 802,
      name: "Parle-G Gold Biscuits",
      price: 10.0,
      weight: "110 g",
      imageUrl:
          "https://cdn.grofers.com/cdn-cgi/image/f=auto,fit=scale-down,q=70,metadata=none,w=360/app/images/products/full_screen/pro_284419.jpg",
    ),
  ],
};
Map<String, List<ProductModel>> frozenfoodList = {
  "Ready to Eat": [
    ProductModel(
      id: 901,
      name: "McCain French Fries",
      price: 120.0,
      weight: "450 g",
      imageUrl:
          "https://cdn.grofers.com/cdn-cgi/image/f=auto,fit=scale-down,q=70,metadata=none,w=360/app/images/products/full_screen/pro_16035.jpg",
    ),
    ProductModel(
      id: 902,
      name: "ITC Master Chef Chicken Nuggets",
      price: 195.0,
      weight: "250 g",
      imageUrl:
          "https://cdn.grofers.com/cdn-cgi/image/f=auto,fit=scale-down,q=70,metadata=none,w=360/app/images/products/full_screen/pro_367295.jpg",
    ),
  ],
  "Ice Cream": [
    ProductModel(
      id: 1001,
      name: "Amul Vanilla Magic Ice Cream",
      price: 180.0,
      weight: "1 L",
      imageUrl:
          "https://cdn.grofers.com/cdn-cgi/image/f=auto,fit=scale-down,q=70,metadata=none,w=360/app/images/products/full_screen/pro_241551.jpg",
    ),
    ProductModel(
      id: 1002,
      name: "Kwality Walls Choco Feast",
      price: 40.0,
      weight: "60 ml",
      imageUrl:
          "https://cdn.grofers.com/cdn-cgi/image/f=auto,fit=scale-down,q=70,metadata=none,w=360/app/images/products/full_screen/pro_385086.jpg",
    ),
  ],
};
