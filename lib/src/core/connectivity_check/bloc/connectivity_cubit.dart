import 'package:bloc/bloc.dart';
import 'package:rechef_app/src/core/connectivity_check/repository/connectivity_repository.dart';

class ConnectivityCubit extends Cubit<bool> {
  final ConnectivityRepository connectRepo;
  ConnectivityCubit({required this.connectRepo}) : super(false);

  void checkConnectivity() async {
    final connectionStatus = await connectRepo.checkConnection();
    emit(connectionStatus);
  }
}
