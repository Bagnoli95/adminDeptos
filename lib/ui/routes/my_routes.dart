// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// import '../pages/loginpage/login_wall_page.dart';
// import '../pages/control_responsive_layout.dart';

// import '../pages/clientes/clientes_desktop.dart';
// import '../pages/clientes/clientes_mobile.dart';
// import '../pages/clientes/clientes_tablet.dart';
// import '../pages/home/home_desktop.dart';
// import '../pages/home/home_mobile.dart';
// import '../pages/home/home_tablet.dart';

// final my_routes = GoRouter(
//   initialLocation: '/',
//   routes: [
//     GoRoute(
//       path: '/',
//       builder: (context, state) => LoginPageWallPaper(),
//     ),
//     GoRoute(
//       path: '/home',
//       builder: (context, state) => const ControlResponsive(
//         mobileScaffold: HomeMobile(),
//         tabletScaffold: HomeTablet(),
//         desktopScaffold: HomeDesktop(),
//       ),
//     ),
//     GoRoute(
//       path: '/clientes',
//       builder: (context, state) => const ControlResponsive(
//         mobileScaffold: ClientesMobile(),
//         tabletScaffold: ClientesTablet(),
//         desktopScaffold: ClientesDesktop(),
//       ),
//     ),
//   ],
// );
