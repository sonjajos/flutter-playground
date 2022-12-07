import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:my_first_flutter_app/model/reciepe.dart';

import '../store/reciepes.dart';

const apiKey = "2eadbeba5emsh6e7a1d1df84fa6cp1e5f97jsnd95e98165a98";

void getRecipies() async {
  reciepesStore.loadReciepes(true);
  try {
    final response = await http.get(
      Uri.parse('https://tasty.p.rapidapi.com/recipes/list'),
      headers: {
        'X-RapidAPI-Key': apiKey,
        'X-RapidAPI-Host': 'tasty.p.rapidapi.com'
      },
    );
    if (response.statusCode == 200) {
      var body = await json.decode(response.body);
      var data = Reciepes.fromJson(body);
      List<Reciepe> reciepes = data.results
          .map(
            (e) => Reciepe(
              videoUrl: e?["video_url"] ?? "",
              prepTime: e?["prep_time_minutes"] ?? 0,
              name: e?["name"] ?? "",
              thumbnailUrl: e["thumbnail_url"] ?? "",
              servings: e?["num_servings"] ?? 1,
              description: e?["description"] ?? "",
            ),
          )
          .toList();
      reciepesStore.storeReciepes(reciepes);
    } else {
      reciepesStore.loadReciepes(false);
    }
  } catch (e) {
    reciepesStore.loadReciepes(false);
  }
}
