import 'package:auto_route/auto_route.dart';
import 'package:eco/bloc/routes/routes.dart';
import 'package:eco/main.dart';
import 'package:eco/services/api/api_service.dart';
import 'package:eco/services/authorization/service/local_authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:eco/services/imgs/imgs_controller_service.dart';
import 'package:eco/services/router/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:eco/data/models/routes.dart' as routeModel;

@RoutePage()
class RoutesReviewPage extends StatelessWidget {
  const RoutesReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final myRoute = AutoRouter.of(context);

    return BlocProvider(
      create: (context) => RoutesBloc()..add(LoadRoutes()),
      child: BlocBuilder<RoutesBloc, RoutesState>(
        builder: (context, state) {
          if (state is RoutesLoading)
            return Scaffold(body: Center(child: CircularProgressIndicator.adaptive()));
          if (state is RoutesSuccess) {
            final List<routeModel.Route> routes = state.data.routes;
            return ListView.separated(
              itemCount: routes.length,
              itemBuilder: (BuildContext context, int index) {
                final routeModel.Route route = routes[index];

                final String srcNetworkImage =
                    '${ApiService(LocalAuthenticationService()).loadImage()}${route.photo}';
                return Stack(alignment: Alignment.topRight, children: [
                  GestureDetector(
                    onTap: () {
                      myRoute.push(RouteDetailReviewRoute(routeId: route.routeId.toString()));
                    },
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Container(
                            color: Colors.black12,
                            height: 300,
                            width: double.infinity,
                            child: Image.network(
                              srcNetworkImage,
                              fit: BoxFit.cover,
                              loadingBuilder: (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Image.asset(
                                  ImgsControllerService.defaultImg.url('png'),
                                  fit: BoxFit.cover,
                                );
                              },
                              errorBuilder: (context, error, stackTrace) {
                                return Image.asset(
                                  ImgsControllerService.defaultImg.url('png'),
                                  fit: BoxFit.cover,
                                );
                              },
                            ),
                          ),
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
                                  ImgsControllerService.favoriteButton.url(),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              IconButton(
                                iconSize: 50,
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                  ImgsControllerService.shareButton.url(),
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
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  route.name,
                                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                                ),
                                Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.route,
                                      size: 12,
                                      color: Colors.black,
                                    ),
                                    Text(
                                      route.locality,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                ),
                                Wrap(
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
                                          '${route.length} км',
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
                                          route.duration,
                                          style: TextStyle(
                                            fontSize: 14,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Wrap(
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
                                        SizedBox(
                                          width: 39,
                                          child: Text(
                                            route.avgBeauty == null ? '0.0' : route.avgBeauty.toString(),
                                            style: TextStyle(fontSize: 17, overflow: TextOverflow.ellipsis),
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
                                        SizedBox(
                                          width: 39,
                                          child: Text(
                                            route.avgAvailability == null
                                                ? '0.0'
                                                : route.avgAvailability.toString(),
                                            style: TextStyle(fontSize: 17, overflow: TextOverflow.ellipsis),
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
                                        SizedBox(
                                          width: 39,
                                          child: Text(
                                            route.avgPurity == null ? '0.0' : route.avgPurity.toString(),
                                            style: TextStyle(fontSize: 17, overflow: TextOverflow.ellipsis),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ].withSpaceBetween(height: 8),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ]);
              },
              separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 15),
            );
          }
          return Center(
            child: Text('Ошибка'),
          );
        },
      ),
    );
  }
}
