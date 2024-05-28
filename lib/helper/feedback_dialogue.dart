import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tour_guide/core/constants.dart';
import 'package:tour_guide/cubit/backend/repository.dart';

void showFeedbackDialogue(BuildContext context) {
  final _feedbackTextController = TextEditingController();
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              height: deviceHeight(context) * 0.6,
              width: deviceWidth(context) * 0.9,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "How was your trip?",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    kVerticalGaps,
                    const Divider(),
                    kVerticalGaps,
                    Text(
                      "Your feedback is crucial in shaping our services. Please take a moment to share your thought–it means a lot to us!",
                      style: Theme.of(context).textTheme.bodyLarge,
                      softWrap: true,
                      textAlign: TextAlign.center,
                    ),
                    kVerticalGaps,
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Icon(Icons.star_border,
                          color: Colors.amber[700], size: 35),
                      Icon(Icons.star_border,
                          color: Colors.amber[700], size: 35),
                      Icon(Icons.star_border,
                          color: Colors.amber[700], size: 35),
                      Icon(Icons.star_border,
                          color: Colors.amber[700], size: 35),
                      Icon(Icons.star_border,
                          color: Colors.amber[700], size: 35),
                    ]),
                    kVerticalGaps,
                    Text(
                      "Share your experience",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    kVerticalGaps,
                    TextField(
                        controller: _feedbackTextController,
                        autofocus: true,
                        maxLines: 4,
                        decoration: const InputDecoration(
                          hintText: "Enter your feedback",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.zero),
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Skip")),
                        TextButton(
                            onPressed: () async {
                              final aiSentiment = await Repository()
                                  .sendFeedbackToOpenAi(
                                      _feedbackTextController.text);
                              FirebaseFirestore.instance
                                  .collection('feedbacks')
                                  .add({
                                'feedback': _feedbackTextController.text,
                                'sentiment': aiSentiment,
                              });
                              _feedbackTextController.clear();
                              if (!context.mounted) return;
                              Navigator.pop(context);
                            },
                            child: const Text("Submit"))
                      ],
                    )
                  ]),
            ),
          ),
        );
      });
}
