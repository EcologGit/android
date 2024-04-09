import 'package:auto_route/auto_route.dart';
import 'package:eco/bloc/reports/reports.dart';
import 'package:eco/data/models/reports.dart';
import 'package:eco/services/api/api_service.dart';
import 'package:eco/services/authorization/service/local_authentication_service.dart';
import 'package:eco/services/imgs/imgs_controller_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

@RoutePage()
class ReportsActivityPage extends StatefulWidget {
  const ReportsActivityPage({super.key});

  @override
  State<ReportsActivityPage> createState() => _ReportsActivityPageState();
}

class _ReportsActivityPageState extends State<ReportsActivityPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReportsBloc()..add(LoadReports()),
      child: BlocBuilder<ReportsBloc, ReportsState>(
        builder: (context, state) {
          if (state is ReportsLoading) {
            return Scaffold(body: Center(child: CircularProgressIndicator.adaptive()));
          } else if (state is ReportsSuccess) {
            final List<Report> reports = state.reports.results;
            return ListView.separated(
              itemCount: reports.length,
              itemBuilder: (BuildContext context, int index) {
                final Report report = reports[index];
                final String srcNetworkImage =
                    '${ApiService(LocalAuthenticationService()).loadImage()}${report.photo}';
                final String srcNetworkPhotoUser = '';

                final String dateOfReport = DateFormat('dd.MM.yyyy').format(report.createdAt);
                final String timeOfReport = DateFormat('hh:mm').format(report.createdAt);
                return SizedBox(
                  height: 400,
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
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  spacing: 6,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: Image.network(
                                        srcNetworkPhotoUser,
                                        fit: BoxFit.cover,
                                        loadingBuilder: (context, child, loadingProgress) {
                                          if (loadingProgress == null) return child;
                                          return Image.asset(
                                            ImgsControllerService.defaultImg.url('png'),
                                            width: 24,
                                            height: 24,
                                            fit: BoxFit.cover,
                                          );
                                        },
                                        errorBuilder: (context, error, stackTrace) {
                                          return Image.asset(
                                            ImgsControllerService.defaultImg.url('png'),
                                            width: 24,
                                            height: 24,
                                            fit: BoxFit.cover,
                                          );
                                        },
                                      ),
                                    ),
                                    Text(report.userId.username),
                                  ],
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.all(4.0), child: Text('$dateOfReport в $timeOfReport')),
                              Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Text(
                                  report.description,
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
                                        Text(
                                          report.rates.availability.toString(),
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
                                        Text(
                                          report.rates.beauty.toString(),
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
                                        Text(
                                          report.rates.purity.toString(),
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
          } else {
            return Scaffold(
              body: Center(
                child: Text('Error'),
              ),
            );
          }
        },
      ),
    );
  }
}
