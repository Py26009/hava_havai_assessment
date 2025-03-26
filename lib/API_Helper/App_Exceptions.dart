class AppExceptions implements Exception{

  String title;
  String msg;
  AppExceptions({required this.title, required this.msg});

  String errorMsg(){
    return "$title : $msg";
  }
}

class FetchDataException extends AppExceptions{
  FetchDataException({required String errorMsg}):super(title: "Network Issue", msg: errorMsg);
}

class UnAuthorizedException extends AppExceptions{
  UnAuthorizedException({required String errorMsg}): super(title: "UnAuthorized Request", msg: errorMsg);
}

class BadRequestException extends AppExceptions{
  BadRequestException({required String errorMsg}): super(title: "Invalid Request", msg: errorMsg);
}

class InValidInputRequestException extends AppExceptions{
  InValidInputRequestException({required String errorMsg}): super(title: "Invalid Input Request", msg: errorMsg);
}