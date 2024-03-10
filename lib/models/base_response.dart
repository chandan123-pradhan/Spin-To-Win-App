class BaseResponse{
  String statusCode;
  String message;
  Map<String,dynamic> data;

  BaseResponse({required this.statusCode,required this.data,required this.message});
}