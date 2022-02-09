import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// Project imports:
import 'package:infixedu/config/app_config.dart';
import 'package:infixedu/utils/FunctinsData.dart';
import 'package:infixedu/utils/Utils.dart';
import 'package:infixedu/utils/apis/Apis.dart';
import 'package:infixedu/utils/model/Routine.dart';
import 'package:infixedu/utils/server/LogoutService.dart';
import 'package:infixedu/utils/widget/RoutineRowWidget.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class DBStudentRoutine extends StatefulWidget {
  String id;

  DBStudentRoutine({this.id});

  @override
  State<DBStudentRoutine> createState() => _DBStudentRoutineState();
}

class _DBStudentRoutineState extends State<DBStudentRoutine> {
  List<String> weeks = AppFunction.weeks;
  var _token;
  Future<Routine> routine;

  Future<Routine> getRoutine() async {
    try {
      final response = await http.get(
          Uri.parse(InfixApi.routineView(
            widget.id,
            "student",
          )),
          headers: Utils.setHeader(_token.toString()));
      print(response.request.url.path);
      print(response.statusCode);
      if (response.statusCode == 200) {
        var data = routineFromJson(response.body);
        return data;
      } else {
        // If that response was not OK, throw an error.
        throw Exception('Failed to load post');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  void didChangeDependencies() async {
    await Utils.getStringValue('token').then((value) {
      setState(() {
        _token = value;
        routine = getRoutine();
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: AppBar(
          centerTitle: false,
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            padding: EdgeInsets.only(top: 20.h),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppConfig.appToolbarBackground),
                fit: BoxFit.fill,
              ),
              color: Colors.deepPurple,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  width: 25.w,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 0.0),
                    child: Text(
                      "Routine".tr,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          .copyWith(fontSize: 18.sp, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                IconButton(
                  onPressed: () {
                    Get.dialog(LogoutService().logoutDialog());
                  },
                  icon: Icon(
                    Icons.exit_to_app,
                    size: 25.sp,
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 10,
        ),
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0, left: 10.0, right: 10.0),
            child: FutureBuilder<Routine>(
              future: routine,
              builder: (context, snapshot) {
                print(snapshot.hasData);
                if (snapshot.hasData) {
                  if (snapshot.data.classRoutines.length > 0) {
                    return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: weeks.length,
                        itemBuilder: (context, index) {
                          List<ClassRoutine> classRoutines = snapshot
                              .data.classRoutines
                              .where((element) => element.day == weeks[index])
                              .toList();

                          return classRoutines.length == 0
                              ? Container()
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 8.0),
                                      child: Text(weeks[index],
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6
                                              .copyWith()),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 5.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Expanded(
                                            flex: 2,
                                            child: Text('Time'.tr,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline4
                                                    .copyWith()),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Text('Subject'.tr,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline4
                                                    .copyWith()),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Text('Room'.tr,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline4
                                                    .copyWith()),
                                          ),
                                        ],
                                      ),
                                    ),
                                    ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: classRoutines.length,
                                      shrinkWrap: true,
                                      itemBuilder: (context, rowIndex) {
                                        return RoutineRowDesign(
                                          classRoutines[rowIndex].startTime +
                                              '-' +
                                              classRoutines[rowIndex].endTime,
                                          classRoutines[rowIndex].subject,
                                          classRoutines[rowIndex].room,
                                        );
                                      },
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Container(
                                        height: 0.5,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF415094),
                                        ),
                                      ),
                                    )
                                  ],
                                );
                        });
                  } else {
                    return Text("");
                  }
                } else {
                  return Center(
                    child: CupertinoActivityIndicator(),
                  );
                }
              },
            ),
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
