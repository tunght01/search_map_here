part of 'location_cubit.dart';

class LocationState extends Equatable {
  final Position? currentPosition;
  final String errorMessage;

  const LocationState({this.currentPosition, this.errorMessage = ''});

  @override
  List<Object?> get props => [currentPosition, errorMessage];
}
