import 'package:bloc/bloc.dart';

enum SelectedTab { home, cart, sale, favorite, user }

class BottomNavigationCubit extends Cubit<SelectedTab> {
  BottomNavigationCubit() : super(SelectedTab.home);

  void setTab(int index) {
    emit(SelectedTab.values[index]);
  }

  void resetToHome() {
    emit(SelectedTab.home);
  }
}
