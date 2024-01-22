import 'package:squads/core/core.dart';
import 'package:squads/data/data.dart';
import 'package:squads/domain/domain.dart';

class UserRepositoryImpl extends UserRepository {
  UserRepositoryImpl(HttpClient client) : _client = client;

  final HttpClient _client;

  @override
  Future<(AppException?, List<UserModel>?)> getUsers(
    String count,
    String gender,
  ) async {
    try {
      final res = await _client.makeRequest(
        RequestMethod.get,
        path: 'users?size=$count',
      );

      final ret = res
          .map((e) => UserModel.fromJson(e as Map<String, dynamic>))
          .toList();

      return (null, ret);
    } catch (e) {
      return (e.toAppException(), null);
    }
  }
}
