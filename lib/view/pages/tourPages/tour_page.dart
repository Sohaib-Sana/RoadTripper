import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tour_guide/core/constants.dart';
import 'package:tour_guide/cubit/tourCubit/navigation_cubit.dart';
import 'package:tour_guide/view/widgets/checkbox_list_Tile.dart';
import 'package:tour_guide/view/widgets/elevated_button.dart';
import 'package:tour_guide/view/widgets/filled_button.dart';
import 'package:tour_guide/view/widgets/neumorphic_container.dart';

class TourPage extends StatefulWidget {
  const TourPage({super.key});

  @override
  State<TourPage> createState() => _TourPageState();
}

class _TourPageState extends State<TourPage> {
  // DateTime? selectedDate;
  final dateFormatter = DateFormat('dd-MM-yyyy');
  final DateTime now = DateTime.now();
  String? formatedDate;

  @override
  void initState() {
    formatedDate = dateFormatter.format(now);
    super.initState();
  }

  SelectedBudget isSelected = SelectedBudget.low;
  SelectedCity citySelected = SelectedCity.all;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        toolbarHeight: 130,
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16),
          child: Text(
            "Let's customise a trip for you!",
            style:
                Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 30),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Select Budget Categories",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontWeight: FontWeight.normal),
                ),
                kVerticalGaps,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomElevatedContainer(
                      onPress: () {
                        _handleOnPressofBudget(SelectedBudget.low);
                      },
                      isSelected:
                          isSelected == SelectedBudget.low ? true : false,
                      child: const Text("Low"),
                    ),
                    CustomElevatedContainer(
                      onPress: () {
                        _handleOnPressofBudget(SelectedBudget.medium);
                      },
                      isSelected:
                          isSelected == SelectedBudget.medium ? true : false,
                      child: const Text("Moderate"),
                    ),
                    CustomElevatedContainer(
                      isSelected:
                          isSelected == SelectedBudget.high ? true : false,
                      onPress: () {
                        _handleOnPressofBudget(SelectedBudget.high);
                      },
                      child: const Text("High"),
                    ),
                  ],
                ),
              ],
            ),
          ),
          kVerticalGaps,
          kGreyDivider,
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
            child: SizedBox(
              height: deviceHeight(context) * 0.11,
              child: GestureDetector(
                onTap: () {
                  _handleDatePicker(context);
                },
                child: CustomNeumorphicContainer(
                    width: double.infinity,
                    child: ListTile(
                      title: const Text("Select Date"),
                      subtitle: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Row(
                          children: [
                            const Icon(Icons.calendar_month_outlined),
                            kHorizontalGaps,
                            Text(formatedDate != null
                                ? '$formatedDate'
                                : now.toString())
                            // Text("Thursday, Mar 20, - Friday, Mar 21")
                          ],
                        ),
                      ),
                    )),
              ),
            ),
          ),
          kGreyDivider,
          Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Select City"),
                  kVerticalGaps,
                  SizedBox(
                    height: deviceHeight(context) * 0.28,
                    child: const CustomNeumorphicContainer(
                        child: SingleChildScrollView(
                      child: Column(
                        children: [
                          CustomCheckBoxWithLeadingTitle(title: "Chitral"),
                          CustomCheckBoxWithLeadingTitle(
                              title: "Fairay-Meadows, Gilgit"),
                          CustomCheckBoxWithLeadingTitle(title: "Hunza Valley"),
                          CustomCheckBoxWithLeadingTitle(title: "Mansehra"),
                          CustomCheckBoxWithLeadingTitle(title: "Murree"),
                          CustomCheckBoxWithLeadingTitle(title: "Naran-Kaghan"),
                          CustomCheckBoxWithLeadingTitle(title: "Shogran"),
                          CustomCheckBoxWithLeadingTitle(title: "Skardu"),
                          CustomCheckBoxWithLeadingTitle(title: "Swat")
                        ],
                      ),
                    )),
                  )
                ],
              )),
          CustomFilledButton(
            title: "Next",
            onPress: () {
              context.read<TourCubit>().changeCurrentTourPage(1);
            },
          ),
        ],
      ),
    );
  }

  _handleOnPressofBudget(SelectedBudget selectedBudget) {
    setState(() {
      isSelected = selectedBudget;
    });
  }

  _handleCitySelection(SelectedCity selectedCity) {
    setState(() {
      citySelected = selectedCity;
    });
  }

  _handleDatePicker(BuildContext context) async {
    final DateTime lastDate = DateTime(now.year + 1, now.month, now.day);
    final DateTime? selectedDate = await showDatePicker(
        context: context, firstDate: now, lastDate: lastDate);
    if (selectedDate != null) {
      formatedDate = dateFormatter.format(selectedDate);
    }
    setState(() {});
  }
}
