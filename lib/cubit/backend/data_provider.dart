import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:tour_guide/core/,env.dart';

class DataProvider {
  static Future<String> predict(String feedback) async {
    var url = Uri.parse("https://api.openai.com/v1/chat/completions");
    var response = await http.post(url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $openaiApiKey",
        },
        body: jsonEncode({
          "model": "gpt-3.5-turbo", // Adjust model if needed
          "messages": [
            {
              "role": "system",
              "content":
                  """You are trained to analyze and detect the sentiment of given text.
                                        If you're unsure of an answer, you can say "not sure" and recommend users to review manually."""
            },
            {
              "role": "user",
              "content":
                  "Analyze the following hotel review and determine if the sentiment is: positive, negative or neutral. Return answer in single word as either positive, negative or neutral. Here is the text: $feedback"
            }
          ],
          "max_tokens": 1,
          "n": 1,
          "stop": null,
          "temperature": 0
        }));

    var responseData = jsonDecode(response.body);
    var responseText =
        responseData["choices"][0]["message"]["content"].trim().toLowerCase();

    return responseText;
  }
}
