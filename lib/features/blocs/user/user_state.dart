part of 'user_bloc.dart';

enum ApiStatus { notInitiated, loading, success, error }

class UserState extends Equatable {
  const UserState({
    required this.users,
    required this.myTeam,
    required this.apiStatus,
    this.selectedUser,
  });

  final List<UserModel> users;
  final List<UserModel> myTeam;
  final UserModel? selectedUser;
  final ApiStatus apiStatus;

  @override
  List<Object?> get props => [
        myTeam,
        users,
        apiStatus,
        selectedUser,
      ];

  factory UserState.initial() {
    return const UserState(
      users: [],
      myTeam: [],
      apiStatus: ApiStatus.notInitiated,
    );
  }

  UserState copyWith({
    List<UserModel>? users,
    List<UserModel>? myTeam,
    ApiStatus? apiStatus,
    UserModel? selectedUser,
  }) {
    return UserState(
      users: users ?? this.users,
      myTeam: myTeam ?? this.myTeam,
      apiStatus: apiStatus ?? this.apiStatus,
      selectedUser: selectedUser,
    );
  }
}
