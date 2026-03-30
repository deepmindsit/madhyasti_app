//System//
export 'dart:async';
export 'dart:convert';
export 'package:flutter/material.dart';
export 'package:flutter/services.dart';
export 'package:flutter/gestures.dart';

//Theme//
export 'package:madhya/core/theme/dark_theme.dart';
export 'package:madhya/core/theme/light_theme.dart';
export 'package:madhya/core/theme/app_colors.dart';
export 'package:madhya/core/theme/text_styles.dart';

//Plugins//
export 'package:get/get.dart' hide Response, FormData, MultipartFile;
export 'package:injectable/injectable.dart';
export 'package:flutter_screenutil/flutter_screenutil.dart';
export 'package:ui_package/ui_package.dart'
    hide AppTheme, AppColors, ListTileStyle, AppTextStyles;
export 'package:google_fonts/google_fonts.dart';
export 'package:pinput/pinput.dart';
export 'package:sms_autofill/sms_autofill.dart' hide Orientation;
export 'package:hugeicons/hugeicons.dart';
export 'package:cached_network_image/cached_network_image.dart';
export 'package:carousel_slider/carousel_slider.dart';
export 'package:dotted_border/dotted_border.dart';
export 'package:dio/dio.dart';

//Common//
export 'package:madhya/core/constants/app_constants.dart';
export 'package:madhya/core/config/routes/app_routes.dart';
export 'package:madhya/core/config/routes/app_pages.dart';
export 'package:madhya/core/constants/app_assets.dart';
export 'package:madhya/core/theme/app_theme.dart';
export 'package:madhya/core/utils/logger.dart';
export 'package:madhya/core/di/injection.dart';
export 'package:madhya/presentation/auth/widget/onboarding_component.dart';
export 'package:madhya/core/component/dialogs.dart';
export 'package:madhya/core/utils/common.dart';

//Pages//
export 'package:madhya/presentation/splash/view/splash_screen.dart';
export 'package:madhya/presentation/auth/widget/onboarding_screen.dart';
export 'package:madhya/presentation/auth/view/login_screen.dart';
export 'package:madhya/presentation/auth/view/verify_otp_screen.dart';
export 'package:madhya/presentation/auth/view/register_screen.dart';
export 'package:madhya/presentation/auth/view/profile_add.dart';
export 'package:madhya/presentation/navigation/view/navigation_screen.dart';
export 'package:madhya/presentation/home/view/home_screen.dart';
export 'package:madhya/presentation/matches/view/match_screen.dart';
export 'package:madhya/presentation/others_profile/view/other_profile.dart';
export 'package:madhya/presentation/mailbox/view/mailbox_screen.dart';
export 'package:madhya/presentation/mailbox/widget/chat_details.dart';
export 'package:madhya/presentation/mailbox/widget/chat_user_profile.dart';
export 'package:madhya/presentation/profile/widget/shortlist.dart';
export 'package:madhya/presentation/profile/widget/viewed.dart';
export 'package:madhya/presentation/profile/widget/interest.dart';
export 'package:madhya/presentation/profile/widget/edit_profile.dart';

//Controller//
export 'package:madhya/presentation/splash/controller/splash_controller.dart';
export 'package:madhya/presentation/auth/controller/login_controller.dart';
export 'package:madhya/presentation/auth/controller/otp_controller.dart';
export 'package:madhya/presentation/auth/controller/register_controller.dart';
export 'package:madhya/presentation/auth/controller/onboarding_controller.dart';
export 'package:madhya/presentation/navigation/controller/navigation_controller.dart';
export 'package:madhya/presentation/home/controller/home_controller.dart';
export 'package:madhya/presentation/matches/controller/match_controller.dart';
export 'package:madhya/presentation/others_profile/controller/other_profile_controller.dart';
export 'package:madhya/presentation/mailbox/controller/chat_controller.dart';
export 'package:madhya/presentation/profile/controller/profile_controller.dart';
export 'package:madhya/presentation/others_profile/controller/shortlist_controller.dart';
export 'package:madhya/presentation/others_profile/controller/viewed_controller.dart';
export 'package:madhya/presentation/others_profile/controller/interest_controller.dart';
export 'package:madhya/presentation/profile/controller/manage_photos_controller.dart';
export 'package:madhya/presentation/global_search/controller/global_search_controller.dart';

//Component//
export 'package:madhya/core/component/onboarding_indicator.dart';
export '../../../core/component/app_dropdown.dart';
export 'package:madhya/core/utils/match_card_compact.dart';
export 'package:madhya/core/component/app_slider.dart';
export 'package:madhya/core/utils/match_card_overlay.dart';
export 'package:madhya/core/component/app_icon_buttons.dart';
export 'package:madhya/core/component/app_bottomsheet_layout.dart';
export 'package:madhya/core/component/bottom_header.dart';
export 'package:madhya/presentation/others_profile/widget/contact_bottomsheet.dart';
export 'package:madhya/presentation/others_profile/widget/interested_bottomsheet.dart';
export 'package:madhya/presentation/others_profile/widget/shortlist_bottomsheet.dart';
export 'package:madhya/core/component/app_toggle.dart';
export 'package:madhya/presentation/profile/widget/interest_card.dart';
export 'package:madhya/core/component/custom_appbar.dart';

//Repository//
export 'package:madhya/domain/repository/login_repository.dart';

//Entity//
export 'package:madhya/domain/entity/login_request.dart';

//Repository Implementation//
export 'package:madhya/data/repository_impl/auth_repository_impl.dart';

//Use case//
export 'package:madhya/domain/usecase/login_usecase.dart';
