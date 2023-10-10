import 'package:auto_route/auto_route.dart';
import 'package:eco/view/screen/activity_screen/activity.dart';
import 'package:eco/view/screen/main_screen/main.dart';
import 'package:eco/view/screen/marks_screen/marks.dart';
import 'package:eco/view/screen/new_report_screen/new_report.dart';
import 'package:eco/view/screen/profile_screen/profile.dart';
import 'package:eco/view/screen/review_screen/review.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: MainRoute.page,
          path: '/',
          children: [
            AutoRoute(page: ReviewRoute.page, path: 'activity'),
            AutoRoute(page: ActivityRoute.page, path: 'activity'),
            AutoRoute(page: MarksRoute.page, path: 'marks'),
            AutoRoute(page: ProfileRoute.page, path: 'profile'),
            AutoRoute(page: NewReportRoute.page, path: 'new_report'),
          ],
        ),
      ];
}
