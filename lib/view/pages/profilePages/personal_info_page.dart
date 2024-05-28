import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tour_guide/core/constants.dart';
import 'package:tour_guide/cubit/profileCubit/profile_cubit.dart';
import 'package:tour_guide/view/widgets/tile_with_action_parallel_to_subtitle.dart';

class PersonalInfoPage extends StatefulWidget {
  static const String id = '/PersonalInfo-page';

  const PersonalInfoPage({super.key});

  @override
  State<PersonalInfoPage> createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  final loggedInUser = FirebaseAuth.instance.currentUser;
  final TextEditingController _dataController = TextEditingController();
  String? phoneNumber;
  String? address;
  @override
  void initState() {
    // phoneNumber = loggedInUser?.phoneNumber;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(top: deviceHeight(context) * 0.045),
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
            tag: 'pInfo',
            child: Text("Personal Information",
                style: Theme.of(context).textTheme.titleLarge),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 02, horizontal: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          kVerticalGaps,
          kVerticalGaps,
          kVerticalGaps,
          CustomTileWithActionButtonParallelToSubtitle(
              title: "Legal",
              subtitle: loggedInUser!.displayName,
              actionText: "Edit",
              callBack: () {
                _handleEditingOfPersonalInfo(context, "Legal");
              }),
          kVerticalGaps,
          const Divider(),
          kVerticalGaps,
          CustomTileWithActionButtonParallelToSubtitle(
              title: "Phone Number",
              subtitle: phoneNumber ?? "No Number given.",
              actionText: "Add",
              callBack: () {
                _handleEditingOfPersonalInfo(context, "Phone Number");
              }),
          kVerticalGaps,
          const Divider(),
          kVerticalGaps,
          CustomTileWithActionButtonParallelToSubtitle(
            title: "Email",
            subtitle: loggedInUser!.email,
            actionText: "Edit",
            callBack: () {
              _handleEditingOfPersonalInfo(context, "Email");
            },
          ),
          kVerticalGaps,
          const Divider(),
          kVerticalGaps,
          CustomTileWithActionButtonParallelToSubtitle(
              title: "Address",
              subtitle: address ?? "Not provided",
              actionText: "Edit",
              callBack: () {
                _handleEditingOfPersonalInfo(context, "Address");
              }),
          kVerticalGaps,
        ]),
      ),
    );
  }

  _handleEditingOfPersonalInfo(BuildContext context, String title) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              title,
              style: const TextStyle(color: Colors.black),
            ),
            content: TextField(
              controller: _dataController,
              autofocus: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(style: BorderStyle.solid),
                ),
              ),
            ),
            actions: [
              TextButton(
                child: const Text("Ok"),
                onPressed: () {
                  setState(() {
                    if (title == 'Legal') {
                      loggedInUser!.updateDisplayName(_dataController.text);
                    } else if (title == 'Phone Number') {
                      // loggedInUser!.updatePhoneNumber(_dataController.text)
                      phoneNumber = _dataController.text;
                    } else if (title == 'Email') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content:
                                Text("Sorry! Email could not be changed.")),
                      );
                    } else {
                      address = _dataController.text;
                    }
                    Navigator.pop(context);
                  });
                },
              ),
              TextButton(
                child: const Text("Cancel"),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }
}
