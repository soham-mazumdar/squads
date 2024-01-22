import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:squads/di/di.dart';
import 'package:squads/ui/components/user_card.dart';
import 'package:squads/features/blocs/user/user_bloc.dart';
import 'package:squads/ui/theme/theme.dart';

class MyTeamScreen extends StatelessWidget {
  const MyTeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      bloc: getItInstance<UserBloc>(),
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
            backgroundColor: AppColors.primary,
            leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(
                Icons.chevron_left_rounded,
                color: Colors.white,
              ),
            ),
            centerTitle: true,
            title: Text(
              'My Team',
              style: AppTextStyle.lgSB,
            ),
          ),
          body: state.myTeam.isEmpty
              ? const Center(
                  child: Text(
                    'No one added to team',
                    textAlign: TextAlign.center,
                  ),
                )
              : Column(
                  children: [
                    const Spacer(),
                    Row(
                      children: [
                        const SizedBox(width: 20),
                        Expanded(child: UserCard(user: state.myTeam[0])),
                        const SizedBox(width: 20),
                        Expanded(child: UserCard(user: state.myTeam[1])),
                        const SizedBox(width: 20),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        UserCard(user: state.myTeam[2]),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
        );
      },
    );
  }
}
