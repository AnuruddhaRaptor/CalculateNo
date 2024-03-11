import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculateNo extends StatefulWidget {
  const CalculateNo({Key? key}) : super(key: key);

  @override
  State<CalculateNo> createState() => _CalculateNoState();
}

class _CalculateNoState extends State<CalculateNo> {
  int? _palindromeCount = 0;
  int? _armstrongCount = 0;
  int? _strongCount = 0;

  final List<int> numList1 = [121, 370, 371, 132, 678, 799];
  final List<int> numList2 = [153, 1634, 370, 371, 456, 800];
  final List<int> numList3 = [1, 2, 145, 371, 132, 67];

  void palindromeno() {
    setState(() {
      if (_palindromeCount! > 0) _palindromeCount = 0;

      for (int num in numList1) {
        int rev = 0;
        for (int i = num; i != 0; i ~/= 10) {
          rev = rev * 10 + i % 10;
        }
        if (rev == num) _palindromeCount = _palindromeCount! + 1;
      }
    });
  }

  void armstrongno() {
    setState(() {
      if (_armstrongCount! > 0) _armstrongCount = 0;

      for (int num in numList2) {
        int sum = 0;
        int temp = num;
        while (temp != 0) {
          int digit = temp % 10;
          sum += (digit * digit * digit);
          temp ~/= 10;
        }
        if (sum == num) _armstrongCount = _armstrongCount! + 1;
      }
    });
  }

  void strongno() {
    setState(() {
      if (_strongCount! > 0) _strongCount = 0;

      for (int num in numList3) {
        int sum = 0;
        int temp = num;
        while (temp != 0) {
          int digit = temp % 10;
          int fact = 1;
          for (int i = 1; i <= digit; i++) {
            fact *= i;
          }
          sum += fact;
          temp ~/= 10;
        }
        if (sum == num) _strongCount = _strongCount! + 1;
      }
    });
  }

  void resetCounts() {
    setState(() {
      _palindromeCount = 0;
      _armstrongCount = 0;
      _strongCount = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.systemBackground,
      appBar: AppBar(
        title: const Text("Check Count"),
        backgroundColor: CupertinoColors.darkBackgroundGray,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildCategory(
                  "Palindrome", numList1, palindromeno, _palindromeCount),
              const SizedBox(height: 30),
              _buildCategory("Armstrong", numList2, armstrongno, _armstrongCount),
              const SizedBox(height: 30),
              _buildCategory("Strong", numList3, strongno, _strongCount),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: resetCounts,
                style: ElevatedButton.styleFrom(
                  backgroundColor: CupertinoColors.destructiveRed,
                ),
                child: const Text("Reset Counts"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategory(
      String title, List<int> numbers, VoidCallback onPressed, int? count) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "List Of $title Numbers: $numbers",
          style: const TextStyle(color: CupertinoColors.label),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: CupertinoColors.activeBlue,
          ),
          child: Text("Check $title No"),
        ),
        const SizedBox(height: 15),
        Text(
          "$count",
          style: const TextStyle(color: CupertinoColors.label),
        ),
      ],
    );
  }
}


