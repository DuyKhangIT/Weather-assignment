class ResultUIModel {
  bool isSuccess;
  String errorMessage;

  ResultUIModel({
    this.isSuccess = false,
    this.errorMessage = '',
  });
}

class DataResultUIModel<T> extends ResultUIModel {
  T? data;

  DataResultUIModel(ResultUIModel result, this.data) {
    isSuccess = result.isSuccess;
    errorMessage = result.errorMessage;
  }
}
