import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/features/community/presentation/manager/community_view_model.dart';
import 'package:recipe_app/features/community/presentation/pages/community_view.dart';
import 'package:recipe_app/features/home_page/presentation/manager/home_page_view_model.dart';
import 'package:recipe_app/features/home_page/presentation/pages/home_page.dart';
import 'package:recipe_app/features/notifications/presentation/manager/notification_bloc.dart';
import 'package:recipe_app/features/notifications/presentation/pages/notifications_view.dart';
import 'package:recipe_app/features/profile/presentation/manager/chef_profile_view_model.dart';
import 'package:recipe_app/features/profile/presentation/manager/me_profile_view_model.dart';
import 'package:recipe_app/features/profile/presentation/pages/chef_profile_view.dart';
import 'package:recipe_app/features/recipe_detail/presentation/manager/recipe_view_model.dart';
import 'package:recipe_app/features/recipe_detail/presentation/pages/recipe_view.dart';
import 'package:recipe_app/features/reviews/presentation/manager/create_review_bloc.dart';
import 'package:recipe_app/features/reviews/presentation/manager/reviews_bloc.dart';
import 'package:recipe_app/features/reviews/presentation/pages/create_review_view.dart';
import 'package:recipe_app/features/reviews/presentation/pages/reviews_page.dart';
import 'package:recipe_app/features/your_recipes/presentation/manager/your_recipes_bloc.dart';
import 'package:recipe_app/features/your_recipes/presentation/pages/your_recipes.dart';
import 'package:recipe_app/main.dart';
import '../../features/auth/presentation/manager/auth_view_model.dart';
import '../../features/auth/presentation/pages/auth_page.dart';
import '../../features/auth/presentation/pages/signUpView.dart';
import '../../features/categories/presentation/manager/categories_cubit.dart';
import '../../features/categories/presentation/pages/categories_view.dart';
import '../../features/category_detail/presentation/manager/category_detail_view_model.dart';
import '../../features/category_detail/presentation/pages/category_detail_view.dart';
import '../../features/onboarding/presentation/manager/onboarding_view_model.dart';
import '../../features/onboarding/presentation/pages/onboarding_view.dart';
import '../../features/onboarding/presentation/pages/onboarding_welcome.dart';
import '../../features/profile/presentation/pages/me_profile_view.dart';
import '../../features/top_chef/presentation/manager/top_chef_bloc.dart';
import '../../features/top_chef/presentation/pages/top_chefs_view.dart';
import '../../features/trending_recipes/presentation/manager/trending_recipe_bloc.dart';
import '../../features/trending_recipes/presentation/pages/trending_recipe_view.dart';
import 'routes.dart';

final GoRouter router = GoRouter(
  navigatorKey: navigatorKey,
  //initialLocation: Routes.topChef,
  //initialLocation: Routes.trendingRecipe,
  //initialLocation: Routes.notifications,
  initialLocation: Routes.homePage,
  routes: [
    GoRoute(
      path: Routes.onboarding,
      builder: (context, state) {
        bool back = bool.parse(state.uri.queryParameters["back"] ?? "false");
        return OnboardingView(
          viewModel: OnboardingViewModel(
              repo: context.read(), cateRepo: context.read(), back: back),
        );
      },
    ),
    GoRoute(
      path: Routes.chefProfile,
      builder: (context, state) => ChangeNotifierProvider(
        create: (context) => ChefProfileViewModel(
            userRepo: context.read(),
            userId: int.parse(state.pathParameters["userId"]!),
            recipeRepo: context.read()),
        child: ChefProfileView(),
      ),
    ),
    GoRoute(
      path: Routes.meProfile,
      builder: (context, state) => ChangeNotifierProvider(
        create: (context) => MeProfileViewModel(
          userRepo: context.read(),
          recipeRepo: context.read(),
        ),
        child: MeProfileView(),
      ),
    ),
    GoRoute(
        path: Routes.welcome,
        builder: (context, state) => OnboardingWelcome(
              viewModel: OnboardingViewModel(
                  repo: context.read(), cateRepo: context.read()),
            )),
    GoRoute(
      path: Routes.categories,
      builder: (context, state) => BlocProvider(
        create: (context) => CategoriesBloc(
          repo: context.read(),
        ),
        child: CategoriesView(),
      ),
    ),
    GoRoute(
        path: Routes.categoryDetail,
        builder: (context, state) {
          final int categoryId =
              int.tryParse(state.pathParameters["categoryId"] ?? "1") ?? 1;
          return CategoryDetailView(
            categoryId: categoryId,
            viewModel: CategoryDetailViewModel(
                repo: context.read(),
                categoryId: categoryId,
                cateRepo: context.read()),
          );
        }),
    GoRoute(
      path: Routes.login,
      name: Routes.login,
      builder: (context, state) => AuthView(
        vm: AuthViewModel(authRepo: context.read()),
      ),
    ),
    GoRoute(
      path: "/signUp",
      builder: (context, state) => SignUpView(),
    ),
    GoRoute(
      path: Routes.recipe,
      builder: (context, state) => ChangeNotifierProvider(
        create: (context) => RecipeViewModel(
          repo: context.read(),
          recipeId: int.parse(state.pathParameters["recipeId"]!),
        ),
        child: RecipeView(),
      ),
    ),
    GoRoute(
      path: Routes.homePage,
      builder: (context, state) => ChangeNotifierProvider(
        create: (context) => HomePageViewModel(
            recipeRepo: context.read(),
            categoryRepo: context.read(),
            userRepo: context.read()),
        child: HomePage(),
      ),
    ),
    GoRoute(
      path: Routes.community,
      builder: (context, state) => ChangeNotifierProvider(
        create: (context) => CommunityViewModel(
          repo: context.read(),
        ),
        child: CommunityView(),
      ),
    ),
    GoRoute(
      path: Routes.reviews,
      builder: (context, state) => BlocProvider(
        create: (context) => ReviewsBloc(
            recipeRepo: context.read(),
            reviewRepo: context.read(),
            recipeId: int.parse(state.pathParameters["recipeId"]!)),
        child: ReviewsPage(),
      ),
    ),
    GoRoute(
      path: Routes.topChef,
      builder: (context, state) => BlocProvider(
        create: (context) => TopChefsBloc(chefRepo: context.read()),
        child: TopChefsView(),
      ),
    ),
    GoRoute(
      path: Routes.createReviews,
      builder: (context, state) => BlocProvider(
        create: (context) => CreateReviewBloc(
          recipeRepo: context.read(),
          reviewRepo: context.read(),
          recipeId: int.parse(state.pathParameters["recipeId"]!),
        ),
        child: CreateReviewView(),
      ),
    ),
    GoRoute(
      path: Routes.trendingRecipe,
      builder: (context, state) => BlocProvider(
        create: (context) => TrendingRecipeBloc(
          recipeRepo: context.read(),
        ),
        child: TrendingRecipeView(),
      ),
    ),
    GoRoute(
      path: Routes.yourRecipes,
      builder: (context, state) => BlocProvider(
        create: (context) => YourRecipesBloc(
          repo: context.read(),
        ),
        child: YourRecipes(),
      ),
    )
  ],
);
