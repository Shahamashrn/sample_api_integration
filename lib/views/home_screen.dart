import 'package:api_sample_2/data/local/header_provider.dart';
import 'package:api_sample_2/data/remote/results_remote.dart';
import 'package:api_sample_2/model/response/result_response/results_model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder<ResultsModel>(
          future: ResultsRemote(HeaderProvider()).fetch(10,18),
          builder: (context, snapshot) {
            if(snapshot.hasData){
              List results=snapshot.data!.results;
              return ListView.builder(
                  itemCount: results.length,
                  itemBuilder: (context,index) {
                    var result=results[index];
                    return Container(
                      child: Column(
                          children:[
                            Text(result.question),
                            Text(result.correctAnswer),
                            Text(result.incorrectAnswers.toString()),
                          ]
                      ),
                    );
                  }
              );
            }
            else if(snapshot.hasError){
              print('${snapshot.error}');
            }
             return CircularProgressIndicator();

          }
        ),

      ),
    );
  }
}
