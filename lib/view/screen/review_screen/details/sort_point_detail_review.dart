import 'package:auto_route/auto_route.dart';
import 'package:eco/main.dart';
import 'package:eco/services/imgs/imgs_controller_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class SortPointDetailReviewPage extends StatelessWidget {
  const SortPointDetailReviewPage({@PathParam('id') this.sortPointId, super.key});

  final String? sortPointId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Точка сортировки $sortPointId',
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
                          Icons.explore,
                          size: 12,
                        ),
                        Text('xx.xxxxxx'),
                        Text('yy.yyyyyy'),
                      ],
                    ),
                    const Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 3,
                      children: [
                        Icon(
                          Icons.watch_later,
                          size: 15,
                        ),
                        Text(
                          '00:00 - 00:00',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        )
                      ],
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
                    const WasteWidget(),
                    const CurrentObjects(),
                    const CurrentRoutes(),
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
              'Типы отходов',
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
              ],
            ),
          ].withSpaceBetween(height: 12),
        ),
      ),
    );
  }
}

class CurrentObjects extends StatelessWidget {
  const CurrentObjects({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Ближайшие объекты',
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

class CurrentRoutes extends StatelessWidget {
  const CurrentRoutes({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Ближайшие маршруты',
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
