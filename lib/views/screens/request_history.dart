import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/data_selection_controller.dart';
import '../components/my_drawer.dart';
import 'notifiction_screen.dart';
import 'request_detail.dart';

class RequestHistory extends StatefulWidget {
  const RequestHistory({super.key});

  @override
  State<RequestHistory> createState() => _RequestHistoryState();
}

class _RequestHistoryState extends State<RequestHistory> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final DateSelectionController controller =
      Get.find<DateSelectionController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("histroy_request".tr),
        centerTitle: false,
        leading: IconButton(
          icon: Icon(Icons.sort),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        backgroundColor: Colors.grey[100],
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => Notifications());
            },
            icon: const Icon(Icons.notifications),
          ),
        ],
      ),
      backgroundColor: Colors.grey[100],

      // Drawer
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Obx(() {
          return GestureDetector(
            onTap: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'recent_request'.tr,
                  style: TextStyle(fontSize: 15, color: Colors.grey[600]),
                ),
                const SizedBox(height: 10),
                if (controller.requests.isNotEmpty)
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.requests.length,
                      itemBuilder: (context, index) {
                        final request = controller.requests[index];
                        return InkWell(
                          onTap: () {
                            Get.to(RequestDetail(index: index));
                          },
                          child: RequestCards(
                            labName: request['labName'],
                            date: request['date'],
                          ),
                        );
                      },
                    ),
                  )
                else
                  Center(child: const Text('No requests available')),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class RequestCards extends StatelessWidget {
  final String labName;
  final String date;

  const RequestCards({
    super.key,
    required this.labName,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.blue,
              width: 2,
            ),
          ),
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.computer, color: Colors.blue, size: 24),
                  const SizedBox(width: 8),
                  Text(
                    labName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Text(
                date,
                style: TextStyle(fontSize: 15, color: Colors.grey[600]),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
