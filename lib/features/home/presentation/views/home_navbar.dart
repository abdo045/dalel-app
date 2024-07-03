import 'package:dalel/core/utils/app_assets.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/features/home/presentation/views/home_view.dart';
import 'package:dalel/features/profile/presentation/views/profile_view.dart';
import 'package:dalel/features/search/presentaion/views/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../cart/presentation/views/bazar_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../logic/cubit/historical_cubit.dart';
import 'home_view.dart';

class HomeNavBarWidget extends StatefulWidget {
  const HomeNavBarWidget({super.key});

  @override
  State<HomeNavBarWidget> createState() => _HomeNavBarWidgetState();
}

class _HomeNavBarWidgetState extends State<HomeNavBarWidget> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    context.read<HistoricalCubit>().getHistoricalPeriods();
    context.read<HistoricalCubit>().getHistoricalCharacter();
    context.read<HistoricalCubit>().getHistoricalKings();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _buildScreens(),
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _navBarsItems(),
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}

List<Widget> _buildScreens() {
  return [
    const HomeView(),
    const BazarView(),
    const SearchView(),
    const ProfileView(),
  ];
}

List<BottomNavigationBarItem> _navBarsItems() {
  return [
    BottomNavigationBarItem(
      icon: SvgPicture.asset(Assets.imagesHomeIcon),
      activeIcon: SvgPicture.asset(Assets.imagesHomeIconActive),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(Assets.imagesShoppingCart),
      activeIcon: SvgPicture.asset(Assets.imagesShoppingCartActive),
      label: 'Bazar',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(Assets.imagesSearch),
      activeIcon: SvgPicture.asset(Assets.imagesSearchActive),
      label: 'Search',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(Assets.imagesPerson),
      activeIcon: SvgPicture.asset(Assets.imagesPersonActive),
      label: 'Profile',
    ),
  ];
}
