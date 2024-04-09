import 'package:auto_route/auto_route.dart';
import 'package:eco/services/imgs/imgs_controller_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class ReportsUserPage extends StatefulWidget {
  const ReportsUserPage({super.key});

  @override
  State<ReportsUserPage> createState() => _ReportsUserPageState();
}

class _ReportsUserPageState extends State<ReportsUserPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
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
                        ImgsControllerService.changeButton.url(),
                        fit: BoxFit.cover,
                      ),
                    ),
                    IconButton(
                      iconSize: 50,
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        ImgsControllerService.publicButton.url(),
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
                            const Text('Евгений Сливкин'),
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
    );
  }
}
