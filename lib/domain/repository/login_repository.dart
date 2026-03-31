import '../../core/exporters/app_export.dart';

abstract class AuthRepository {
  Future<dynamic> login(LoginRequest number);

  Future<dynamic> verifyOTP(VerifyOtpRequest request);

  Future<dynamic> getCommonData();

  Future<dynamic> register(RegisterRequest request);

  Future<dynamic> casteByReligion(CasteRequest religionId);

  Future<dynamic> subCasteByCaste(SubCasteRequest casteId);
}
