import 'package:get/get.dart';

class SelectionController extends GetxController {
  // Track selected lab index
  RxInt selectedLabIndex = RxInt(-1); // -1 indicates no lab selected

  // Track selected time slots
  RxList<int> selectedTimeIndices = RxList<int>();

  // Track selected date
  Rx<DateTime> selectedDate = Rx<DateTime>(DateTime.now());

  var isExpanded = true.obs;

  var isSessionExpanded = true.obs;

  // Method to update selected lab
  void selectLab(int index) {
    selectedLabIndex.value = index;
  }

  // Method to toggle time slot selection
  void toggleTimeSelection(int index) {
    if (selectedTimeIndices.contains(index)) {
      selectedTimeIndices.remove(index);
    } else {
      selectedTimeIndices.add(index);
    }
  }

  // Method to update selected date
  void selectDate(DateTime date) {
    selectedDate.value = date;
  }
}
