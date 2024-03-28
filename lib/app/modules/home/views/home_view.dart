import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('HomeView'),
          centerTitle: true,
          actions: [
            IconButton(
                icon: Icon(Icons.logout),
                onPressed: () {
                  controller.logout();
                }),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(Routes.ADD_POST);
          },
          child: Icon(Icons.add),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    controller.searchText.value = value;
                    controller.dataList.refresh();
                  },
                ),
              ),
              Expanded(
                child: Obx(
                  () => ListView.builder(
                    itemCount: controller.dataList.length,
                    itemBuilder: (context, index) {
                      var item = controller.dataList[index];
                      if (controller.searchText.value.isEmpty) {
                        return ListTile(
                          title: Text(item['title']),
                          subtitle: Text(item['id']),
                          trailing: PopupMenuButton(
                              itemBuilder: (context) => [
                                    PopupMenuItem(
                                        child: (ListTile(
                                      leading: const Icon(Icons.edit),
                                      title: const Text("Edit"),
                                      onTap: () {
                                        Get.back(closeOverlays: false);
                                        controller.showDialogue(
                                            item['title'], item['id'],"update");
                                      },
                                    ))),
                                     PopupMenuItem(
                                        child: (ListTile(
                                      leading: Icon(Icons.dangerous_outlined),
                                      title: Text("Delete"),
                                          onTap: () {
                                            Get.back();
                                            controller.showDialogue(
                                                item['title'], item['id'],"delete");
                                          },
                                    )))
                                  ]),
                        );
                      } else if (item['title']
                          .toString()
                          .toLowerCase()
                          .contains(controller.searchText.value)) {
                        return ListTile(
                          title: Text(item['title']),
                          subtitle: Text(item['id']),
                          trailing: PopupMenuButton(
                              itemBuilder: (context) => [
                                PopupMenuItem(
                                    child: (ListTile(
                                      leading: const Icon(Icons.edit),
                                      title: const Text("Edit"),
                                      onTap: () {
                                        // Get.back(closeOverlays: false);
                                        controller.showDialogue(
                                            item['title'], item['id'],"update");
                                      },
                                    ))),
                                 PopupMenuItem(
                                    child: (ListTile(
                                      leading: Icon(Icons.dangerous_outlined),
                                      title: Text("Delete"),
                                      onTap: () {
                                        Get.back(closeOverlays: false);
                                        controller.showDialogue(
                                            item['title'], item['id'],"delete");
                                      },
                                    )))
                              ]),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
