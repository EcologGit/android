import 'package:auto_route/auto_route.dart';
import 'package:eco/main.dart';
import 'package:eco/services/imgs/imgs_controller_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class RouteDetailReviewPage extends StatelessWidget {
  const RouteDetailReviewPage({@PathParam('id') this.routeId, super.key});

  final String? routeId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Маршрут $routeId',
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: Image.asset(
                  ImgsControllerService.defaultImg.url('png'),
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Name',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    const Wrap(
                      spacing: 3,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Icon(
                          Icons.place,
                          size: 12,
                        ),
                        Text('Locality'),
                      ],
                    ),
                    const Wrap(
                      spacing: 3,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Icon(
                          Icons.flag_outlined,
                          size: 12,
                        ),
                        Text('xx.xxxxxx'),
                        Text('yy.yyyyyy'),
                      ],
                    ),
                    const Wrap(
                      spacing: 3,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Icon(
                          Icons.flag,
                          size: 12,
                        ),
                        Text('xx.xxxxxx'),
                        Text('yy.yyyyyy'),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Wrap(
                        spacing: 10,
                        children: [
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            spacing: 3,
                            children: [
                              Icon(
                                Icons.straighten,
                                size: 15,
                              ),
                              Text(
                                '0,0 км',
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              )
                            ],
                          ),
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            spacing: 3,
                            children: [
                              Icon(
                                Icons.hourglass_bottom,
                                size: 15,
                              ),
                              Text(
                                '0,0 ч',
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Wrap(
                      spacing: 10,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        SvgPicture.asset(
                          ImgsControllerService.mapButton.url(),
                          fit: BoxFit.cover,
                        ),
                        SvgPicture.asset(
                          ImgsControllerService.favoriteButton.url(),
                          fit: BoxFit.cover,
                        ),
                        SvgPicture.asset(
                          ImgsControllerService.newReportButton.url(),
                          fit: BoxFit.cover,
                        ),
                        SvgPicture.asset(
                          ImgsControllerService.shareButton.url(),
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                    const Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc, elementum ac commodo, tristique consectetur tellus, senectus dui. Blandit accumsan, nisl, non sed at. Et sit arcu suspendisse dictum sem. Sit faucibus volutpat et lobortis sit felis etiam. Suspendisse risus massa, id in mollis ornare porttitor. Cras libero dui eget arcu nunc venenatis vel. Nunc ut libero sit risus ultricies.Morbi diam ut eget purus massa. Libero auctor faucibus amet, in viverra semper. Viverra nunc ligula turpis egestas ipsum vel. Risus cras pretium ridiculus sit. Tempor risus nunc tempor, vulputate ornare bibendum. Gravida in maecenas varius nulla. In amet, at lacus faucibus sed eu. Et, tincidunt purus semper sem diam.',
                    ),
                    const RatingWidget(),
                    const WasteWidget(),
                    const CurrentEvents(),
                    const CurrentSortPoints(),
                    const ReportsWidget(),
                  ].withSpaceBetween(height: 12),
                ),
              ),
            ],
          ),
        ));
  }
}

class WasteWidget extends StatelessWidget {
  const WasteWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Собранные отходы',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(
                  spacing: 8,
                  children: [
                    SvgPicture.asset(
                      ImgsControllerService.plasticRating.url(),
                      fit: BoxFit.cover,
                    ),
                    const Text(
                      'Пластик',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    )
                  ],
                ),
                const Text(
                  '0,0 кг',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(
                  spacing: 8,
                  alignment: WrapAlignment.center,
                  children: [
                    SvgPicture.asset(
                      ImgsControllerService.butteryRating.url(),
                      fit: BoxFit.cover,
                    ),
                    const Text(
                      'Батарейки',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    )
                  ],
                ),
                const Text(
                  '0,0 кг',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(
                  spacing: 8,
                  alignment: WrapAlignment.center,
                  children: [
                    SvgPicture.asset(
                      ImgsControllerService.lampRating.url(),
                      fit: BoxFit.cover,
                    ),
                    const Text(
                      'Лампочки',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    )
                  ],
                ),
                const Text(
                  '0,0 кг',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(
                  spacing: 8,
                  alignment: WrapAlignment.center,
                  children: [
                    SvgPicture.asset(
                      ImgsControllerService.paperRating.url(),
                      fit: BoxFit.cover,
                    ),
                    const Text(
                      'Макулатура',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    )
                  ],
                ),
                const Text(
                  '0,0 кг',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(
                  spacing: 8,
                  alignment: WrapAlignment.center,
                  children: [
                    SvgPicture.asset(
                      ImgsControllerService.metalRating.url(),
                      fit: BoxFit.cover,
                    ),
                    const Text(
                      'Металл',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    )
                  ],
                ),
                const Text(
                  '0,0 кг',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(
                  spacing: 8,
                  alignment: WrapAlignment.center,
                  children: [
                    SvgPicture.asset(
                      ImgsControllerService.glassRating.url(),
                      fit: BoxFit.cover,
                    ),
                    const Text(
                      'Стекло',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    )
                  ],
                ),
                const Text(
                  '0,0 кг',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                )
              ],
            ),
          ].withSpaceBetween(height: 12),
        ),
      ),
    );
  }
}

class RatingWidget extends StatelessWidget {
  const RatingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Рейтинг',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(
                  spacing: 8,
                  alignment: WrapAlignment.center,
                  children: [
                    SvgPicture.asset(
                      ImgsControllerService.routeRating.url(),
                      fit: BoxFit.cover,
                    ),
                    const Text(
                      'Доступность',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    )
                  ],
                ),
                const Text(
                  '0',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(
                  spacing: 8,
                  alignment: WrapAlignment.center,
                  children: [
                    SvgPicture.asset(
                      ImgsControllerService.natureRating.url(),
                      fit: BoxFit.cover,
                    ),
                    const Text(
                      'Красота',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    )
                  ],
                ),
                const Text(
                  '0',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(
                  spacing: 8,
                  alignment: WrapAlignment.center,
                  children: [
                    SvgPicture.asset(
                      ImgsControllerService.sortRating.url(),
                      fit: BoxFit.cover,
                    ),
                    const Text(
                      'Чистота',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    )
                  ],
                ),
                const Text(
                  '0',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ],
            ),
          ].withSpaceBetween(height: 12),
        ),
      ),
    );
  }
}

class CurrentEvents extends StatelessWidget {
  const CurrentEvents({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Мероприятия',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        Wrap(
          spacing: 18,
          children: [
            Wrap(
              direction: Axis.vertical,
              spacing: 10,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    height: 171,
                    width: 171,
                    ImgsControllerService.defaultImg.url('png'),
                    fit: BoxFit.cover,
                  ),
                ),
                const Text('Name')
              ],
            ),
            Wrap(
              direction: Axis.vertical,
              spacing: 10,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    height: 171,
                    width: 171,
                    ImgsControllerService.defaultImg.url('png'),
                    fit: BoxFit.cover,
                  ),
                ),
                const Text('Name')
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class CurrentSortPoints extends StatelessWidget {
  const CurrentSortPoints({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Точки сортировки',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        Wrap(
          spacing: 18,
          children: [
            Wrap(
              direction: Axis.vertical,
              spacing: 10,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    height: 171,
                    width: 171,
                    ImgsControllerService.defaultImg.url('png'),
                    fit: BoxFit.cover,
                  ),
                ),
                const Text('Name')
              ],
            ),
            Wrap(
              direction: Axis.vertical,
              spacing: 10,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    height: 171,
                    width: 171,
                    ImgsControllerService.defaultImg.url('png'),
                    fit: BoxFit.cover,
                  ),
                ),
                const Text('Name')
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class ReportsWidget extends StatefulWidget {
  const ReportsWidget({super.key});

  @override
  State<ReportsWidget> createState() => _ReportsWidgetState();
}

class _ReportsWidgetState extends State<ReportsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Отчеты',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 500,
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.asset(ImgsControllerService.defaultImg.url('png')),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(25)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              spacing: 6,
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: Image.asset(ImgsControllerService.defaultImg.url('png'),
                                        width: 24, height: 24)),
                                const Text('Username'),
                              ],
                            ),
                          ),
                          const Padding(padding: EdgeInsets.all(4.0), child: Text('01.01.2000 в 00:00')),
                          const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Text(
                              'Lorem ipsum dolor sit amet consectetur. Dignissim sed et duis fermentum id. At volutpat nulla quis eget. Morbi turpis pulvinar in auctor in turpis. Erat facilisis quam tempus varius venenatis volutpat urna massa. Feugiat egestas nibh tellus lectus. Non nam nibh vitae et et. Ac amet lacus ullamcorper in volutpat. In habitant sit mauris ullamcorper neque dui. Non leo pellentesque ultricies donec. Erat in faucibus aliquam pellentesque molestie semper sit enim.',
                              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Wrap(
                              spacing: 10,
                              children: [
                                Wrap(
                                  spacing: 5,
                                  alignment: WrapAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      ImgsControllerService.natureRating.url(),
                                      fit: BoxFit.cover,
                                    ),
                                    const Text(
                                      '0,0',
                                      style: TextStyle(
                                        fontSize: 17,
                                      ),
                                    )
                                  ],
                                ),
                                Wrap(
                                  spacing: 5,
                                  alignment: WrapAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      ImgsControllerService.routeRating.url(),
                                      fit: BoxFit.cover,
                                    ),
                                    const Text(
                                      '0,0',
                                      style: TextStyle(
                                        fontSize: 17,
                                      ),
                                    )
                                  ],
                                ),
                                Wrap(
                                  spacing: 5,
                                  children: [
                                    SvgPicture.asset(
                                      ImgsControllerService.sortRating.url(),
                                      fit: BoxFit.cover,
                                    ),
                                    const Text(
                                      '0,0',
                                      style: TextStyle(
                                        fontSize: 17,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 15),
        )
      ],
    );
  }
}
