import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DateSelectionController extends GetxController {
  var selectedDate = DateTime.now().obs;
  var selectedLab = ''.obs;
  var selectedSessions = <String>[].obs;

  // Additional details
  var softwareNeed = ''.obs;
  var generation = ''.obs;
  var major = ''.obs;
  var subject = ''.obs;
  var studentQuantity = ''.obs;
  var additionalNotes = ''.obs;

  // List store multiple requests
  var requests = <Map<String, dynamic>>[].obs;

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
      print("Invalid lab name provided");
    }
  }

  // Method to toggle session selection
  void toggleSessionSelection(String sessionTime) {
    if (selectedSessions.contains(sessionTime)) {
      selectedSessions.remove(sessionTime);
    } else {
      selectedSessions.add(sessionTime);
    }
    print("Selected Sessions: ${selectedSessions.join(', ')}");
  }

  // Update additional details
  void updateSoftwareNeed(String value) {
    softwareNeed.value = value;
  }

  void updateGeneration(String value) {
    generation.value = value;
  }

  void updateMajor(String value) {
    major.value = value;
  }

  void updateSubject(String value) {
    subject.value = value;
  }

  void updateStudentQuantity(String value) {
    studentQuantity.value = value;
  }

  void updateAdditionalNote(String value) {
    additionalNotes.value = value;
  }

  // Check if all selections are made
  bool areSelectionsComplete() {
    return selectedDate.value != DateTime.now() &&
        selectedLab.value.isNotEmpty &&
        selectedSessions.isNotEmpty;
  }

  // Check if all input field are made
  bool areInputComplete() {
    return softwareNeed.value.isNotEmpty &&
        generation.value.isNotEmpty &&
        major.value.isNotEmpty &&
        subject.value.isNotEmpty &&
        studentQuantity.value.isNotEmpty;
  }

  // Add current selections to request history
  void addRequest() {
    requests.add({
      'date': DateFormat('dd MMM yyyy - hh:mm a').format(selectedDate.value),
      'labName': selectedLab.value,
      'sessions': selectedSessions.join(', '),
      'softwareNeed': softwareNeed.value,
      'generation': generation.value,
      'major': major.value,
      'subject': subject.value,
      'studentQuantity': studentQuantity.value,
      'additionalNotes': additionalNotes.value,
    });
  }

  // Clear current selection
  void clearSelections() {
    selectedDate.value = DateTime.now();
    selectedLab.value = '';
    selectedSessions.clear();
    softwareNeed.value = '';
    generation.value = '';
    major.value = '';
    subject.value = '';
    studentQuantity.value = '';
    additionalNotes.value = '';
  }

  // Method to print all stored values for submission (for testing)
  void printAllData() {
    print("Selected Date: ${selectedDate.value}");
    print("Selected Lab: ${selectedLab.value}");
    print("Selected Sessions: ${selectedSessions.join(', ')}");
    print("Software Need: ${softwareNeed.value}");
    print("Generation: ${generation.value}");
    print("Major: ${major.value}");
    print("Subject: ${subject.value}");
    print("Student Quantity: ${studentQuantity.value}");
    print("Additional Note: ${additionalNotes.value}");
  }
}
