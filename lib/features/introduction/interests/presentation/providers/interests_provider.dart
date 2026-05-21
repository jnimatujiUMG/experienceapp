import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/interest_entity.dart';

final interestsProvider =
    StateNotifierProvider<InterestsNotifier,
        List<InterestEntity>>((ref) {
  return InterestsNotifier();
});

class InterestsNotifier
    extends StateNotifier<List<InterestEntity>> {

  InterestsNotifier()
      : super([
          InterestEntity(title: 'User Interface', selected: true),
          InterestEntity(title: 'User Experience'),
          InterestEntity(title: 'User Research', selected: true),
          InterestEntity(title: 'UX Writing'),
          InterestEntity(title: 'User Testing'),
          InterestEntity(title: 'Service Design'),
          InterestEntity(title: 'Strategy', selected: true),
          InterestEntity(title: 'Design Systems', selected: true),
        ]);

  void toggleSelection(int index) {
    state[index].selected = !state[index].selected;

    state = [...state];
  }
}