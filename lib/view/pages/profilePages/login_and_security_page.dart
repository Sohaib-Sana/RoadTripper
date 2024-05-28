import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tour_guide/core/constants.dart';
import 'package:tour_guide/cubit/profileCubit/profile_cubit.dart';
import 'package:tour_guide/view/widgets/tile_with_action_parallel_to_subtitle.dart';

class LoginAndSecurityPage extends StatelessWidget {
  static const String id = '/LoginAndSecurity-page';
  const LoginAndSecurityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(top: deviceHeight(context) * 0.05),
          child: BackButton(
            onPressed: () {
              context.read<ProfileCubit>().changeCurrentProfilePage(0);
            },
          ),
        ),
        toolbarHeight: deviceHeight(context) * 0.13,
        title: Padding(
          padding: EdgeInsets.only(top: deviceHeight(context) * 0.05),
          child: Hero(
            tag: 'L&S',
            child: Text("Login & Security",
                style: Theme.of(context).textTheme.titleLarge),
          ),
        ),
      ),
      body: PopScope(
        canPop: true,
        onPopInvoked: (didPop) {
          if (didPop) {
            context.read<ProfileCubit>().changeCurrentProfilePage(0);
          }
          return;
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 02, horizontal: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            kVerticalGaps,
            kVerticalGaps,
            kVerticalGaps,
            CustomTileWithActionButtonParallelToSubtitle(
                title: "Password",
                subtitle: "Last updated 3 hours ago",
                actionText: "Update",
                actionColor: Colors.green[400],
                callBack: () {}),
            kVerticalGaps,
            const Divider(),
            kVerticalGaps,
            CustomTileWithActionButtonParallelToSubtitle(
                title: "Legal Name",
                actionText: "Deactivate",
                actionColor: Colors.red,
                callBack: () {}),
            kVerticalGaps,
          ]),
        ),
      ),
    );
  }
}
