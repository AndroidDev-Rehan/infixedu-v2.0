// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:http/http.dart' as http;

// Project imports:
import 'package:infixedu/utils/CustomAppBarWidget.dart';
import 'package:infixedu/utils/Utils.dart';
import 'package:infixedu/utils/apis/Apis.dart';
import 'package:infixedu/utils/model/ClassExam.dart';
import 'package:infixedu/utils/model/ExamRoutineReport.dart';
import 'package:infixedu/utils/model/ExamSchedule.dart';
import 'package:infixedu/utils/widget/ClassExamResultRow.dart';

// ignore: must_be_immutable
class ClassExamResultScreen extends StatefulWidget {
  var id;

  ClassExamResultScreen({this.id});

  @override
  _ClassExamResultScreenState createState() => _ClassExamResultScreenState();
}

class _ClassExamResultScreenState extends State<ClassExamResultScreen> {
  Future<ClassExamResultList> results;
  var id;
  dynamic examId;
  var _selected;
  String _token;

  Future<ExamSchedule> examSchedule;
  int examTypeId;

  @override
  void initState() {
    Utils.getStringValue('token').then((value) {
      _token = value;
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Utils.getStringValue('id').then((value) {
      setState(() {
        id = widget.id != null ? widget.id : value;

        examSchedule = getStudentExamSchedule(id);

        examSchedule.then((val) {
          setState(() {
            _selected = val.examTypes.length != 0 ? val.examTypes[0].title : '';
            examTypeId = val.examTypes.length != 0 ? val.examTypes[0].id : 0;
            results = getAllClassExamResult(id, examTypeId);
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(title: 'Exam Result'),
      backgroundColor: Colors.white,
      body: FutureBuilder<ExamSchedule>(
        future: examSchedule,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.examTypes.length > 0) {
              return Column(
                children: <Widget>[
                  getDropdown(snapshot.data.examTypes),
                  SizedBox(
                    height: 15.0,
                  ),
                  Expanded(child: getExamResultList())
                ],
              );
            } else {
              return Utils.noDataWidget();
            }
          } else {
            return Center(
              child: CupertinoActivityIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget getDropdown(List<ExamType> exams) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButton(
        elevation: 0,
        isExpanded: true,
        items: exams.map((item) {
          return DropdownMenuItem<String>(
            value: item.title,
            child: Text(
              item.title,
              style: Theme.of(context).textTheme.subtitle1.copyWith(),
            ),
          );
        }).toList(),
        style: Theme.of(context).textTheme.headline4.copyWith(fontSize: 15.0),
        onChanged: (value) {
          setState(() {
            _selected = value;

            examId = getExamCode(exams, value);
            results = getAllClassExamResult(id, examId);

            getExamResultList();
          });
        },
        value: _selected,
      ),
    );
  }

  Future<ClassExamResultList> getAllClassExamResult(
      var id, dynamic examId) async {
    print(Uri.parse(InfixApi.getStudentClassExamResult(id, examId)));
    final response = await http.get(
        Uri.parse(InfixApi.getStudentClassExamResult(id, examId)),
        headers: Utils.setHeader(_token.toString()));
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      return ClassExamResultList.fromJson(jsonData['data']['exam_result']);
    } else {
      throw Exception('Failed to load');
    }
  }

  int getExamCode(List<ExamType> exams, String title) {
    int code;

    for (ExamType exam in exams) {
      if (exam.title == title) {
        code = exam.id;
        break;
      }
    }
    return code;
  }

  Future<ExamSchedule> getStudentExamSchedule(var id) async {
    final response = await http.get(
        Uri.parse(InfixApi.getStudentExamSchedule(id)),
        headers: Utils.setHeader(_token.toString()));
    if (response.statusCode == 200) {
      return examScheduleFromJson(response.body);
    } else {
      throw Exception('Failed to load');
    }
  }

  Widget getExamResultList() {
    return FutureBuilder<ClassExamResultList>(
      future: results,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (snapshot.hasData) {
            if (snapshot.data.results.length > 0) {
              return ListView.builder(
                itemCount: snapshot.data.results.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ClassExamResultRow(snapshot.data.results[index]);
                },
              );
            } else {
              return Utils.noDataWidget();
            }
          } else {
            return Center(
              child: CupertinoActivityIndicator(),
            );
          }
        }
      },
    );
  }
}
