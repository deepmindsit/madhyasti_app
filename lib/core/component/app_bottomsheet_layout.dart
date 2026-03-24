import '../exporters/app_export.dart';

class AppBottomSheetLayout extends StatelessWidget {
  final Widget child;
  final bool showHandle;

  const AppBottomSheetLayout({
    super.key,
    required this.child,
    this.showHandle = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      child: child,
    );
  }
}
