import 'package:auto_route/auto_route.dart';
import 'package:eco/view/screen/activity_screen/activity.dart';
import 'package:eco/view/screen/activity_screen/sections/reports_activity.dart';
import 'package:eco/view/screen/activity_screen/sections/top_activity.dart';
import 'package:eco/view/screen/main_screen/main_screen.dart';
import 'package:eco/view/screen/mark_screen/marks.dart';
import 'package:eco/view/screen/mark_screen/sections/events_marks.dart';
import 'package:eco/view/screen/mark_screen/sections/places_marks.dart';
import 'package:eco/view/screen/mark_screen/sections/routes_marks.dart';
import 'package:eco/view/screen/mark_screen/sections/sort_points_marks.dart';
import 'package:eco/view/screen/new_report_screen/new_report.dart';
import 'package:eco/view/screen/new_report_screen/selection_sort_points.dart';
import 'package:eco/view/screen/new_report_screen/type_and_name_object.dart';
import 'package:eco/view/screen/profile_screen/profile.dart';
import 'package:eco/view/screen/profile_screen/section/log_in.dart';
import 'package:eco/view/screen/profile_screen/section/sign_in.dart';
import 'package:eco/view/screen/profile_screen/section/user/sections/reports_user.dart';
import 'package:eco/view/screen/profile_screen/section/user/sections/settings_user.dart';
import 'package:eco/view/screen/profile_screen/section/user/sections/statistics_user.dart';
import 'package:eco/view/screen/profile_screen/section/user/user_profile.dart';
import 'package:eco/view/screen/review_screen/details/event_detail_review.dart';
import 'package:eco/view/screen/review_screen/details/place_detail_review.dart';
import 'package:eco/view/screen/review_screen/details/route_detail_review.dart';
import 'package:eco/view/screen/review_screen/details/sort_point_detail_review.dart';
import 'package:eco/view/screen/review_screen/review.dart';
import 'package:eco/view/screen/review_screen/sections/events_review.dart';
import 'package:eco/view/screen/review_screen/sections/places_review.dart';
import 'package:eco/view/screen/review_screen/sections/routes_review.dart';
import 'package:eco/view/screen/review_screen/sections/sort_points_review.dart';
import 'package:flutter/material.dart';
part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: MainRoute.page,
          path: '/main',
          initial: true,
          children: [
            AutoRoute(
              page: ReviewRoute.page,
              path: 'review',
              initial: true,
              children: [
                AutoRoute(
                  page: PlacesReviewRoute.page,
                  path: 'places_review',
                  initial: true,
                ),
                AutoRoute(page: RoutesReviewRoute.page, path: 'routes_review'),
                AutoRoute(page: EventsReviewRoute.page, path: 'events_review'),
                AutoRoute(page: SortPointsReviewRoute.page, path: 'sort_points_review'),
              ],
            ),
            AutoRoute(
              page: ActivityRoute.page,
              path: 'activity',
              children: [
                AutoRoute(
                  page: ReportsActivityRoute.page,
                  path: 'report_activity',
                  initial: true,
                ),
                AutoRoute(page: TopActivityRoute.page, path: 'top_activity'),
              ],
            ),
            AutoRoute(
              page: MarksRoute.page,
              path: 'marks',
              children: [
                AutoRoute(
                  page: PlacesMarksRoute.page,
                  path: 'places_marks',
                  initial: true,
                ),
                AutoRoute(page: RoutesMarksRoute.page, path: 'routes_marks'),
                AutoRoute(page: EventsMarksRoute.page, path: 'events_marks'),
                AutoRoute(page: SortPointsMarksRoute.page, path: 'sort_points_marks'),
              ],
            ),
            AutoRoute(
              page: ProfileRoute.page,
              path: 'profile',
              children: [
                AutoRoute(page: LogInProfileRoute.page, initial: true, path: 'log_in'),
                AutoRoute(page: SignInProfileRoute.page, path: 'sign_in'),
                AutoRoute(
                  page: UserProfileRoute.page,
                  path: 'user_profile',
                  children: [
                    AutoRoute(
                      page: ReportsUserRoute.page,
                      path: 'reports_user',
                      initial: true,
                    ),
                    AutoRoute(page: SettingsUserRoute.page, path: 'settings_user'),
                    AutoRoute(page: StatisticsUserRoute.page, path: 'statistics_user'),
                  ],
                ),
              ],
            ),
            AutoRoute(
              page: NewReportRoute.page,
              path: 'new_report',
            ),
          ],
        ),
        AutoRoute(page: PlaceDetailReviewRoute.page, path: '/place/:id'),
        AutoRoute(page: RouteDetailReviewRoute.page, path: '/route/:id'),
        AutoRoute(page: EventDetailReviewRoute.page, path: '/event/:id'),
        AutoRoute(page: SortPointDetailReviewRoute.page, path: '/sortPoint/:id'),
        AutoRoute(
          page: TypeAndNameObjectRoute.page,
          path: '/type_and_name_object',
        ),
        AutoRoute(
          page: SelectionSortPointsRoute.page,
          path: '/selection_sort_points',
        ),
      ];
}
