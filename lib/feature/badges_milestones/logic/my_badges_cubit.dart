import 'package:flutter_starter_kit/feature/badges_milestones/data/badges_repository.dart';
import 'package:flutter_starter_kit/feature/badges_milestones/data/badges_state.dart';
import 'package:flutter_starter_kit/utils/exceptions/exceptions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBadgesCubit extends Cubit<BadgesState> {
  final BadgesRepository _myBadgesRepository = BadgesRepository();

  MyBadgesCubit() : super(BadgesInitial());

  Future<void> fetchMyBadges() async {
    if (state is MyBadgesLoaded) return; // Agar api already loaded h to daboar nhi load karo
    emit(BadgesLoading());
    try {
      // Repository se model mangwaya
      final data = await _myBadgesRepository.getMyBadges();
      
      // State mein data bhej diya
      emit(MyBadgesLoaded(data)); 
    } catch (e) {
      final customException = TExceptions.fromDioError(e);
      emit(BadgesError(customException.message));
    }
  }


}
