import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tour_guide/core/constants.dart';
import 'package:tour_guide/cubit/profileCubit/profile_cubit.dart';
import 'package:tour_guide/helper/feedback_dialogue.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    String? username = FirebaseAuth.instance.currentUser!.displayName;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 8),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kVerticalGaps,
                InkWell(
                  onTap: () {
                    context.read<ProfileCubit>().changeCurrentProfilePage(2);
                  },
                  child: Card(
                    color: Colors.grey[300],
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 20),
                            child: Text("Profile",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w500)),
                          ),
                          ListTile(
                            leading: Container(
                              width: 50.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: AssetImage(
                                        'assets/images/tourCar.jpeg')),
                                color: const Color.fromARGB(134, 124, 148, 182),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(50.0)),
                                border: Border.all(
                                  color: const Color.fromARGB(103, 0, 0, 0),
                                  width: 2.0,
                                ),
                              ),
                            ),
                            title: Text(username ?? "No name"),
                            subtitle: const Text("Show Profile"),
                            trailing: const Icon(
                                Icons.keyboard_double_arrow_right_sharp),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                kVerticalGaps,
                const Divider(),
                kVerticalGaps,
                SizedBox(
                  width: deviceWidth(context) * 0.6,
                  child: Card(
                    margin: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            context
                                .read<ProfileCubit>()
                                .changeCurrentProfilePage(1);
                          },
                          child: ListTile(
                            title: Hero(
                              tag: 'WishList',
                              child: Text(
                                "Wishlists",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w500),
                              ),
                            ),
                            subtitle: Text("1 saved",
                                style: Theme.of(context).textTheme.titleMedium),
                            trailing: const Icon(
                              Icons.favorite_border,
                              size: 30,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                kVerticalGaps,
                kVerticalGaps,
                Text("Settings",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 30, fontWeight: FontWeight.w500)),
                kVerticalGaps,
                TextButton.icon(
                    onPressed: () {
                      context.read<ProfileCubit>().changeCurrentProfilePage(2);
                    },
                    icon: const Icon(
                      Icons.person_2_outlined,
                      size: 30,
                    ),
                    label: Hero(
                      tag: 'pInfo',
                      child: Text(
                        'Personal Information',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 18,
                            color: const Color.fromARGB(152, 0, 0, 0)),
                      ),
                    )),
                const Divider(),
                TextButton.icon(
                    onPressed: () {
                      context.read<ProfileCubit>().changeCurrentProfilePage(3);
                    },
                    icon: const Icon(
                      Icons.security_outlined,
                      size: 30,
                    ),
                    label: Hero(
                      tag: 'L&S',
                      child: Text(
                        'Login and Security',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 18,
                            color: const Color.fromARGB(152, 0, 0, 0)),
                      ),
                    )),
                const Divider(),
                TextButton.icon(
                    onPressed: () {
                      context.read<ProfileCubit>().changeCurrentProfilePage(4);
                    },
                    icon: const Icon(
                      Icons.notifications_active_outlined,
                      size: 30,
                    ),
                    label: Hero(
                      tag: 'Notifications',
                      child: Text(
                        'Notifications',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 18,
                            color: const Color.fromARGB(152, 0, 0, 0)),
                      ),
                    )),
                const Divider(),
                kVerticalGaps,
                kVerticalGaps,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.signOut();
                        if (!context.mounted) return;
                        Navigator.of(context)
                            .pushNamedAndRemoveUntil('/', (route) => false);
                      },
                      child: const Text("Log out",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ),
                    TextButton(
                      onPressed: () async {
                        showFeedbackDialogue(context);
                      },
                      child: const Text("Feedback",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
