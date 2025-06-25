part of 'nav_bar_cubit.dart';

sealed class NavBarState {}

final class NavBarInitial extends NavBarState {}

final class NavBarIndexChanged extends NavBarState {}
