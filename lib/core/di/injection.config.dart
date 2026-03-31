// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:madhya/core/exporters/app_export.dart' as _i571;
import 'package:madhya/core/network/api_service.dart' as _i466;
import 'package:madhya/core/network/register_module.dart' as _i571;
import 'package:madhya/presentation/auth/controller/login_controller.dart'
    as _i539;
import 'package:madhya/presentation/auth/controller/onboarding_controller.dart'
    as _i20;
import 'package:madhya/presentation/auth/controller/otp_controller.dart'
    as _i593;
import 'package:madhya/presentation/auth/controller/register_controller.dart'
    as _i335;
import 'package:madhya/presentation/global_search/controller/global_search_controller.dart'
    as _i337;
import 'package:madhya/presentation/home/controller/home_controller.dart'
    as _i109;
import 'package:madhya/presentation/mailbox/controller/chat_controller.dart'
    as _i212;
import 'package:madhya/presentation/matches/controller/match_controller.dart'
    as _i742;
import 'package:madhya/presentation/navigation/controller/navigation_controller.dart'
    as _i272;
import 'package:madhya/presentation/others_profile/controller/interest_controller.dart'
    as _i958;
import 'package:madhya/presentation/others_profile/controller/other_profile_controller.dart'
    as _i1019;
import 'package:madhya/presentation/others_profile/controller/shortlist_controller.dart'
    as _i711;
import 'package:madhya/presentation/others_profile/controller/viewed_controller.dart'
    as _i224;
import 'package:madhya/presentation/profile/controller/manage_photos_controller.dart'
    as _i261;
import 'package:madhya/presentation/profile/controller/profile_controller.dart'
    as _i951;
import 'package:madhya/presentation/splash/controller/splash_controller.dart'
    as _i572;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i571.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i20.AuthController>(() => _i20.AuthController());
    gh.lazySingleton<_i337.GlobalSearchController>(
      () => _i337.GlobalSearchController(),
    );
    gh.lazySingleton<_i212.ChatController>(() => _i212.ChatController());
    gh.lazySingleton<_i742.MatchController>(() => _i742.MatchController());
    gh.lazySingleton<_i272.NavigationController>(
      () => _i272.NavigationController(),
    );
    gh.lazySingleton<_i958.InterestController>(
      () => _i958.InterestController(),
    );
    gh.lazySingleton<_i1019.OtherProfileController>(
      () => _i1019.OtherProfileController(),
    );
    gh.lazySingleton<_i711.ShortlistController>(
      () => _i711.ShortlistController(),
    );
    gh.lazySingleton<_i224.ViewedController>(() => _i224.ViewedController());
    gh.lazySingleton<_i261.ManagePhotosController>(
      () => _i261.ManagePhotosController(),
    );
    gh.lazySingleton<_i951.ProfileController>(() => _i951.ProfileController());
    gh.lazySingleton<_i572.SplashController>(() => _i572.SplashController());
    gh.lazySingleton<_i109.HomeController>(
      () => _i109.HomeController(gh<_i571.HomeUsecase>()),
    );
    gh.lazySingleton<_i539.LoginController>(
      () => _i539.LoginController(gh<_i571.LoginUsecase>()),
    );
    gh.factory<_i466.ApiService>(() => _i466.ApiService(gh<_i361.Dio>()));
    gh.lazySingleton<_i593.OtpController>(
      () => _i593.OtpController(gh<_i571.VerifyOtpUsecase>()),
    );
    gh.lazySingleton<_i335.RegisterController>(
      () => _i335.RegisterController(
        gh<_i571.CommonDataUsecase>(),
        gh<_i571.RegisterUsecase>(),
        gh<_i571.CasteByRelUsecase>(),
        gh<_i571.SubCasteByCasteUsecase>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i571.RegisterModule {}
