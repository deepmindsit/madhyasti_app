import 'package:madhya/core/exporters/app_export.dart';
import 'package:madhya/domain/repository/home_repository.dart';

class HomeUsecase {
  final HomeRepository repository;
  HomeUsecase(this.repository);

  Future<dynamic> call(UserRequest request) async {
    return await repository.getHome(request);
  }
}
