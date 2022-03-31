import 'package:api_sample_2/model/response/result_response/results_model.dart';

import '../local/header_provider.dart';

import 'package:http/http.dart' as _http;
class ResultsRemote {
  static const detailResponseUrl = 'https://opentdb.com'+ '/api.php';
  // final ConnectionChecker _connectionChecker;
  final HeaderProvider _headerProvider;

  ResultsRemote(
      // this._connectionChecker,
      this._headerProvider,
      );

  Future<ResultsModel> fetch(int amount ,int category) async {
    try{
      // await _connectionChecker.throwNoInternetExceptionIfNotConnected();
      final headers = _headerProvider();
      // headers.putIfAbsent(ApiConstants.responseId, () => responseId.toString());
      final response =
      await _http.get(Uri.parse(detailResponseUrl+"?amount=$amount&&category=$category"), headers:  {
        'Content-Type': 'application/json',
        'Accept': 'application/json',

      });
      //  print("hi");
      // print(response.statusCode);
       print(response.body);
      final responseModel = ResultsModel.fromJson(response.body);
       print('kjlkjlkjl ${responseModel.toMap()}');
      return responseModel;
    }

    catch( e){

      return Future.error(e.toString());
    }

  }
}
