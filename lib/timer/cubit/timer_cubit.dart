
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {

  TimerCubit() : super(const TimerState());

  static TimerCubit get(context) => BlocProvider.of(context);

  StopWatchTimer timer = StopWatchTimer();

  void disposeTimer() async {
    await timer.dispose();
  }

  void startTimer() {
    timer.onExecute.add(StopWatchExecute.start);
    emit(state.copyWith(isRunning: true));
  }

  void stopTimer() {
    timer.onExecute.add(StopWatchExecute.stop);
  }

  void resetTimer() {
    timer.onExecute.add(StopWatchExecute.reset);
  }
}
