import 'package:flutter_starter_kit/feature/dashboard/data/dashboard_repository.dart';
import 'package:flutter_starter_kit/feature/dashboard/data/dashboard_state.dart';
import 'package:flutter_starter_kit/utils/exceptions/exceptions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardSyllabusSubjectCubit extends Cubit<DashboardState> {
  final DashboardRepository _dashboardRepository = DashboardRepository();

  DashboardSyllabusSubjectCubit() : super(DashboardInitial());

    Future<void> fetchDashboardSubjects() async {
    // if (state is DashboardSubjectsLoaded) return; // Agar api already loaded h to daboar nhi load karo
    emit(DashboardLoading());
    try {
      // Repository se model mangwaya
      final data = await _dashboardRepository.getDashboardSubjectsRecords();
      
      // State mein data bhej diya
      emit(DashboardSubjectsLoaded(data)); 
    } catch (e) {
      final customException = TExceptions.fromDioError(e);
      emit(DashboardError(customException.message));
    }
  }







}
