import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/firestore_list_screen_controller.dart';

class FirestoreListScreenView extends GetView<FirestoreListScreenController> {
  const FirestoreListScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Firestore Screen'),
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
            Get.toNamed(Routes.ADD_POST_FIRESTORE);
          },
          child: Icon(Icons.add),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              StreamBuilder(
                  stream: controller.firestoreData,
                  builder: (BuildContext context, snapshot) {
                    if(snapshot.connectionState==ConnectionState.waiting){
                      return CircularProgressIndicator();
                    }
                    if(snapshot.hasError){
                      return Text("Something Went Wrong");
                    }
                    return Expanded(
                      child:  ListView.builder(
                          itemCount: snapshot.data?.docs.length,
                          itemBuilder: (context, index) {
                            var item = snapshot.data?.docs[index];
                            if (controller.searchText.value.isEmpty) {
                              return ListTile(
                                title: Text(item!['id'].toString()),
                                subtitle: Text(item!['title'].toString()),
                                trailing: PopupMenuButton(
                                    itemBuilder: (context) => [
                                          PopupMenuItem(
                                              child: (ListTile(
                                            leading: const Icon(Icons.edit),
                                            title: const Text("Edit"),
                                            onTap: () {
                                              Get.back(closeOverlays: false);
                                              controller.showDialogue(
                                                  item!['title'].toString(),
                                                  item!['id'].toString(),
                                                  "update");
                                            },
                                          ))),
                                          PopupMenuItem(
                                              child: (ListTile(
                                            leading:
                                                Icon(Icons.dangerous_outlined),
                                            title: Text("Delete"),
                                            onTap: () {
                                              Get.back();
                                              controller.showDialogue(
                                                  item!['title'].toString(),
                                                  item!['id'].toString(),
                                                  "delete");
                                            },
                                          )))
                                        ]),
                              );
                            }

                            // else if (item['title']
                            //     .toString()
                            //     .toLowerCase()
                            //     .contains(controller.searchText.value)) {
                            //   return ListTile(
                            //     title: Text(item['title']),
                            //     subtitle: Text(item['id']),
                            //     trailing: PopupMenuButton(
                            //         itemBuilder: (context) => [
                            //               PopupMenuItem(
                            //                   child: (ListTile(
                            //                 leading: const Icon(Icons.edit),
                            //                 title: const Text("Edit"),
                            //                 onTap: () {
                            //                   // Get.back(closeOverlays: false);
                            //                   controller.showDialogue(
                            //                       item['title'],
                            //                       item['id'],
                            //                       "update");
                            //                 },
                            //               ))),
                            //               PopupMenuItem(
                            //                   child: (ListTile(
                            //                 leading:
                            //                     Icon(Icons.dangerous_outlined),
                            //                 title: Text("Delete"),
                            //                 onTap: () {
                            //                   Get.back(closeOverlays: false);
                            //                   controller.showDialogue(
                            //                       item['title'],
                            //                       item['id'],
                            //                       "delete");
                            //                 },
                            //               )))
                            //             ]),
                            //   );
                            // }
                            else {
                              return Container();
                            }
                          },
                        ),

                    );
                  }),
            ],
          ),
        ));
  }
}
