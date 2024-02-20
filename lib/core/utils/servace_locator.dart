import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tt_2/core/utils/api_service.dart';
import 'package:tt_2/features/home/data/repos/home_repo_implement.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));

  getIt.registerSingleton<HomeRepoImplement>(
      HomeRepoImplement(apiService: getIt.get<ApiService>()));
}
