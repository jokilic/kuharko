class MyIcons {
  static const categories = 'assets/icons/bottom/categories.png';
  static const heart = 'assets/icons/bottom/heart.png';
  static const home = 'assets/icons/bottom/home.png';
  static const search = 'assets/icons/bottom/search.png';

  static const diamond = 'assets/icons/home_recipe/diamond.png';
  static const star = 'assets/icons/home_recipe/star.png';

  static const cheese = 'assets/icons/categories/cheese.png';
  static const chocolate = 'assets/icons/categories/chocolate.png';
  static const exotic = 'assets/icons/categories/exotic.png';
  static const fruit = 'assets/icons/categories/fruit.png';
  static const grill = 'assets/icons/categories/grill.png';
  static const italian = 'assets/icons/categories/italian.png';
  static const japan = 'assets/icons/categories/japan.png';
  static const seafood = 'assets/icons/categories/seafood.png';
  static const spicy = 'assets/icons/categories/spicy.png';
  static const vegan = 'assets/icons/categories/vegan.png';

  static const back = 'assets/icons/recipe/back.png';
  static const clock = 'assets/icons/recipe/clock.png';
  static const money = 'assets/icons/recipe/money.png';
  static const recipeBook = 'assets/icons/recipe/recipe_book.png';
  static const alarm = 'assets/icons/recipe/alarm.png';
  static const favoriteOutline = 'assets/icons/recipe/favorite_outline.png';
  static const favoriteFull = 'assets/icons/recipe/favorite_full.png';

  static const veganType = 'assets/icons/results/vegan.png';
  static const healthy = 'assets/icons/results/healthy.png';
  static const cheap = 'assets/icons/results/cheap.png';
  static const popular = 'assets/icons/results/popular.png';
  static const clockResults = 'assets/icons/results/clock.png';

  static const delete = 'assets/icons/search/delete.png';
  static const ingredients = 'assets/icons/search/ingredients.png';
  static const minus = 'assets/icons/search/minus.png';
  static const plus = 'assets/icons/search/plus.png';
  static const timer = 'assets/icons/search/timer.png';

  // Illustration icons
  static const resultsPan = 'assets/icons/illustrations/pan.png';
  static const favoritesPan = 'assets/icons/illustrations/pan2.png';
  static const spatula = 'assets/icons/illustrations/spatula.png';
  static const spatula2 = 'assets/icons/illustrations/spatula2.png';
  static const spatula3 = 'assets/icons/illustrations/spatula3.png';
  static const cheese2 = 'assets/icons/illustrations/cheese2.png';
  static const cupcake = 'assets/icons/illustrations/cupcake.png';
  static const egg = 'assets/icons/illustrations/egg.png';
  static const friedEgg = 'assets/icons/illustrations/fried_egg.png';
  static const honeyDipper = 'assets/icons/illustrations/honey_dipper.png';
  static const milkBottle = 'assets/icons/illustrations/milk_bottle.png';
  static const recipeBook2 = 'assets/icons/illustrations/recipe_book2.png';
  static const cuttingBoard = 'assets/icons/illustrations/cutting_board.png';
  static const mixer = 'assets/icons/illustrations/mixer.png';
  static const biscuit = 'assets/icons/illustrations/biscuit.png';
  static const whisk = 'assets/icons/illustrations/whisk.png';

  static const illustrationIcons = [
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

  static String get randomIllustration => (List.from(illustrationIcons)..shuffle()).first;
}
