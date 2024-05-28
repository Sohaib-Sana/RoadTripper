import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tour_guide/core/constants.dart';
import 'package:tour_guide/cubit/profileCubit/profile_cubit.dart';

class WishlistPage extends StatelessWidget {
  static const String id = '/Wishlist-screen';
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            context.read<ProfileCubit>().changeCurrentProfilePage(0);
          },
        ),
        toolbarHeight: deviceHeight(context) * 0.13,
        actions: [
          TextButton(
              onPressed: () {},
              child: const Text(
                "Edit",
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ))
        ],
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
            SizedBox(
              width: deviceWidth(context) * 0.6,
              child: Card(
                margin: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    ListTile(
                      title: Hero(
                        tag: 'WishList',
                        child: Text(
                          "Wishlists",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  fontSize: 30, fontWeight: FontWeight.w500),
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Text("1 saved",
                            style: Theme.of(context).textTheme.titleMedium),
                      ),
                      trailing: const Icon(
                        Icons.favorite_border,
                        size: 30,
                      ),
                    )
                  ],
                ),
              ),
            ),
            kVerticalGaps,
            const Divider(),
            kVerticalGaps,
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        blurRadius: 3,
                        color: Colors.black12,
                        offset: Offset(0, 6))
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 180,
                  width: 180,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/tourCar.jpeg'),
                          fit: BoxFit.contain)),
                ),
              ),
            ),
            kVerticalGaps,
            const Text("The point by Roomi,"),
            const Text("Thandani")
          ]),
        ),
      ),
    );
  }
}
