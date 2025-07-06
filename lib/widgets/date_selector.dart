import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateSelector extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onSelect;

  const DateSelector({
    super.key,
    required this.selectedIndex,
    required this.onSelect,
  });

  @override
  State<DateSelector> createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  final ScrollController _scrollController = ScrollController();

  final Color topContainerColor = const Color(0xFF2C3499); // #2c3499
  final Color innerContainerColor = const Color(0xFF151B73); // #151b73
  final Color unselectedTopColor = Colors.grey.shade200;
  final Color unselectedInnerColor = Colors.grey.shade400;
  final Color selectedTextColor = Colors.white;
  final Color unselectedTextColor = Colors.black87;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToSelectedIndex();
    });
  }

  @override
  void didUpdateWidget(covariant DateSelector oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedIndex != widget.selectedIndex) {
      _scrollToSelectedIndex();
    }
  }

  void _scrollToSelectedIndex() {
    final double position = widget.selectedIndex * 72.0;
    _scrollController.animateTo(
      position,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final today = DateTime.now();
    final weekDays = List.generate(21, (i) => today.add(Duration(days: i - 2)));

    return SizedBox(
      height: screenWidth * 0.2,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: weekDays.length,
        itemBuilder: (context, index) {
          final date = weekDays[index];
          final isSelected = index == widget.selectedIndex;

          return GestureDetector(
            onTap: () => widget.onSelect(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              width: screenWidth * 0.17,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: isSelected ? topContainerColor : unselectedTopColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      DateFormat('E').format(date).toUpperCase(),
                      style: TextStyle(
                        fontSize: screenWidth * 0.03,
                        color: isSelected ? selectedTextColor : unselectedTextColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                    width: screenWidth * 0.15,
                    height: screenWidth * 0.11,
                    margin: const EdgeInsets.only(bottom: 6),
                    decoration: BoxDecoration(
                      color: isSelected ? innerContainerColor : unselectedInnerColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        '${date.day}',
                        style: TextStyle(
                          fontSize: screenWidth * 0.045,
                          fontWeight: FontWeight.bold,
                          color: isSelected ? selectedTextColor : unselectedTextColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
