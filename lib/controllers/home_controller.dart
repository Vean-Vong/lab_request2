import 'package:get/get.dart';
import '../models/request_model.dart';
import '../services/session_service.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  var selectedDate = DateTime.now().obs;
  var selectedLab = ''.obs;
  var sessions = <SessionInfo>[].obs;
  var userInfos = <String, UserInfo>{}.obs; // Maps session timeslots to UserInfo

  final RequestService _requestService = RequestService();

  void updateSelectedDate(DateTime date) {
    selectedDate.value = date;
    print("Selected Date: ${selectedDate.value}");
    fetchSessions(); // Ensure this is called
  }

  void updateSelectedLab(String? labName) {
    if (labName != null) {
      selectedLab.value = labName;
      print("Selected Lab: ${selectedLab.value}");
      fetchSessions(); // Ensure this is called
    }
  }

  Future<void> fetchSessions() async {
    try {
      var labRequests = await _requestService.fetchRequests();
      print("Fetched ${labRequests.length} requests");

      String selectedDateStr = DateFormat('yyyy-MM-dd').format(selectedDate.value);

      var filteredRequests = labRequests.where((request) {
        String requestDate = DateFormat('yyyy-MM-dd').format(DateTime.parse(request.requestDetails.requestTimestamp));
        return request.labInfo.labName == selectedLab.value && requestDate == selectedDateStr;
      }).toList();

      print("Filtered Requests: ${filteredRequests.length}");

      var allSessions = <SessionInfo>[];
      var tempUserInfos = <String, UserInfo>{}; // Temporary storage for UserInfo

      for (var request in filteredRequests) {
        allSessions.addAll(request.sessionInfo);
        tempUserInfos[request.labInfo.labName] = request.userInfo;
      }

      print("All Sessions: ${allSessions.length}");

      sessions.value = allSessions;
      userInfos.value = tempUserInfos; // Update userInfos mapping
    } catch (e) {
      print("Error fetching sessions: $e");
    }
  }
}
