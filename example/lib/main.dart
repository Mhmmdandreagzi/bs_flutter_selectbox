import 'package:bs_flutter/bs_flutter.dart';
import 'package:flutter/material.dart';
import 'package:bs_flutter_selectbox/bs_flutter_selectbox.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert' as convert;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  BsSelectBoxController _select1 = BsSelectBoxController(
    options: [
      BsSelectBoxOption(value: 1, text: Text('1')),
      BsSelectBoxOption(value: 2, text: Text('2')),
      BsSelectBoxOption(value: 3, text: Text('3')),
    ]
  );
  BsSelectBoxController _select2 = BsSelectBoxController(
    multiple: true,
    options: [
      BsSelectBoxOption(value: 1, text: Text('1')),
      BsSelectBoxOption(value: 2, text: Text('2')),
      BsSelectBoxOption(value: 3, text: Text('3')),
      BsSelectBoxOption(value: 4, text: Text('4')),
      BsSelectBoxOption(value: 5, text: Text('5')),
      BsSelectBoxOption(value: 6, text: Text('6')),
    ]
  );
  BsSelectBoxController _select3 = BsSelectBoxController();

  @override
  void initState() {
    super.initState();
  }

  Future<BsSelectBoxResponse> selectApi(Map<String, String> params) async {
    Uri url = Uri.http('localhost', 'api-json.php', params);
    Response response = await http.get(url);
    if(response.statusCode == 200) {
      List json = convert.jsonDecode(response.body);
      return BsSelectBoxResponse.createFromJson(json);
    }

    return BsSelectBoxResponse(options: []);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: BsRow(
                    gutter: EdgeInsets.only(left: 10.0, right: 10.0),
                    children: [
                      BsCol(
                        height: 700.0,
                        sizes: ColScreen(sm: Col.col_2),
                        child: BsSelectBox(
                          hintText: 'Pilih salah satu',
                          selectBoxController: _select1,
                        ),
                      ),
                      BsCol(
                        height: 700.0,
                        sizes: ColScreen(sm: Col.col_2),
                        child: BsSelectBox(
                          hintTextLabel: 'Pilih salah satu',
                          selectBoxController: _select1,
                        ),
                      ),
                      BsCol(
                        sizes: ColScreen(sm: Col.col_2),
                        child: BsSelectBox(
                          hintText: 'Pilih multiple',
                          selectBoxController: _select2,
                        ),
                      ),
                      BsCol(
                        sizes: ColScreen(sm: Col.col_2),
                        child: BsSelectBox(
                          searchable: true,
                          disabled: true,
                          hintText: 'Pilih salah satu',
                          selectBoxController: _select2,
                        ),
                      ),
                      BsCol(
                        sizes: ColScreen(sm: Col.col_2),
                        child: BsSelectBox(
                          hintText: 'Pilih salah satu',
                          searchable: true,
                          selectBoxController: _select3,
                          serverSide: selectApi,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
