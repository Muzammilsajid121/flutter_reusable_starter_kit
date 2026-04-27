import 'dart:async';
import 'package:flutter/material.dart';

class ReusableCountdownTimer extends StatefulWidget {
  final int minutes;
  final VoidCallback? onTimerFinished;

  const ReusableCountdownTimer({
    super.key,
    required this.minutes,
    this.onTimerFinished,
  });

  @override
  State<ReusableCountdownTimer> createState() => _ReusableCountdownTimerState();
}

class _ReusableCountdownTimerState extends State<ReusableCountdownTimer> {
  late Timer _timer;
  late int _remainingSeconds;

  @override
  void initState() {
    super.initState();
    // Minutes ko seconds mein convert kar rahe hain
    _remainingSeconds = widget.minutes * 60;
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() {
          _remainingSeconds--;
        });
      } else {
        _timer.cancel();
        if (widget.onTimerFinished != null) {
          widget.onTimerFinished!();
        }
      }
    });
  }

  // Seconds ko HH:MM:SS format mein convert karne ke liye helper
  String _formatTime(int totalSeconds) {
    int duration = totalSeconds;
    int hours = duration ~/ 3600;
    int minutes = (duration % 3600) ~/ 60;
    int seconds = duration % 60;

    String h = hours.toString().padLeft(2, '0');
    String m = minutes.toString().padLeft(2, '0');
    String s = seconds.toString().padLeft(2, '0');

    return "$m : $s"; // Agar ghante chahiye toh "$h : $m : $s" kar dein
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        color: const Color(0xFFFFDAD6),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.timer_outlined, color: Color(0xff93000A), size: 16),
          const SizedBox(width: 5),
          Text(
            _formatTime(_remainingSeconds),
            style: const TextStyle(
              color: Color(0xff93000A), // text color
              fontSize: 14,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(width: 8),
          const Text(
            'rem',
            style: TextStyle(color: Color(0xff93000A),fontSize: 12),
          ),
        ],
      ),
    );
  }
}

//usage:
// ReusableCountdownTimer(
//   minutes: 60, 
//   onTimerFinished: () {
//     print("Timer khatam ho gaya!");
//     any logical work
//   },
// )