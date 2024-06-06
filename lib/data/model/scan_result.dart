class ScanResult{
  final int amount;
  final DateTime timeStamp;
  ScanResult(this.amount,this.timeStamp);

  Map<String , dynamic> toJson(){
    return{
      'amount' : amount,
      'timeStamp' : timeStamp.toIso8601String(),
    };
  }

  factory ScanResult.fromJson(Map<String ,dynamic> json){
    return ScanResult(
      json['amount'] as int,
      DateTime.parse(json['timeStamp'] as String));
  }
}