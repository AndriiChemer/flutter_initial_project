import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iteo_libraries_example/presentation/navigation/app_router.dart';
import 'package:iteo_libraries_example/presentation/widget/export.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF2A2D3E),
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset('assets/images/logo.png'),
          ),
          DrawerListTile(
            title: 'Dashboard',
            svgSrc: 'assets/icons/menu_dashboard.svg',
            press: () {},
          ),
          DrawerListTile(
            title: 'Transaction',
            svgSrc: 'assets/icons/menu_tran.svg',
            press: () {},
          ),
          DrawerListTile(
            title: 'Task',
            svgSrc: 'assets/icons/menu_task.svg',
            press: () {},
          ),
          DrawerListTile(
            title: 'Documents',
            svgSrc: 'assets/icons/menu_doc.svg',
            press: () {},
          ),
          DrawerListTile(
            title: 'Store',
            svgSrc: 'assets/icons/menu_store.svg',
            press: () {},
          ),
          DrawerListTile(
            title: 'Notification',
            svgSrc: 'assets/icons/menu_notification.svg',
            press: () {},
          ),
          DrawerListTile(
            title: 'Profile',
            svgSrc: 'assets/icons/menu_profile.svg',
            press: () {},
          ),
          DrawerListTile(
            title: 'Settings',
            svgSrc: 'assets/icons/menu_setting.svg',
            press: () => context.router.push(const SettingsRoute()),
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    required this.title,
    required this.svgSrc,
    required this.press,
    super.key,
  });

  final String title;
  final String svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: Spacings.zero,
      leading: SvgPicture.asset(
        svgSrc,
        colorFilter: const ColorFilter.mode(Colors.white54, BlendMode.srcIn),
        height: Dimens.iconSize,
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white54),
      ),
    );
  }
}