class MyIcons {
  static const String categories = 'assets/icons/bottom/categories.png';
  static const String heart = 'assets/icons/bottom/heart.png';
  static const String home = 'assets/icons/bottom/home.png';
  static const String search = 'assets/icons/bottom/search.png';

  static const String diamond = 'assets/icons/home_recipe/diamond.png';
  static const String star = 'assets/icons/home_recipe/star.png';

  static const String cheese = 'assets/icons/categories/cheese.png';
  static const String chocolate = 'assets/icons/categories/chocolate.png';
  static const String exotic = 'assets/icons/categories/exotic.png';
  static const String fruit = 'assets/icons/categories/fruit.png';
  static const String grill = 'assets/icons/categories/grill.png';
  static const String italian = 'assets/icons/categories/italian.png';
  static const String japan = 'assets/icons/categories/japan.png';
  static const String seafood = 'assets/icons/categories/seafood.png';
  static const String spicy = 'assets/icons/categories/spicy.png';
  static const String vegan = 'assets/icons/categories/vegan.png';

  static const String back = 'assets/icons/recipe/back.png';
  static const String clock = 'assets/icons/recipe/clock.png';
  static const String money = 'assets/icons/recipe/money.png';
  static const String recipeBook = 'assets/icons/recipe/recipe_book.png';
  static const String alarm = 'assets/icons/recipe/alarm.png';
  static const String favoriteOutline = 'assets/icons/recipe/favorite_outline.png';
  static const String favoriteFull = 'assets/icons/recipe/favorite_full.png';

  static const String veganType = 'assets/icons/results/vegan.png';
  static const String healthy = 'assets/icons/results/healthy.png';
  static const String cheap = 'assets/icons/results/cheap.png';
  static const String popular = 'assets/icons/results/popular.png';
  static const String clockResults = 'assets/icons/results/clock.png';

  static const String delete = 'assets/icons/search/delete.png';
  static const String ingredients = 'assets/icons/search/ingredients.png';
  static const String minus = 'assets/icons/search/minus.png';
  static const String plus = 'assets/icons/search/plus.png';
  static const String timer = 'assets/icons/search/timer.png';

  // Illustration icons
  static const String resultsPan = 'assets/icons/illustrations/pan.png';
  static const String favoritesPan = 'assets/icons/illustrations/pan2.png';
  static const String spatula = 'assets/icons/illustrations/spatula.png';
  static const String spatula2 = 'assets/icons/illustrations/spatula2.png';
  static const String spatula3 = 'assets/icons/illustrations/spatula3.png';
  static const String cheese2 = 'assets/icons/illustrations/cheese2.png';
  static const String cupcake = 'assets/icons/illustrations/cupcake.png';
  static const String egg = 'assets/icons/illustrations/egg.png';
  static const String friedEgg = 'assets/icons/illustrations/fried_egg.png';
  static const String honeyDipper = 'assets/icons/illustrations/honey_dipper.png';
  static const String milkBottle = 'assets/icons/illustrations/milk_bottle.png';
  static const String recipeBook2 = 'assets/icons/illustrations/recipe_book2.png';
  static const String cuttingBoard = 'assets/icons/illustrations/cutting_board.png';
  static const String mixer = 'assets/icons/illustrations/mixer.png';
  static const String biscuit = 'assets/icons/illustrations/biscuit.png';
  static const String whisk = 'assets/icons/illustrations/whisk.png';

  static List<String> illustrationIcons = <String>[
    resultsPan,
    favoritesPan,
    spatula,
    spatula2,
    spatula3,
    cheese2,
    cupcake,
    egg,
    friedEgg,
    honeyDipper,
    milkBottle,
    recipeBook2,
    cuttingBoard,
    mixer,
    biscuit,
    whisk,
  ];

  static String get randomIllustration => (illustrationIcons..shuffle()).first;
}
