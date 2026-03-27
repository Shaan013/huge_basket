import 'package:flutter/material.dart';
import 'package:huge_basket/core/routes/app_route.dart';

import '../../feature/home_screen/view_model/profile_item_model.dart';

List<ProfileCard> profileItemList = [
  ProfileCard(
    icon: Icons.location_pin,
    name: "Manage Address",
    route:AppRoute.manageAddress,
  ),
  ProfileCard(icon: Icons.chat_bubble_outline, name: "Recent Chat"),
  ProfileCard(icon: Icons.notifications_outlined, name: "Notification"),
  ProfileCard(icon: Icons.star_border_outlined, name: "Rate the App"),
  ProfileCard(icon: Icons.share, name: "Share App"),

  ProfileCard(icon: Icons.help_outline, name: "Help & FAQ"),
  ProfileCard(icon: Icons.person_outline_sharp, name: "About Us"),
  ProfileCard(icon: Icons.file_copy_outlined, name: "Terms and conditions"),
  ProfileCard(icon: Icons.privacy_tip_outlined, name: "Privacy Policy"),
  ProfileCard(icon: Icons.contact_page_outlined, name: "Contact Us"),
  ProfileCard(icon: Icons.logout, name: "Logout",route: AppRoute.logOut),
];
