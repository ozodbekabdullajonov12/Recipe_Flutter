class Routes {
  static const login = "/login";
  static const onboarding = "/onboarding";
  static const chefProfile = "/user/:userId";
  static const welcome = "/welcome";
  static const categories = "/categories";
  static const categoryDetail = "/category/detail/:categoryId";
  static const signUp = "/signUp";
  static const recipe = "/recipe/:recipeId";
  static const homePage = "/";
  static const meProfile = "/me-profile";
  static const community = "/community";
  static const String reviews = "/reviews/:recipeId";
  static String createReviews = "/create-review/:recipeId";
  static const String topChef = '/top-chef';
  static const String trendingRecipe = '/trending-recipe';
  static const String notifications = '/notifications';
  static const String yourRecipes="/your-recipes";
  static String chefProfileBuilder(int id) => "/user/$id";

  static String recipeBuilder(int id, [String? title]) => "/recipe/$id";

  static String categoryDetailBuilder(int id) => "/category/detail/$id";

  static  String reviewsBuilder(int recipeId)=>"/reviews/$recipeId";

  static  String createReviewsBuilder(int recipeId)=>"/create-review/$recipeId";
}
