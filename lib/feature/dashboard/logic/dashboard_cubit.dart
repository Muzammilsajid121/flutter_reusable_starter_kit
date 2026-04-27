import 'package:flutter_starter_kit/feature/dashboard/data/dashboard_repository.dart';
import 'package:flutter_starter_kit/feature/dashboard/data/dashboard_state.dart';
import 'package:flutter_starter_kit/utils/exceptions/exceptions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardCubit extends Cubit<DashboardState> {
  final DashboardRepository _dashboardRepository = DashboardRepository();

  DashboardCubit() : super(DashboardInitial());

  Future<void> fetchDashboardAnalytics() async {
    if (state is DashboardLoaded) return; // Agar api already loaded h to daboar nhi load karo
    emit(DashboardLoading());
    try {
      // Repository se model mangwaya
      final data = await _dashboardRepository.getDashboardAnalyticsRecords();
      
      // State mein data bhej diya
      emit(DashboardLoaded(data)); 
    } catch (e) {
      final customException = TExceptions.fromDioError(e);
      emit(DashboardError(customException.message));
    }
  }


}
