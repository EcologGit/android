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
import 'package:eco/view/screen/profile_screen/profile.dart';
import 'package:eco/view/screen/profile_screen/section/log_in.dart';
import 'package:eco/view/screen/profile_screen/section/sign_in.dart';
import 'package:eco/view/screen/profile_screen/section/user/sections/reports_user.dart';
import 'package:eco/view/screen/profile_screen/section/user/sections/settings_user.dart';
import 'package:eco/view/screen/profile_screen/section/user/sections/statistics_user.dart';
import 'package:eco/view/screen/profile_screen/section/user/user_profile.dart';
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
            RedirectRoute(path: '', redirectTo: 'places_review'),
            AutoRoute(
              page: ReviewRoute.page,
              path: 'review',
              children: [
                RedirectRoute(path: '', redirectTo: 'places_review'),
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
                RedirectRoute(path: '', redirectTo: 'report_activity'),
                AutoRoute(page: ReportsActivityRoute.page, path: 'report_activity'),
                AutoRoute(page: TopActivityRoute.page, path: 'top_activity'),
              ],
            ),
            AutoRoute(
              page: MarksRoute.page,
              path: 'marks',
              children: [
                RedirectRoute(path: '', redirectTo: 'places_marks'),
                AutoRoute(page: PlacesMarksRoute.page, path: 'places_marks'),
                AutoRoute(page: RoutesMarksRoute.page, path: 'routes_marks'),
                AutoRoute(page: EventsMarksRoute.page, path: 'events_marks'),
                AutoRoute(page: SortPointsMarksRoute.page, path: 'sort_points_marks'),
              ],
            ),
            AutoRoute(
              page: ProfileRoute.page,
              path: 'profile',
              children: [
                RedirectRoute(path: '', redirectTo: 'user_profile'),
                AutoRoute(page: UserProfileRoute.page, path: 'user_profile', children: [
                  AutoRoute(page: ReportsUserRoute.page, path: 'reports_user'),
                  AutoRoute(page: SettingsUserRoute.page, path: 'settings_user'),
                  AutoRoute(page: StatisticsUserRoute.page, path: 'statistics_user'),
                ]),
                AutoRoute(page: LogInProfileRoute.page, path: 'log_in'),
                AutoRoute(page: SignInProfileRoute.page, path: 'sign_in'),
              ],
            ),
            AutoRoute(page: NewReportRoute.page, path: 'new_report'),
          ],
        ),
      ];
}
