import 'package:flutter/material.dart';
import 'package:sliding_puzzle/timer/timer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class TimerWidget extends StatelessWidget {
  const TimerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TimerCubit, TimerState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = TimerCubit.get(context);
        return Center(
          child: StreamBuilder<int>(
            stream: cubit.timer.rawTime,
            initialData: cubit.timer.rawTime.value,
            builder: (context, snap) {
              final value = snap.data!;
              final displayTime =
              StopWatchTimer.getDisplayTime(value, hours: true);
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      displayTime,
                      style: const TextStyle(
                          fontSize: 40,
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
