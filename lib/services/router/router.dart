import 'package:auto_route/auto_route.dart';
import 'package:eco/view/screen/activity_screen/activity.dart';
import 'package:eco/view/screen/activity_screen/sections/report_activity.dart';
import 'package:eco/view/screen/activity_screen/sections/top_activity.dart';
import 'package:eco/view/screen/main_screen/main.dart';
import 'package:eco/view/screen/marks_screen/marks.dart';
import 'package:eco/view/screen/new_report_screen/new_report.dart';
import 'package:eco/view/screen/profile_screen/profile.dart';
import 'package:eco/view/screen/review_screen/review.dart';
import 'package:eco/view/screen/review_screen/sections/events_review.dart';
import 'package:eco/view/screen/review_screen/sections/places_review.dart';
import 'package:eco/view/screen/review_screen/sections/routes_review.dart';
import 'package:eco/view/screen/review_screen/sections/sort_points_review.dart';
part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: MainRoute.page,
          path: '/',
          children: [
            AutoRoute(
              page: ReviewRoute.page,
              path: 'review',
              children: [
                AutoRoute(page: PlacesReviewRoute.page, path: 'places_review'),
                AutoRoute(page: RoutesReviewRoute.page, path: 'routes_review'),
                AutoRoute(page: EventsReviewRoute.page, path: 'events_review'),
                AutoRoute(page: SortPointsReviewRoute.page, path: 'sort_points_review'),
              ],
            ),
            AutoRoute(
              page: ActivityRoute.page,
              path: 'activity',
              children: [
                AutoRoute(page: ReportActivityRoute.page, path: 'report_activity'),
                AutoRoute(page: TopActivityRoute.page, path: 'top_activity'),
              ],
            ),
            AutoRoute(page: MarksRoute.page, path: 'marks'),
            AutoRoute(page: ProfileRoute.page, path: 'profile'),
            AutoRoute(page: NewReportRoute.page, path: 'new_report'),
          ],
        ),
      ];
}
