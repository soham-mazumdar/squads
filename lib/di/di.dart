import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:squads/features/blocs/user/user_bloc.dart';
import 'package:squads/core/core.dart';
import 'package:squads/data/data.dart';
import 'package:squads/domain/domain.dart';

final getItInstance = GetIt.I;

init() async {
  // SERVICES
  getItInstance.registerLazySingleton<Client>(Client.new);
  getItInstance.registerLazySingleton<HttpClient>(() => HttpClient(
        baseUrl: 'https://random-data-api.com/api/v2/',
        client: getItInstance(),
      ));

  getItInstance.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(getItInstance()));

  // GLOBAL BLOCS
  getItInstance
      .registerLazySingleton<UserBloc>(() => UserBloc(getItInstance()));
}
