import 'package:admin_dashboard/router/admin_handlers.dart';
import 'package:admin_dashboard/router/dashboard_handlers.dart';
import 'package:admin_dashboard/router/no_page_found_handlers.dart';
import 'package:fluro/fluro.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();
  // Init page
  static String rootRoute = '/';

  // Auth Router
  static String loginRoute = '/auth/login';
  static String registerRoute = '/auth/register';

  // Dashboard
  static String dashboardRoute = '/dashboard';
  static String iconsRoute = '/dashboard/icons';
  static String blankRoute = '/dashboard/blank';
  static String categoriesRoute = '/dashboard/categories';
  static String usersRoute = '/admin/users';
  static String userRoute = '/admin/users/:uid';

  static void configureRoutes() {
    // Auth Routes
    router.define(rootRoute,
        handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(loginRoute,
        handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(registerRoute,
        handler: AdminHandlers.register, transitionType: TransitionType.fadeIn);

    // Dashboard Routes
    router.define(blankRoute,
        handler: DashboardHandlers.blank,
        transitionType: TransitionType.fadeIn);
    router.define(categoriesRoute,
        handler: DashboardHandlers.categories,
        transitionType: TransitionType.fadeIn);
    router.define(dashboardRoute,
        handler: DashboardHandlers.dashboard,
        transitionType: TransitionType.none);
    router.define(iconsRoute,
        handler: DashboardHandlers.icons,
        transitionType: TransitionType.fadeIn);

    // Users Routes
    router.define(usersRoute,
        handler: DashboardHandlers.users,
        transitionType: TransitionType.fadeIn);
    router.define(userRoute,
        handler: DashboardHandlers.user, transitionType: TransitionType.fadeIn);

    //  404 Route
    router.notFoundHandler = NoPageFoundHandlers.noPageFound;
  }
}
