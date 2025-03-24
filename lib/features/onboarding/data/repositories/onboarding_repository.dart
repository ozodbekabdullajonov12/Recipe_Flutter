import 'package:recipe_app/core/client.dart';
import 'package:recipe_app/features/onboarding/data/models/onboarding_model.dart';

class OnboardingRepository {
  OnboardingRepository({required this.client});

  final ApiClient client;

  List<OnboardingModel> onboardings = [];

  Future<List<OnboardingModel>> fetchOnboardingPages() async {
    if (onboardings.isNotEmpty) return onboardings;
    var rawPages = await client.fetchOnboardingPages();
    onboardings = rawPages.map((page) => OnboardingModel.fromJson(page)).toList();
    onboardings.sort(
          (a, b) {
        if (a.order < b.order) {
          return -1;
        } else if (a.order > b.order) {
          return 1;
        } else {
          return 0;
        }
      },
    );
    return onboardings;
  }
}
