import 'package:madhya/core/exporters/app_export.dart';

class GlobalSearch extends StatelessWidget {
  GlobalSearch({super.key});
  final controller = getIt<GlobalSearchController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Global Search'),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          spacing: 12.h,
          children: [
            _buildDropdown(
              title: "I’m looking for a",
              value: controller.lookingFor,
              items: controller.lookingList,
            ),

            _buildDropdown(
              title: "Religion",
              value: controller.religion,
              items: controller.religionList,
            ),

            _buildDropdown(
              title: "Caste",
              value: controller.caste,
              items: controller.casteList,
            ),

            _buildRangeRow(
              title: "Height in cm",
              fromValue: controller.heightFrom,
              toValue: controller.heightTo,
              items: controller.heightList,
            ),

            _buildRangeRow(
              title: "Age Between (Years)",
              fromValue: controller.ageFrom,
              toValue: controller.ageTo,
              items: controller.ageList,
            ),
            _buildDropdown(
              title: "Income",
              value: controller.caste,
              items: controller.casteList,
            ),
            _buildDropdown(
              title: "Education",
              value: controller.caste,
              items: controller.casteList,
            ),
            _buildDropdown(
              title: "Occupation",
              value: controller.caste,
              items: controller.casteList,
            ),
            _buildDropdown(
              title: "Country",
              value: controller.caste,
              items: controller.casteList,
            ),
            _buildDropdown(
              title: "State",
              value: controller.caste,
              items: controller.casteList,
            ),
            _buildDropdown(
              title: "City",
              value: controller.caste,
              items: controller.casteList,
            ),
            TextButton(
              onPressed: () {},
              child: AppText(
                text: 'Less Filters',
                fontSize: 14.sp,
                color: AppColors.lightTextMidColor,
              ),
            ),
            AppButton(
              text: 'Search',
              onTap: () {},
              backgroundColor: AppColors.lightPrimary,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToWord() {
    return Padding(
      padding: EdgeInsets.only(top: 16.w),
      child: Center(child: AppText(text: 'To', fontSize: 14)),
    );
  }

  /// 🔹 Common Dropdown
  Widget _buildDropdown({
    required String title,
    required RxnString value,
    required List<String> items,
  }) {
    return Obx(
      () => AppDropdownSearch<String>(
        title: title,
        isRequired: true,
        value: value.value,
        items: items,
        hintText: "Select",
        showSearchBox: false,
        onChanged: (val) => value.value = val,
        validator: AppValidators.required,
        searchHintText: '',
      ),
    );
  }

  /// 🔹 Range Row (From - To)
  Widget _buildRangeRow({
    required String title,
    required RxnString fromValue,
    required RxnString toValue,
    required List<String> items,
  }) {
    return Row(
      spacing: 16.w,
      children: [
        Expanded(
          child: Obx(
            () => AppDropdownSearch<String>(
              showTitle: true,
              value: fromValue.value,
              items: items,
              hintText: "From",
              onChanged: (val) => fromValue.value = val,
              validator: AppValidators.required,
              searchHintText: '',
              title: 'Height in cm',
            ),
          ),
        ),

        _buildToWord(),

        Expanded(
          child: Obx(
            () => AppDropdownSearch<String>(
              showTitle: false,
              value: toValue.value,
              items: items,
              hintText: "To",
              onChanged: (val) => toValue.value = val,
              validator: AppValidators.required,
              searchHintText: '',
              title: '',
            ),
          ),
        ),
      ],
    );
  }
}
