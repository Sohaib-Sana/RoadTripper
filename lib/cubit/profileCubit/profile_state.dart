part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {
  final int index;
  const ProfileState({this.index = 0});
}

final class ProfileInitial extends ProfileState {}

final class ProfilePageChanged extends ProfileState {
  const ProfilePageChanged({super.index});
}
