import 'package:madhya/core/exporters/app_export.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  Dio get dio => Dio();
}
