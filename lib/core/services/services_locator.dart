import 'package:get_it/get_it.dart';
import 'package:tmdb_task/features/home/data/datasources/home_data_source.dart';
import 'package:tmdb_task/features/home/data/repositories/home_repo.dart';
import 'package:tmdb_task/features/home/domain/repositories/home_repository.dart';
import 'package:tmdb_task/features/home/domain/usecases/home_use_case.dart';

import 'package:tmdb_task/features/home/presentation/cubit/home_cubit.dart';

final GetIt sL = GetIt.instance;

class ServicesLocator {
  void init() {
    /// Data Source
    sL.registerLazySingleton<BaseRemoteDataSource>(() => RemoteDataSource());

    /// Repository
    sL.registerLazySingleton<BaseMovieRepository>(() => MoviesRepository(sL()));

    /// Use Cases
    sL.registerLazySingleton(() => HomeUseCase(sL()));

    /// Bloc / Cubit
    sL.registerFactory(() => HomeCubit(homeUseCase: sL()));
  }
}
