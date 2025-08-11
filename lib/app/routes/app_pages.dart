import 'package:get/get.dart';

import '../modules/authentication/bindings/authentication_binding.dart';
import '../modules/authentication/views/authentication_view.dart';
import '../modules/camera/bindings/camera_binding.dart';
import '../modules/camera/views/camera_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/how_to_use_scan/bindings/how_to_use_scan_binding.dart';
import '../modules/how_to_use_scan/views/how_to_use_scan_view.dart';
import '../modules/my_scan_details/bindings/my_scan_details_binding.dart';
import '../modules/my_scan_details/views/my_scan_details_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/privacy_policy/bindings/privacy_policy_binding.dart';
import '../modules/privacy_policy/views/privacy_policy_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/setting/bindings/setting_binding.dart';
import '../modules/setting/views/setting_view.dart';
import '../modules/terms_and_condition/bindings/terms_and_condition_binding.dart';
import '../modules/terms_and_condition/views/terms_and_condition_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.ONBOARDING;

  static final routes = [
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.AUTHENTICATION,
      page: () => const AuthenticationView(),
      binding: AuthenticationBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.HOW_TO_USE_SCAN,
      page: () => const HowToUseScanView(),
      binding: HowToUseScanBinding(),
    ),
    GetPage(
      name: _Paths.CAMERA,
      page: () => const CameraView(),
      binding: CameraBinding(),
    ),
    GetPage(
      name: _Paths.MY_SCAN_DETAILS,
      page: () => const MyScanDetailsView(),
      binding: MyScanDetailsBinding(),
    ),
    GetPage(
      name: _Paths.SETTING,
      page: () => const SettingView(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: _Paths.PRIVACY_POLICY,
      page: () => const PrivacyPolicyView(),
      binding: PrivacyPolicyBinding(),
    ),
    GetPage(
      name: _Paths.TERMS_AND_CONDITION,
      page: () => const TermsAndConditionView(),
      binding: TermsAndConditionBinding(),
    ),
  ];
}
