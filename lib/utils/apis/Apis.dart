// Project imports:
import 'package:infixedu/config/app_config.dart';

class InfixApi {
  static String root = AppConfig.domainName + '/';

  static String baseApi = root + 'api/';

  static String uploadHomework = baseApi + "add-homework";

  static String studentDormitoryList = baseApi + "student-dormitory";

  static String bookList = baseApi + "book-list";
  static String adminFeeList = baseApi + "fees-group";

  static String uploadContent = baseApi + "teacher-upload-content";
  static String currentPermission = baseApi + "privacy-permission-status";
  static String createVirtualClass = "zoom/create-virtual-class";
  static String createVirtualClassUrl = "zoom-class-room";
  static String zoomMakeMeeting = "zoom-make-meeting";
  static String service = baseApi + 'service/check';
  static String zoomMakeMeetingUrl = "zoom-meeting-room";

  static String login(String email, String password) {
    return baseApi + 'login?email=' + email + '&password=' + password;
  }

  static String getFeesUrl(dynamic id) {
    return baseApi + 'fees-collect-student-wise/$id';
  }

  static String getRoutineUrl(dynamic id) {
    return baseApi + "student-class-routine/$id";
  }

  static String getStudenthomeWorksUrl(dynamic id) {
    return baseApi + "student-homework/$id";
  }

  static String driverList = baseApi + "driver-list";
  static String studentTransportList = baseApi + "student-transport-report";

  static String getSubjectsUrl(dynamic id) {
    return baseApi + "studentSubject/$id";
  }

  static String getStudentTeacherUrl(dynamic id) {
    return baseApi + "studentTeacher/$id";
  }

  static String getTeacherPhonePermission(dynamic mPerm) {
    return baseApi + "privacy-permission/$mPerm";
  }

  static String getStudentIssuedBook(dynamic id) {
    return baseApi + "student-library/$id";
  }

  static String getNoticeUrl(dynamic id) {
    return baseApi + "student-noticeboard/$id";
  }

  static String getStudentTimeline(dynamic id) {
    return baseApi + "student-timeline/$id";
  }

  static String getStudentClassExamName(var id) {
    return baseApi + "exam-list/$id";
  }

  static String getStudentClsExamShedule(var id, dynamic code) {
    return baseApi + "exam-schedule/$id/$code";
  }

  static String getTeacherAttendence(dynamic id, dynamic month, dynamic year) {
    return baseApi + "my-attendance/$id?month=$month&year=$year";
  }

  static String getStudentAttendence(var id, dynamic month, dynamic year) {
    return baseApi + "student-my-attendance/$id?month=$month&year=$year";
  }

  static String getStudentOnlineResult(dynamic id, dynamic examId) {
    return baseApi + "online-exam-result/$id/$examId";
  }

  static String getStudentClassExamResult(var id, dynamic examId) {
    return baseApi + "exam-result/$id/$examId";
  }

  static String getStudentByClass(dynamic mClass) {
    return baseApi + "search-student?class=$mClass";
  }

  static String getStudentByName(String name,dynamic mClass, dynamic mSection) {
    return baseApi + "search-student?name=$name&section=$mSection&class=$mClass";
  }

  static String getStudentByRoll(String roll) {
    return baseApi + "search-student?roll_no=$roll";
  }

  static String getStudentByClassAndSection(dynamic mClass, dynamic mSection) {
    return baseApi + "search-student?section=$mSection&class=$mClass";
  }

  static String getAllStaff(dynamic id) {
    return baseApi + "staff-list/$id";
  }

  static String getSectionById(dynamic id, dynamic classId) {
    return baseApi + "teacher-section-list?id=$id&class=$classId";
  }

  static String getClassById(dynamic id) {
    return baseApi + "teacher-class-list?id=$id";
  }

  static String getChildren(String id) {
    return baseApi + "childInfo/$id";
  }

  static String getTeacherSubject(dynamic id) {
    return baseApi + "subject/$id";
  }

  static String getTeacherMyRoutine(dynamic id) {
    return baseApi + "my-routine/$id";
  }

  static String getRoutineByClassAndSection(
      dynamic id, dynamic mClass, dynamic mSection) {
    return baseApi + "section-routine/$id/$mClass/$mSection";
  }

  static String getAllContent() {
    return baseApi + "content-list";
  }

  static String deleteContent(dynamic id) {
    return baseApi + "delete-content/$id";
  }

  static String attendanceDataSend(
      String id, String atten, String date, dynamic mClass, dynamic mSection) {
    return baseApi +
        "student-attendance-store-second?id=$id&attendance=$atten&date=$date&class=$mClass&section=$mSection";
  }

  static String attendanceDefaultSent(
      String date, String mClass, String mSection) {
    return baseApi +
        "student-attendance-store-first?date=" +
        date +
        "&class=" +
        mClass +
        "&section=" +
        mSection;
  }

  static String attendanceCheck(String date, dynamic mClass, dynamic mSection) {
    return baseApi +
        "student-attendance-check?date=$date&class=$mClass&section=$mSection";
  }

  static String about = baseApi + "parent-about";

  static String getHomeWorkListUrl(dynamic id) {
    return baseApi + "homework-list/$id";
  }

  static String getLeaveList(dynamic id) {
    return baseApi + "staff-apply-list/$id";
  }

  static String getParentChildList(String id) {
    return baseApi + "child-list/$id";
  }

  static String getStudentOnlineActiveExam(var id) {
    return baseApi + "student-online-exam/$id";
  }

  static String getStudentOnlineActiveExamName(var id) {
    return baseApi + "choose-exam/$id";
  }

  static String getStudentOnlineActiveExamResult(var id, var examId) {
    return baseApi + "online-exam-result/$id/$examId";
  }

  static String getMeeting({uid, param}) {
    return baseApi + "$param/user_id/$uid";
  }

  static String getMeetingUrl({mid, uid, param}) {
    return baseApi + "$param/meeting_id/$mid/user_id/$uid";
  }

  static String getJoinMeetingUrlApp({mid}) {
    // return 'https://zoom.us/wc/$mid/start';
    // return 'https://zoom.us/wc/$mid/join?prefer=1'; // web
    return 'zoomus://zoom.us/join?confno=$mid'; // android
  }

  static String getJoinMeetingUrlWeb({mid}) {
    // return 'https://zoom.us/wc/$mid/start';
    return 'https://zoom.us/wc/$mid/join?prefer=1';
  }

  static String feesDataSend(String name, String description) {
    return baseApi +
        "fees-group-store?name=" +
        name +
        "&description=" +
        description;
  }

  static String feesDataUpdate(String name, String description, dynamic id) {
    return baseApi +
        "fees-group-update?name=" +
        name +
        "&description=" +
        description +
        "&id=$id";
  }

  static String addBook(
      String title,
      String categoryId,
      String bookNo,
      String isbn,
      String publisherName,
      String authorName,
      String subjectId,
      String reckNo,
      String quantity,
      String price,
      String details,
      String date,
      String userId,
      String schoolId) {
    return baseApi +
        "save-book-data?book_title=" +
        title +
        "&book_category_id=" +
        categoryId +
        "&book_number=" +
        bookNo +
        "&isbn_no=" +
        isbn +
        "&publisher_name=" +
        publisherName +
        "&author_name=" +
        authorName +
        "&subject_id=" +
        subjectId +
        "&rack_number=" +
        reckNo +
        "&quantity=" +
        quantity +
        "&book_price=" +
        price +
        "&details=" +
        details +
        "&post_date=" +
        date +
        "&user_id=$userId&school_id=$schoolId";
  }

  static String adminAddBook = baseApi + "save-book-data";

  static String addLibraryMember(
      String memberType,
      String memberUdId,
      String clsId,
      String secId,
      String studentId,
      String stuffId,
      String createdBy) {
    return baseApi +
        "add-library-member?member_type=" +
        memberType +
        "&member_ud_id=" +
        memberUdId +
        "&class=" +
        clsId +
        "&section=" +
        secId +
        "&student=" +
        studentId +
        "&staff=" +
        stuffId +
        "&created_by=$createdBy";
  }

  static String addRoute(String title, String fare, String uid) {
    return baseApi +
        "transport-route?title=" +
        title +
        "&far=" +
        fare +
        "&user_id=" +
        uid;
  }

  static String transportRoute = baseApi + 'transport-route';

  static String addVehicle(String vehicleNo, String model, String driverId,
      String note, String year) {
    return baseApi +
        "vehicle?vehicle_number=" +
        vehicleNo +
        "&vehicle_model=" +
        model +
        "&driver_id=" +
        driverId +
        "&note=" +
        note +
        "&year_made=$year";
  }

  static String vehicles = baseApi + "vehicle";

  static String addDormitory(String name, String type, String dynamicake,
      String address, String description) {
    return baseApi +
        "add-dormitory?dormitory_name=" +
        name +
        "&type=" +
        type +
        "&dynamicake=" +
        dynamicake +
        "&address=" +
        address +
        "&description=" +
        description;
  }

  static String adminAddDormitory = baseApi + "add-dormitory";

  static String setToken(String id, String token) {
    return baseApi + "set-fcm-token?id=$id&token=$token";
  }

  static String sentNotificationForAll(
      dynamic role, String title, String body) {
    return baseApi + "flutter-group-token?id=$role&body=$body&title=$title";
  }

  static String sentNotificationByToken(String title, String body, String id) {
    return baseApi + "flutter-notification-api?id=$id&body=$body&title=$title";
  }

  static String sentNotificationToSection(
      String title, String body, String classId, String sectionId) {
    return baseApi +
        "homework-notification-api?body=$body&title=$title&class_id=$classId&section_id=$sectionId";
  }

  static String sendLeaveData(String applyDate, String leaveType,
      String leaveForm, String leaveTo, String id, String reason, String path) {
    return baseApi +
        "staff-apply-leave?teacher_id=$id&reason=$reason&leave_type=$leaveType&leave_from=$leaveForm&leave_to=$leaveTo&apply_date=$applyDate&attach_file=$path";
  }

  static String setLeaveStatus(dynamic id, String status) {
    return baseApi + "update-leave?id=$id&status=$status";
  }

  static String bookCategory = baseApi + "book-category";
  static String subjectList = baseApi + "subject";
  static String leaveType = baseApi + "staff-leave-type";
  static String applyLeave = baseApi + "staff-apply-leave";
  static String getEmail = baseApi + "user-demo";
  static String getLibraryMemberCategory = baseApi + "library-member-role";
  static String getStuffCategory = baseApi + "staff-roles";

  // static String DRIVER_LIST = baseApi+"driver-list";
  static String dormitoryRoomList = baseApi + "room-list";
  static String dormitoryList = baseApi + "dormitory-list";
  static String roomTypeList = baseApi + "room-type-list";
  static String pendingLeave = baseApi + "pending-leave";
  static String approvedLeave = baseApi + "approved-leave";
  static String rejectedLeave = baseApi + "reject-leave";

  //NEW APIs

  static String getStudentAssignment(dynamic id) {
    return baseApi + "studentAssignment/$id";
  }

  static String getStudentSyllabus(dynamic id) {
    return baseApi + "studentSyllabus/$id";
  }

  static String getStudentOtherDownloads(dynamic id) {
    return baseApi + "studentOtherDownloads/$id";
  }

  static String getMyNotifications(dynamic id) {
    return baseApi + "myNotification/$id";
  }

  static String readMyNotifications(dynamic userID, notificationID) {
    return baseApi + "viewNotification/$userID/$notificationID";
  }

  static String readAllNotification(dynamic userID) {
    return baseApi + "viewAllNotification/$userID";
  }

  static String changePassword(String currentPassword, String newPassword,
      String confirmPassword, String userID) {
    return baseApi +
        "change-password?current_password=$currentPassword&new_password=$newPassword&confirm_password=$confirmPassword&id=$userID";
  }

  static String childFeeBankPayment(
      String amount,
      dynamic classID,
      dynamic sectionID,
      String userID,
      dynamic feeTypeID,
      String paymentMode,
      String paymentDate,
      dynamic bankID) {
    return baseApi +
        "child-bank-slip-store?amount=$amount&class_id=$classID&section_id=$sectionID&user_id=$userID&fees_type_id=$feeTypeID&payment_mode=$paymentMode&date=$paymentDate&bank_id=$bankID";
  }

  static String childFeeChequePayment(
    String amount,
    dynamic classID,
    dynamic sectionID,
    String userID,
    dynamic feeTypeID,
    String paymentMode,
    String paymentDate,
  ) {
    return baseApi +
        "child-bank-slip-store?amount=$amount&class_id=$classID&section_id=$sectionID&user_id=$userID&fees_type_id=$feeTypeID&payment_mode=$paymentMode&date=$paymentDate";
  }

  static String logout() {
    return baseApi + "auth/logout";
  }

  static String bankList = baseApi + "banks";

  static String userLeaveType(id) {
    return baseApi + "my-leave-type/$id";
  }

  static String studentUploadHomework = baseApi + 'student-upload-homework';

  static String userApplyLeaveStore = baseApi + 'student-apply-leave-store';

  static String studentApplyLeave(id) {
    return baseApi + "student-apply-leave/$id";
  }

  static String approvedLeaves(id) {
    return baseApi + "approve-leave/$id";
  }

  static String pendingLeaves(id) {
    return baseApi + "pending-leave/$id";
  }

  static String rejectedLeaves(id) {
    return baseApi + "reject-leave/$id";
  }

  static String homeworkEvaluationList(classId, sectionId, homeworkId) {
    return baseApi + "evaluation-homework/$classId/$sectionId/$homeworkId";
  }

  static String evaluateHomework = baseApi + "evaluate-homework";

  static String assignVehicle = baseApi + "assign-vehicle";

  static String paymentMethods(schoolId) {
    return baseApi + "school/$schoolId/payment-method";
  }

  static String feePayment = baseApi + "student-fees-payment";

  static String studentFeePayment(String stuId, dynamic feesType, String amount,
      String paidBy, String paymentMethod) {
    return baseApi +
        "student-fees-payment?student_id=$stuId&fees_type_id=$feesType&amount=$amount&paid_by=$paidBy&payment_mode=$paymentMethod";
  }

  static String paymentDataSave = baseApi + "payment-data-save";
  // static String paymentSuccessCallback = baseApi + "payment-success-callback";

  static String paymentSuccessCallback(status, paymentRef, amount) {
    return baseApi +
        "payment-success-callback?status=$status&payment_ref=$paymentRef&amount=$amount";
  }

  static String updateStudent = baseApi + "update-student";

  static String notice(var schoolId) {
    return baseApi + "school/$schoolId/notice-list";
  }

  static String routineView(userId, role, {bool mine}) {
    if (role == "student") {
      return baseApi + "class-routine-view/$userId";
    } else {
      if (mine) {
        return baseApi + "teacher-routine-view/$userId";
      } else {
        return baseApi + "student-routine-view/$userId";
      }
    }
  }

  static String getStudentExamSchedule(
    var id,
  ) {
    return baseApi + "student-exam-schedule/$id";
  }

  static String getStudentRoutineReport = baseApi + "exam-routine-report";

  static String getDayWiseRoutine = baseApi + "day-wise-class-routine";

  //** Chats */

  static String getChatOpen = baseApi + "chat/open";

  static String chatInvitaionOpen = baseApi + "chat/invitation/user/open";

  static String searchChatUser = baseApi + "chat/user/search";

  static String getChatStatus = baseApi + "chat/user/show";

  static String changeChatStatus = baseApi + "chat/user/status";

  static String submitChatText = baseApi + "chat/send/user";

  static String newChatMsgCheck = baseApi + "chat/message/check";

  static String chatMsgLoadMore = baseApi + "chat/message/load/more";

  static String chatSingleMsgDelete = baseApi + "chat/delete";

  static String chatSingleForwardMessage = baseApi + "chat/send/forward";

  static String chatFiles = baseApi + "chat/files";

  static String chatPermissionGet = baseApi + "chat/settings/permission";

  static String chatGroupCreate = baseApi + "chat/group/create";

  static String chatGroupDelete = baseApi + "chat/group/delete";

  static String chatGroupOpen = baseApi + "chat/group/open";

  static String chatGroupMsgLoadMore = baseApi + "chat/group/message/load/more";

  static String chatGroupMsgCheck = baseApi + "chat/group/message/check";

  static String chatGroupSetReadOnly = baseApi + "chat/group/read-only";

  static String chatGroupAssignRole = baseApi + "chat/group/assign";

  static String groupFileDownload = baseApi + "chat/group/file/download";

  static String groupRemovePeople = baseApi + "chat/group/remove/people";

  static String groupAddPeople = baseApi + "chat/group/add/people";

  static String submitChatGroupText = baseApi + "chat/group/open/send";

  static String chatGroupLeave = baseApi + "chat/group/leave";

  static String chatGroupMessageDelete = baseApi + "chat/group/message/delete";

  static String chatGroupForwardMessage = baseApi + "chat/send/group/forward";

  static String chatUserBlockAction = baseApi + "chat/user/action";

  static String chatGetBlockedUsers = baseApi + "chat/users/blocked";
}
