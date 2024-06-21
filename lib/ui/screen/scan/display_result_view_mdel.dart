import 'dart:convert';
import 'package:currency_detector_app/data/model/scan_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DisplayResultViewModel extends ChangeNotifier{
  final FlutterTts tts = FlutterTts();
  String? responseBody;
    
  // Function to speak the given text using TTS
  Future<void> speak(String text) async{
    await tts.speak(text);
  }
  void setResponseBody(String response) {
    responseBody = response;
    notifyListeners();
  }
  int getValueFromApi(){
    try{
      if(responseBody == null){
        throw Exception("Response body is null");
      }
      int detectedMoney = int.parse(responseBody!);
      saveScanResult(detectedMoney);
      return detectedMoney;
    }catch(e){
      print("someThing went wrong : $e");
    }
    return 0;
  }

  static const String key= "scanResults";
  Future<void> saveScanResult(int amount) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //get the list from sharedPreferences ,if it the first time return empty List
    List<String> jsonList = await prefs.getStringList(key)??[];
    
    //convert object of ScanResult to json 
    jsonList.add(jsonEncode(ScanResult(amount, DateTime.now()).toJson()));
    
    //set the list of json in sharedPreferences
    await prefs.setStringList(key, jsonList); 

    //remove from sharedPreferences
    await RemoveExpiredDate();
  }
//here omar
  Future<int> getTotalAmountLastMinute() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> jsonList = prefs.getStringList(key) ?? [];
    
    //get time now and before minute to add scanREsult with doublescanning
    DateTime now = DateTime.now();
    DateTime onsecondAgo = now.subtract(const Duration(seconds: 1));
    
    int totalAmount = 0;
    for(String jsonString in jsonList){
      ScanResult scanResult = ScanResult.fromJson(jsonDecode(jsonString));
      
      //Check if the scan result occurred after one minute ago.
      //Check if the scan result occurred before now.
      // it can be less than a minute --omar
      if(scanResult.timeStamp.isAfter(onsecondAgo) && scanResult.timeStamp.isBefore(now)){
        totalAmount +=scanResult.amount;
      }
    }    
    return totalAmount;
  }
  
  Future<void> RemoveExpiredDate() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> jsonList = prefs.getStringList(key)??[];
    
    List<String> filteredJsonList = jsonList.where((jsonString) {
      ScanResult scanResult = ScanResult.fromJson(jsonDecode(jsonString));
      DateTime expiryDate = scanResult.timeStamp.add(const Duration(days: 7)); 
      
      //check if expiryDate is after current Date or not 
      return expiryDate.isAfter(DateTime.now());
    }).toList();

    //update sharedPreferences with filtering List 
    await prefs.setStringList(key, filteredJsonList);
  }
  
}