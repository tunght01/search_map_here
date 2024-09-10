import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

part 'location_state.dart';

@injectable
class LocationCubit extends Cubit<LocationState> {
  Position? _position;
  LocationCubit() : super(const LocationState());

  Future<void> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    try {
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        emit(const LocationState(errorMessage: 'Dịch vụ định vị bị vô hiệu hóa.'));
        return;
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          emit(const LocationState(errorMessage: 'Quyền truy cập vị trí bị từ chối'));
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        emit(const LocationState(
            errorMessage: 'Quyền truy cập vị trí bị từ chối, chúng tôi không thể yêu cầu quyền.'));
        return;
      }

      Position position = await Geolocator.getCurrentPosition();
      _position = position;
      emit(LocationState(currentPosition: position));
    } catch (e) {
      emit(LocationState(errorMessage: e.toString()));
    }
  }
}
