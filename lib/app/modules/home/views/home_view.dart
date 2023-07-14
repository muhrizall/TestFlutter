import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Obx(() => controller.isLoading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: controller.product.length,
              itemBuilder: (context, index) {
                return Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 19, horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 8,
                          offset: Offset(0, 2))
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: 320,
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 136,
                            height: 140,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    controller.product[index].image),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            color: Colors.grey.withOpacity(0.5),
                            child: Text(
                              '\$ ${controller.product[index].price}',
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.product[index].title,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                controller.product[index].description,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 4,
                                textAlign: TextAlign.justify,
                              ),
                              const SizedBox(height: 14),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: const [
                                  Icon(Icons.star),
                                  Text(
                                    '4.1',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            )),
    );
  }
}
