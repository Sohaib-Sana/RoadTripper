import 'package:flutter/material.dart';

deviceHeight(BuildContext context) => MediaQuery.sizeOf(context).height;
deviceWidth(BuildContext context) => MediaQuery.sizeOf(context).width;

const kVerticalGaps = SizedBox(
  height: 16,
);

const kHorizontalGaps = SizedBox(
  width: 16,
);

const kGreyDivider = Divider(
  color: Colors.black12,
  thickness: 8,
  indent: 0,
  endIndent: 0,
);

final kDividerWithShadow = Column(
  children: [
    Padding(
      padding:
          const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 1, top: 16),
      child: Container(
        height: 1,
        color: Colors.black,
      ),
    ),
    Padding(
      padding:
          const EdgeInsets.only(left: 12.0, right: 12.0, top: 1, bottom: 8),
      child: Container(
        height: 5,
        color: Colors.grey.withOpacity(0.3),
      ),
    ),
  ],
);

enum SelectedCity {
  all,
  chitral,
  gilgit,
  hunza,
  mansehra,
  nurree,
  naranKaghan,
  shogran,
  skardu,
  swat
}

enum SelectedBudget { low, medium, high }
