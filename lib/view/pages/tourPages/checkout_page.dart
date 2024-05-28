// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tour_guide/core/constants.dart';
import 'package:tour_guide/cubit/tourCubit/navigation_cubit.dart';
import 'package:tour_guide/view/widgets/checkout_details_customTile.dart';
import 'package:tour_guide/view/widgets/filled_button.dart';
import 'package:tour_guide/view/widgets/payment_method_tile.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  PaymentMethod paymentMethod = PaymentMethod.card;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        leading: IconButton(
            onPressed: () {
              context.read<TourCubit>().changeCurrentTourPage(4);
            },
            icon: Icon(Icons.arrow_back)),
        title: Text("Required for your Trip"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            CustomCheckoutListTile(title: "Name", subtitle: "Enter your name"),
            kVerticalGaps,
            CustomCheckoutListTile(
                title: "Phone Number",
                subtitle: "Add Phone number to get trip updates"),
            kVerticalGaps,
            CustomCheckoutListTile(
                title: "CNIC", subtitle: "Enter your CNIC number"),
            kVerticalGaps,
            kGreyDivider,
            kVerticalGaps,
            Text("Payment", style: Theme.of(context).textTheme.titleLarge),
            Text("All transactions are secured and encrypted."),
            kVerticalGaps,
            Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                width: deviceWidth(context) * 0.9,
                // height: deviceHeight(context) * 0.2,
                decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    CustomPaymentTypeTile(
                      title: "Pay Via Card",
                      icons: [Icons.payments_rounded, Icons.payment_outlined],
                      onChange: () {
                        setState(() {
                          paymentMethod = PaymentMethod.card;
                        });
                      },
                      isSelected:
                          paymentMethod == PaymentMethod.card ? true : false,
                    ),
                    Divider(),
                    CustomPaymentTypeTile(
                      title: "Online Bank Transfer",
                      onChange: () {
                        setState(() {
                          paymentMethod = PaymentMethod.bank;
                        });
                      },
                      isSelected:
                          paymentMethod == PaymentMethod.bank ? true : false,
                    ),
                    Divider(),
                    CustomPaymentTypeTile(
                      title: "Easypaisa or Jazzcash",
                      icons: [Icons.account_balance],
                      onChange: () {
                        setState(() {
                          paymentMethod = PaymentMethod.easypaisa;
                        });
                      },
                      isSelected: paymentMethod == PaymentMethod.easypaisa
                          ? true
                          : false,
                    ),
                  ],
                )),
            Center(
              child: CustomFilledButton(
                  title: "Book Now!",
                  onPress: () {
                    context.read<TourCubit>().changeCurrentTourPage(6);
                  }),
            )
          ]),
        ),
      ),
    );
  }
}

enum PaymentMethod { card, bank, easypaisa }
