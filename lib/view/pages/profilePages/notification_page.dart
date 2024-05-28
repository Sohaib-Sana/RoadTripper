import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tour_guide/core/constants.dart';
import 'package:tour_guide/cubit/profileCubit/profile_cubit.dart';
import 'package:tour_guide/view/widgets/radio_button.dart';

class NotificationPage extends StatelessWidget {
  static const String id = '/Notification-screen';
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(top: 7.0),
          child: BackButton(
            onPressed: () {
              context.read<ProfileCubit>().changeCurrentProfilePage(0);
            },
          ),
        ),
        toolbarHeight: 100,
        title: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Hero(
            tag: 'Notifications',
            child: Text("Notifications",
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
            Container(
                decoration: BoxDecoration(
                  color: Colors.white, // Set your desired card color
                  borderRadius:
                      BorderRadius.circular(25), // Customize border radius
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2), // Shadow color
                      blurRadius: 10, // Adjust blur radius for the shadow
                      offset: const Offset(
                          0, 4), // Offset for the shadow (0,4 for outer shadow)
                    ),
                  ],
                ),
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 6.0), // Add padding for content
                    child: ListTile(
                      title: Text("Push notifications are off.",
                          style: Theme.of(context).textTheme.bodyMedium),
                      trailing: TextButton(
                          onPressed: () {},
                          child: const Text("Go to settings")),
                    ))),
            kVerticalGaps,
            kVerticalGaps,
            kVerticalGaps,
            Text("Account activity",
                style: Theme.of(context).textTheme.titleLarge),
            kVerticalGaps,
            const Text(
                "Confirm your booking & account activity, & learn about important Road Trippers policies."),
            Text("Account activity",
                style: Theme.of(context).textTheme.titleMedium),
            kVerticalGaps,
            const RadioButtonsColumn(),
          ]),
        ),
      ),
    );
  }
}
