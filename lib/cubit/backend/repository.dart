import 'package:tour_guide/cubit/backend/data_provider.dart';

class Repository {
  Future<String> sendFeedbackToOpenAi(String feedback) =>
      DataProvider.predict(feedback);
}
