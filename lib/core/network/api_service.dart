import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:madhya/core/constants/api_constants.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'api_service.g.dart';

@RestApi()
@injectable
abstract class ApiService {
  @factoryMethod
  factory ApiService(Dio dio) = _ApiService;

  @POST(ApiConstants.login)
  Future<dynamic> loginUser(@Part(name: "mobile_no") String mobileNumber);

  @POST(ApiConstants.verifyOTP)
  Future<dynamic> verifyOTP(
    @Part(name: "mobile_no") String mobileNumber,
    @Part(name: "otp") String otp,
  );

  @POST(ApiConstants.getCommonData)
  @DioResponseType(ResponseType.plain)
  Future<dynamic> getCommonData();

  @POST(ApiConstants.register)
  @MultiPart()
  Future<dynamic> registerUser(
    @Part(name: "name") String name,
    @Part(name: "mobile_no") String mobileNumber,
    @Part(name: "gender") String gender,
    @Part(name: "birth_date") String birthDate,
    @Part(name: "age") String age,
    @Part(name: "religion") String religion,
    @Part(name: "caste") String caste,
    @Part(name: "sub_caste") String subCaste, {
    @Part(name: 'profile_picture') File? profilePicture,
    @Part(name: 'photos[]') List<MultipartFile>? attachment,
  });

  @POST(ApiConstants.getCasteByReligion)
  Future<dynamic> getCasteByReligion(
    @Part(name: "religion_id") String religionId,
  );

  @POST(ApiConstants.getSubCasteByCaste)
  Future<dynamic> getSubCasteByCaste(@Part(name: "caste_id") String casteId);

  @POST(ApiConstants.home)
  Future<dynamic> getHome(@Part(name: "user_id") String userId);

}
