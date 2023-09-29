import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

class ApiResponse {
  final List<Map<String, dynamic>> data;

  ApiResponse(this.data);

  Map<String, dynamic> toJson() {
    return {'data': data};
  }
}

void main() async {
  final app = Router();

  // Define a handler to return the API response
  app.get('/api/response', (Request request) {
    final apiResponseData = [
      {
        "votes": [5, 10],
        "downloads": 50,
        "dateAdded": "17:20:30 08/06/2023",
        "scoutImageLink":
            "https://cdn.discordapp.com/attachments/1024621773884506163/1151929940338552922/Screenshot_2023-09-14-22-47-27-399_com.supercell.clashofclans.jpg",
        "wallsImageLink":
            "https://cdn.discordapp.com/attachments/1024621773884506163/1151929940594413749/Screenshot_2023-09-14-22-46-52-784_com.supercell.clashofclans.jpg",
        "baseLink":
            "https://link.clashofclans.com/en?action=OpenLayout&id=TH14%3AHV%3AAAAADQAAAAJegsquLrxPYoKMSnbbxCAb"
      },
      {
        "votes": [5, 10],
        "downloads": 50,
        "dateAdded": "17:20:30 08/06/2023",
        "scoutImageLink":
            "https://cdn.discordapp.com/attachments/1024621773884506163/1151929940338552922/Screenshot_2023-09-14-22-47-27-399_com.supercell.clashofclans.jpg",
        "wallsImageLink":
            "https://cdn.discordapp.com/attachments/1024621773884506163/1151929940594413749/Screenshot_2023-09-14-22-46-52-784_com.supercell.clashofclans.jpg",
        "baseLink":
            "https://link.clashofclans.com/en?action=OpenLayout&id=TH14%3AHV%3AAAAADQAAAAJegsquLrxPYoKMSnbbxCAb"
      },
      {
        "votes": [5, 10],
        "downloads": 50,
        "dateAdded": "17:20:30 08/06/2023",
        "scoutImageLink":
            "https://cdn.discordapp.com/attachments/1024621773884506163/1151929940338552922/Screenshot_2023-09-14-22-47-27-399_com.supercell.clashofclans.jpg",
        "wallsImageLink":
            "https://cdn.discordapp.com/attachments/1024621773884506163/1151929940594413749/Screenshot_2023-09-14-22-46-52-784_com.supercell.clashofclans.jpg",
        "baseLink":
            "https://link.clashofclans.com/en?action=OpenLayout&id=TH14%3AHV%3AAAAADQAAAAJegsquLrxPYoKMSnbbxCAb"
      },
      {
        "votes": [5, 10],
        "downloads": 50,
        "dateAdded": "17:20:30 08/06/2023",
        "scoutImageLink":
            "https://cdn.discordapp.com/attachments/1024621773884506163/1151929940338552922/Screenshot_2023-09-14-22-47-27-399_com.supercell.clashofclans.jpg",
        "wallsImageLink":
            "https://cdn.discordapp.com/attachments/1024621773884506163/1151929940594413749/Screenshot_2023-09-14-22-46-52-784_com.supercell.clashofclans.jpg",
        "baseLink":
            "https://link.clashofclans.com/en?action=OpenLayout&id=TH14%3AHV%3AAAAADQAAAAJegsquLrxPYoKMSnbbxCAb"
      },
      {
        "votes": [5, 10],
        "downloads": 50,
        "dateAdded": "17:20:30 08/06/2023",
        "scoutImageLink":
            "https://cdn.discordapp.com/attachments/1024621773884506163/1151929940338552922/Screenshot_2023-09-14-22-47-27-399_com.supercell.clashofclans.jpg",
        "wallsImageLink":
            "https://cdn.discordapp.com/attachments/1024621773884506163/1151929940594413749/Screenshot_2023-09-14-22-46-52-784_com.supercell.clashofclans.jpg",
        "baseLink":
            "https://link.clashofclans.com/en?action=OpenLayout&id=TH14%3AHV%3AAAAADQAAAAJegsquLrxPYoKMSnbbxCAb"
      },
      // Add more data if needed
    ];

    final apiResponse = ApiResponse(apiResponseData);
    final responseJson = jsonEncode(apiResponse.toJson());

    return Response.ok(responseJson,
        headers: {'content-type': 'application/json'});
  });

  // Create a Shelf handler from the router
  final handler = Pipeline().addMiddleware(logRequests()).addHandler(app);

  // Define the port to listen on (e.g., 8080)
  final server = await serve(handler, 'localhost', 8080);
  print('Server is listening on ${server.address.host}:${server.port}');
}
