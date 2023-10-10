import 'package:auto_route/auto_route.dart';
import 'package:eco/services/imgs/imgs_controller_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class MarksScreen extends StatefulWidget {
  const MarksScreen({super.key});

  @override
  State<MarksScreen> createState() => _MarksScreenState();
}

class _MarksScreenState extends State<MarksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            padding: const EdgeInsets.all(12),
                            decoration:
                                BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(25)),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Text('Name'),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Wrap(
                                    children: [Icon(Icons.place), Text('Location')],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Wrap(
                                    spacing: 10,
                                    children: [
                                      Wrap(
                                        spacing: 5,
                                        alignment: WrapAlignment.center,
                                        children: [
                                          Icon(Icons.access_time),
                                          Text(
                                            '0.0',
                                            style: TextStyle(fontSize: 17),
                                          )
                                        ],
                                      ),
                                      Wrap(
                                        spacing: 5,
                                        alignment: WrapAlignment.center,
                                        children: [Icon(Icons.access_time), Text('0.0')],
                                      ),
                                      Wrap(
                                        spacing: 5,
                                        children: [Icon(Icons.access_time), Text('0.0')],
                                      )
                                    ],
                                  ),
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
