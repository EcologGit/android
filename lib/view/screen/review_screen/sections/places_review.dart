import 'package:auto_route/auto_route.dart';
import 'package:eco/bloc/places/places.dart';
import 'package:eco/data/models/places.dart';
import 'package:eco/main.dart';
import 'package:eco/services/api/api_service.dart';
import 'package:eco/services/authorization/service/local_authentication_service.dart';
import 'package:eco/services/imgs/imgs_controller_service.dart';
import 'package:eco/services/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class PlacesReviewPage extends StatefulWidget {
  const PlacesReviewPage({super.key});

  @override
  State<PlacesReviewPage> createState() => _PlacesReviewPageState();
}

class _PlacesReviewPageState extends State<PlacesReviewPage> {
  @override
  Widget build(BuildContext context) {
    final myRoute = AutoRouter.of(context);
    return BlocProvider(
      create: (context) => PlacesBloc()..add(LoadPlaces()),
      child: BlocBuilder<PlacesBloc, PlacesState>(
        builder: (context, state) {
          if (state is PlacesLoading)
            return Scaffold(body: Center(child: CircularProgressIndicator.adaptive()));
          else if (state is PlacesSuccess) {
            final List<Place> places = state.data.places;

            return ListView.separated(
              itemCount: places.length,
              itemBuilder: (BuildContext context, int index) {
                final Place place = places[index];
                final String srcNetworkImage =
                    '${ApiService(LocalAuthenticationService()).loadImage()}${place.photo}';

                return Stack(
                  alignment: Alignment.topRight,
                  children: [
                    GestureDetector(
                      onTap: () {
                        myRoute.push(PlaceDetailReviewRoute(placeId: place.objectId.toString()));
                      },
                      child: Stack(
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
                                    place.name,
                                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                                  ),
                                  Wrap(
                                    crossAxisAlignment: WrapCrossAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.place,
                                        size: 12,
                                        color: Colors.black,
                                      ),
                                      Text(
                                        place.locality,
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
                                              place.avgBeauty == null ? '0.0' : place.avgBeauty.toString(),
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
                                              place.avgAvailability == null
                                                  ? '0.0'
                                                  : place.avgAvailability.toString(),
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
                                              place.avgPurity == null ? '0.0' : place.avgPurity.toString(),
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
                          ),
                        ],
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
                  ],
                );
              },
              separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 15),
            );
          } else {
            return Center(
              child: Text('Error'),
            );
          }
        },
      ),
    );
  }
}
