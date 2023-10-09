import 'package:eco/services/imgs/imgs_controller_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.display_settings),
        onPressed: () {},
        label: const Text('ПАРАМЕТРЫ ПОИСКА'),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: const Text('Обзор'),
        actions: const [
          Icon(Icons.search),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(mainAxisSize: MainAxisSize.max, children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Row(
                    children: [
                      Icon(Icons.flag),
                      SizedBox(width: 5),
                      Text('Места'),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {},
                  child: const Row(
                    children: [
                      Icon(Icons.earbuds_rounded),
                      SizedBox(width: 5),
                      Text('Маршруты'),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {},
                  child: const Row(
                    children: [
                      Icon(Icons.celebration),
                      SizedBox(width: 5),
                      Text('Мероприятия'),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {},
                  child: const Row(
                    children: [
                      Icon(Icons.restore_from_trash),
                      SizedBox(width: 5),
                      Text('Точки сортировки'),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: ListView.separated(
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image.asset(ImgsControllerService.defaultImg.url()),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                iconSize: 50,
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                  ImgsControllerService.favoriteButton.url('svg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              IconButton(
                                iconSize: 50,
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                  ImgsControllerService.shareButton.url('svg'),
                                  fit: BoxFit.cover,
                                ),
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 125,
                            padding: const EdgeInsets.all(12),
                            decoration:
                                BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(25)),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Name'),
                                Row(
                                  children: [Icon(Icons.place), Text('Location')],
                                ),
                                Row(
                                  children: [
                                    Row(
                                      children: [Icon(Icons.access_time), SizedBox(width: 5), Text('0.0')],
                                    ),
                                    SizedBox(width: 8),
                                    Row(
                                      children: [Icon(Icons.access_time), SizedBox(width: 5), Text('0.0')],
                                    ),
                                    SizedBox(width: 8),
                                    Row(
                                      children: [Icon(Icons.access_time), SizedBox(width: 5), Text('0.0')],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                );
              },
              separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 15),
            ),
          ),
        ]),
      ),
    );
  }
}
