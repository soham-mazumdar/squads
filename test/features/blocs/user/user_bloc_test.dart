import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:squads/domain/repository/user_repository.dart';
import 'package:squads/data/data.dart';
import 'package:squads/features/blocs/user/user_bloc.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  group('UserBloc', () {
    late MockUserRepository mockUserRepository;
    late UserBloc userBloc;
    final userModel = UserModel(id: 10);

    setUp(() {
      mockUserRepository = MockUserRepository();
      userBloc = UserBloc(mockUserRepository);
    });

    tearDown(() {
      userBloc.close();
    });

    blocTest<UserBloc, UserState>(
      'given user[userModel] is added to myTeam[<list<UserModel>>] when AddToTeam event triggered',
      build: () => userBloc,
      act: (bloc) async {
        bloc.add(AddToTeam(userModel: userModel));
      },
      expect: () => [
        UserState(
          myTeam: [userModel],
          users: const [],
          apiStatus: ApiStatus.notInitiated,
        )
      ],
    );

    blocTest<UserBloc, UserState>(
      'given user[userModel] is removed from myTeam[<list<UserModel>>] when RemoveFromTeam event triggered',
      build: () => userBloc,
      act: (bloc) async {
        bloc.add(RemoveFromTeam(userModel: userModel));
      },
      setUp: () {
        userBloc.add(AddToTeam(userModel: userModel));
      },
      expect: () => [
        const UserState(
          users: [],
          myTeam: [],
          apiStatus: ApiStatus.notInitiated,
        )
      ],
    );
  });
}
