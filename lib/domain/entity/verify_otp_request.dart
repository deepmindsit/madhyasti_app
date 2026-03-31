class VerifyOtpRequest {
  final String phone;
  final String otp;

  VerifyOtpRequest({required this.phone, required this.otp});

  Map<String, dynamic> toJson() => {"mobile_no": phone, "otp": otp};
}
