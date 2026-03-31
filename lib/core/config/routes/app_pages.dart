import 'package:madhya/presentation/auth/binding/login_bindings.dart';
import 'package:madhya/presentation/auth/binding/otp_binding.dart';
import 'package:madhya/presentation/auth/binding/register_bindings.dart';
import 'package:madhya/presentation/global_search/view/global_search.dart';
import 'package:madhya/presentation/home/bindings/home_bindings.dart';
import 'package:madhya/presentation/profile/widget/edit_profile_content/about_me_edit.dart';
import 'package:madhya/presentation/profile/widget/edit_profile_content/basic_details_edit.dart';
import 'package:madhya/presentation/profile/widget/edit_profile_content/family_details_edit.dart';
import 'package:madhya/presentation/profile/widget/edit_profile_content/horoscope_details_edit.dart';
import 'package:madhya/presentation/profile/widget/edit_profile_content/location_details_edit.dart';
import 'package:madhya/presentation/profile/widget/edit_profile_content/professional_details_edit.dart';
import 'package:madhya/presentation/profile/widget/edit_profile_content/religion_details_edit.dart';
import 'package:madhya/presentation/profile/widget/manage_photos.dart';
import 'package:madhya/presentation/profile/widget/partner_preference.dart';
import 'package:madhya/presentation/profile/widget/partner_preference/partner_basic_details_edit.dart';
import 'package:madhya/presentation/profile/widget/partner_preference/partner_professional_details_edit.dart';
import 'package:madhya/presentation/profile/widget/partner_preference/partner_religion_details_edit.dart';
import '../../../presentation/profile/widget/partner_preference/partner_location_details_edit.dart';
import '../../exporters/app_export.dart';

class AppPages {
  static final routes = [
    GetPage(name: Routes.splash, page: () => SplashPage()),
    GetPage(name: Routes.onboarding, page: () => OnboardingScreen()),
    GetPage(
      name: Routes.login,
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.verifyOTP,
      page: () => VerifyOTPScreen(),
      binding: OtpBinding(),
    ),
    GetPage(name: Routes.registerScreen, page: () => RegisterScreen(),binding: RegisterBindings()),
    GetPage(name: Routes.addProfile, page: () => ProfileAdd()),
    GetPage(name: Routes.mainScreen, page: () => NavigationScreen(),binding: HomeBindings()),
    GetPage(name: Routes.searchScreen, page: () => GlobalSearch()),
    GetPage(name: Routes.othersProfile, page: () => OtherProfile()),
    GetPage(name: Routes.chatDetails, page: () => ChatDetails()),
    GetPage(name: Routes.chatProfileDetails, page: () => ChatUserProfile()),
    GetPage(name: Routes.shortList, page: () => Shortlist()),
    GetPage(name: Routes.viewed, page: () => Viewed()),
    GetPage(name: Routes.interest, page: () => Interest()),
    GetPage(name: Routes.editProfile, page: () => EditProfile()),
    GetPage(name: Routes.managePhotos, page: () => ManagePhotos()),
    GetPage(name: Routes.basicDetailsEdit, page: () => BasicDetailsEdit()),
    GetPage(name: Routes.aboutMeEdit, page: () => AboutMeEdit()),

    GetPage(
      name: Routes.professionalDetailsEdit,
      page: () => ProfessionalDetailsEdit(),
    ),
    GetPage(
      name: Routes.religionDetailsEdit,
      page: () => ReligionDetailsEdit(),
    ),
    GetPage(
      name: Routes.locationDetailsEdit,
      page: () => LocationDetailsEdit(),
    ),
    GetPage(name: Routes.familyDetailsEdit, page: () => FamilyDetailsEdit()),
    GetPage(
      name: Routes.horoscopeDetailsEdit,
      page: () => HoroscopeDetailsEdit(),
    ),
    GetPage(name: Routes.partnerPreference, page: () => PartnerPreference()),
    GetPage(
      name: Routes.partnerBasicDetailsEdit,
      page: () => PartnerBasicDetailsEdit(),
    ),
    GetPage(
      name: Routes.partnerProfessionalDetailsEdit,
      page: () => PartnerProfessionalDetailsEdit(),
    ),
    GetPage(
      name: Routes.partnerReligionDetailsEdit,
      page: () => PartnerReligionDetailsEdit(),
    ),
    GetPage(
      name: Routes.partnerLocationDetailsEdit,
      page: () => PartnerLocationDetailsEdit(),
    ),
  ];
}
