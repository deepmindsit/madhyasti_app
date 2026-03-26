// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:madhya/presentation/auth/controller/login_controller.dart'
    as _i539;
import 'package:madhya/presentation/auth/controller/onboarding_controller.dart'
    as _i20;
import 'package:madhya/presentation/auth/controller/otp_controller.dart'
    as _i593;
import 'package:madhya/presentation/auth/controller/register_controller.dart'
    as _i335;
import 'package:madhya/presentation/home/controller/home_controller.dart'
    as _i109;
import 'package:madhya/presentation/mailbox/controller/chat_controller.dart'
    as _i212;
import 'package:madhya/presentation/matches/controller/match_controller.dart'
    as _i742;
import 'package:madhya/presentation/navigation/controller/navigation_controller.dart'
    as _i272;
import 'package:madhya/presentation/others_profile/controller/other_profile_controller.dart'
    as _i1019;
import 'package:madhya/presentation/profile/controller/interest_controller.dart'
    as _i598;
import 'package:madhya/presentation/profile/controller/profile_controller.dart'
    as _i951;
import 'package:madhya/presentation/profile/controller/shortlist_controller.dart'
    as _i148;
import 'package:madhya/presentation/profile/controller/viewed_controller.dart'
    as _i977;
import 'package:madhya/presentation/splash/controller/splash_controller.dart'
    as _i572;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i539.LoginController>(() => _i539.LoginController());
    gh.lazySingleton<_i20.AuthController>(() => _i20.AuthController());
    gh.lazySingleton<_i593.OtpController>(() => _i593.OtpController());
    gh.lazySingleton<_i335.RegisterController>(
      () => _i335.RegisterController(),
    );
    gh.lazySingleton<_i109.HomeController>(() => _i109.HomeController());
    gh.lazySingleton<_i212.ChatController>(() => _i212.ChatController());
    gh.lazySingleton<_i742.MatchController>(() => _i742.MatchController());
    gh.lazySingleton<_i272.NavigationController>(
      () => _i272.NavigationController(),
    );
    gh.lazySingleton<_i1019.OtherProfileController>(
      () => _i1019.OtherProfileController(),
    );
    gh.lazySingleton<_i598.InterestController>(
      () => _i598.InterestController(),
    );
    gh.lazySingleton<_i951.ProfileController>(() => _i951.ProfileController());
    gh.lazySingleton<_i148.ShortlistController>(
      () => _i148.ShortlistController(),
    );
    gh.lazySingleton<_i977.ViewedController>(() => _i977.ViewedController());
    gh.lazySingleton<_i572.SplashController>(() => _i572.SplashController());
    return this;
  }
}
