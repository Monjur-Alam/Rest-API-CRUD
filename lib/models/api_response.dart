class APIResponse<T> {    //T = Generic type parameter.
  T data;
  bool error;
  String errorMessage;

  APIResponse({required this.data, required this.errorMessage, required this.error});


}