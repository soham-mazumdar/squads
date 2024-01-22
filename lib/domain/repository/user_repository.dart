import 'package:squads/core/core.dart';
import 'package:squads/data/data.dart';

/// {@template chat_repository}
/// Repository which manages the user domain.
/// {@endtemplate}
abstract class UserRepository {
  /// Returns a random Users
  Future<(AppException?, List<UserModel>?)> getUsers(
      String count, String gender);
}
