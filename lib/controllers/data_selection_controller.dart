import 'package:get/get.dart';

class DateSelectionController extends GetxController {
  var selectedDate = DateTime.now().obs;
  var selectedLab = ''.obs; // Ensure this is not null
  var selectedSessions = <String>[].obs;

  // Method to update selected date
  void updateSelectedDate(DateTime date) {
    selectedDate.value = date;
    print("Selected Date: ${selectedDate.value}");
  }

  // Method to update selected lab name
  void updateSelectedLab(String? labName) {
    if (labName != null && labName.isNotEmpty) {
      selectedLab.value = labName;
      print("Selected Lab: ${selectedLab.value}");
    } else {
      // Handle the case where labName is null or empty
      print("Invalid lab name provided");
    }
  }

  // Method to toggle session selection
  void toggleSessionSelection(String sessionTime) {
    if (selectedSessions.contains(sessionTime)) {
      selectedSessions.remove(sessionTime); // Deselect if already selected
    } else {
      selectedSessions.add(sessionTime); // Add to selection
    }
    print("Selected Sessions: ${selectedSessions.join(', ')}");
  }

  // Check if all required selections are made
  bool areSelectionsComplete() {
    return selectedDate.value !=
            DateTime
                .now() && 
        selectedLab.value.isNotEmpty &&
        selectedSessions.isNotEmpty;
  }
}
