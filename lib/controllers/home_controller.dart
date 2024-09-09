import 'package:get/get.dart';
import '../models/request_model.dart';
import '../services/session_service.dart';

class HomeController extends GetxController {
  var selectedDate = DateTime.now().obs;
  var selectedLab = ''.obs;
  var sessions = <SessionInfo>[].obs;

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

  // Fetch sessions based on selected date and lab
  Future<void> fetchSessions() async {
    try {
      var labRequests = await _requestService.fetchRequests();
      print("Fetched ${labRequests.length} requests");

      var filteredRequests = labRequests
          .where((request) => request.labInfo.labName == selectedLab.value)
          .toList();

      print("Filtered Requests: ${filteredRequests.length}");

      var allSessions = <SessionInfo>[];

      for (var request in filteredRequests) {
        allSessions.addAll(request.sessionInfo);
      }

      print("All Sessions: ${allSessions.length}");

      sessions.value = allSessions;  
    } catch (e) {
      print("Error fetching sessions: $e");
    }
  }
}
