import 'package:madhya/core/exporters/app_export.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final controller = getIt<RegisterController>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isLight = theme.brightness == Brightness.light;

    return Scaffold(
      backgroundColor: isLight
          ? AppColors.bgColor
          : theme.scaffoldBackgroundColor,
      body: Stack(
        children: [
          Center(child: buildBackgroundImage(theme)),
          _buildForm(theme),
        ],
      ),
    );
  }

  Widget _buildForm(ThemeData theme) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Form(
        key: controller.registerKey,
        child: Column(
          spacing: 8.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: Get.height * 0.05),
            buildTitle("Join Madhyasthi"),
            buildSubTitle(
              "Create your profile and discover\nmeaningful matches.",
              theme,
            ),
            _buildNameField(theme),
            _buildGender(theme),
            _buildDOB(theme),
            _buildAgeDropdown(),
            _buildReligionDropdown(),
            _buildCasteDropdown(),
            _buildSubCasteDropdown(),
            const SizedBox(height: 12),
            _buildAcceptTerms(),
            const SizedBox(height: 8),
            _buildRegisterButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildNameField(ThemeData theme) {
    return AppTextField(
      label: 'Full Name',
      hint: 'Full Name',
      labelStyle: TextStyle(
        fontSize: 14.sp,
        color: theme.colorScheme.onSurface,
      ),
      filled: true,
      textStyle: TextStyle(color: theme.colorScheme.onSurface, fontSize: 14.sp),
      focusedBorder: theme.inputDecorationTheme.focusedBorder,
      enabledBorder: theme.inputDecorationTheme.enabledBorder,
      fillColor: theme.cardColor,
      hintStyle: theme.textTheme.labelMedium!.copyWith(color: Colors.grey),
      controller: controller.nameController,
      validator: AppValidators.required,
    );
  }

  Widget _buildGender(ThemeData theme) {
    return Column(
      spacing: 8.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppLabel(
          text: 'Select your gender',
          fontSize: 14.sp,
          color: theme.colorScheme.onSurface,
        ),

        Obx(
          () => Row(
            spacing: 12.w,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => controller.selectedGender.value = 'Male',
                  child: buildGenderCard(
                    controller.selectedGender.value == 'Male',
                    'Male',
                    HugeIcons.strokeRoundedMale02,
                    theme,
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => controller.selectedGender.value = 'Female',
                  child: buildGenderCard(
                    controller.selectedGender.value == 'Female',
                    'Female',
                    HugeIcons.strokeRoundedFemale02,
                    theme,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDOB(ThemeData theme) {
    return AppTextField(
      labelStyle: TextStyle(
        fontSize: 14.sp,
        color: theme.colorScheme.onSurface,
      ),
      textStyle: TextStyle(color: theme.colorScheme.onSurface, fontSize: 14.sp),
      focusedBorder: theme.inputDecorationTheme.focusedBorder,
      enabledBorder: theme.inputDecorationTheme.enabledBorder,
      fillColor: theme.cardColor,
      hintStyle: theme.textTheme.labelMedium!.copyWith(color: Colors.grey),
      onTap: () async {
        final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
          builder: (context, child) {
            return Theme(
              data: theme.copyWith(
                colorScheme: ColorScheme.light(
                  primary: AppColors.lightPrimary,
                  onPrimary: Colors.white,
                  onSurface: Colors.black,
                ),
              ),
              child: child!,
            );
          },
        );
        if (picked != null) {
          controller.dobController.text =
              "${picked.day}/${picked.month}/${picked.year}";
        }
      },
      validator: AppValidators.required,
      suffixIcon: Icon(
        Icons.calendar_today,
        size: 20.r,
        color: AppColors.grey400,
      ),
      readOnly: true,
      label: 'Select DOB',
      hint: 'Select DOB',
      filled: true,
      controller: controller.dobController,
    );
  }

  Widget _buildAgeDropdown() {
    return AppDropdownSearch<String>(
      title: "Select Your Age",
      isRequired: true,
      value: controller.selectedAge.value,
      items: controller.ageList,
      hintText: "Choose Age",
      showSearchBox: false,
      searchHintText: "Search Age",
      onChanged: (val) => controller.selectedAge.value = val,
      validator: AppValidators.required,
    );
  }

  Widget _buildReligionDropdown() {
    return AppDropdownSearch<String>(
      title: "Select Your Religion",
      isRequired: true,
      value: controller.selectedReligion.value,
      items: controller.religionList,
      hintText: "Choose Religion",
      showSearchBox: false,
      searchHintText: "Search Religion",
      onChanged: (val) => controller.selectedReligion.value = val,
      validator: AppValidators.required,
    );
  }

  Widget _buildCasteDropdown() {
    return AppDropdownSearch<String>(
      title: "Select Your Caste",
      isRequired: true,
      value: controller.selectedCaste.value,
      items: controller.casteList,
      hintText: "Choose Caste",
      searchHintText: "Search Caste",
      showSearchBox: false,
      onChanged: (val) => controller.selectedCaste.value = val,
      validator: AppValidators.required,
    );
  }

  Widget _buildSubCasteDropdown() {
    return AppDropdownSearch<String>(
      title: "Select Your Subcaste",
      isRequired: true,
      value: controller.selectedSubCaste.value,
      items: controller.subCasteList,
      hintText: "Choose Subcaste",
      searchHintText: "Search Subcaste",
      showSearchBox: false,
      onChanged: (val) => controller.selectedSubCaste.value = val,
      validator: AppValidators.required,
    );
  }

  Widget _buildAcceptTerms() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(
          () => SizedBox(
            width: 24.r,
            height: 24.r,
            child: Checkbox(
              value: controller.isTermsAccepted.value,
              onChanged: (value) {
                controller.isTermsAccepted.value = value!;
              },
              activeColor: AppColors.lightPrimary,
              checkColor: Colors.white,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.r),
              ),
            ),
          ),
        ),
        SizedBox(width: 12.r),

        /// Text Section
        Expanded(
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: 13.sp,
                color: Colors.grey[700],
                height: 1.4,
              ),
              children: [
                const TextSpan(text: 'I have read and agree to the '),

                /// Terms of Use
                TextSpan(
                  text: 'Terms of Use',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColors.lightPrimary,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      /// Navigate to Terms Screen
                      // Get.toNamed(Routes.terms);
                    },
                ),

                const TextSpan(text: ' & '),

                /// Privacy Policy
                TextSpan(
                  text: 'Privacy Policy',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColors.lightPrimary,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      /// Navigate to Privacy Screen
                      // Get.toNamed(Routes.privacy);
                    },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRegisterButton() {
    return AppButton(
      text: 'Register Free',
      onTap: _validateAndSubmit,
      backgroundColor: AppColors.lightPrimary,
      type: AppButtonType.secondary,
      textColor: Colors.white,
    );
  }

  void _validateAndSubmit() {
    final form = controller.registerKey.currentState;

    if (form == null) return;

    /// ✅ This is SAFE (outside build)
    if (!form.validate()) {
      showError("Please fill all required fields");
      return;
    }

    if (controller.selectedGender.value == null ||
        controller.selectedGender.value!.isEmpty) {
      showError("Please select your gender");
      return;
    }

    if (!controller.isTermsAccepted.value) {
      showError("Please accept Terms & Privacy Policy");
      return;
    }

    /// SUCCESS
    Get.offAllNamed(Routes.addProfile);
  }
}
