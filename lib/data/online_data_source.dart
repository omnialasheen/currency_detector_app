import 'package:http/http.dart' as http;
import 'dart:io';

Future<String?> sendImageToApi(String imagePath) async {
  var url = Uri.parse('https://nextechs.xyz/currency/add.php');
  var responce = http.MultipartRequest('POST',url);
  // Attach the image file to the request
  var imageFile = File(imagePath);
  var imageStream = http.ByteStream(imageFile.openRead());
  var length = await imageFile.length();
  var multipartFile = http.MultipartFile('image', imageStream, length,
      filename: imageFile.path);
  responce.files.add(multipartFile);

  // Send the request and await for the response
  var response = await responce.send();
  String? responseBody;
  // Check the response status code
  if (response.statusCode >= 200 && response.statusCode < 300) {
    responseBody = await response.stream.bytesToString();
    print('Response Body : $responseBody' '$response.statusCode');
  } else {
    //throw Exception("Failed to upload image. Status code: ${response.statusCode}");
    print('Failed to upload image. Status code: ${response.statusCode}');
    print('Reason phrase : ${response.reasonPhrase}');
    
  } 
  return responseBody;
} 

/* var jsonResponse = json.decode(responseBody);
    var imageResponse = ImageModel.fromJson(jsonResponse);
    print('Image uploaded successfully');
    print('Status: ${imageResponse.status}');  
*/