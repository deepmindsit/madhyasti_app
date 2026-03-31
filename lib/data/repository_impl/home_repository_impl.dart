import 'package:madhya/core/exporters/app_export.dart';
import 'package:madhya/domain/repository/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final ApiService apiService;

  HomeRepositoryImpl(this.apiService);

  @override
  Future<dynamic> getHome(UserRequest request) async {
    return await apiService.getHome(request.userId);
  }
}
