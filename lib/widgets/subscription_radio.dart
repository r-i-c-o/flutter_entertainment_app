import 'package:flutter/material.dart';

class SubscriptionRadio extends StatelessWidget {
  final String label;
  final int groupValue;
  final int value;
  final Function(int) onChanged;
  final String? save;

  const SubscriptionRadio(
      {Key? key,
      required this.label,
      required this.groupValue,
      required this.value,
      required this.onChanged,
      this.save})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (value != groupValue) onChanged(value);
      },
      child: Row(
        children: [
          Radio<int>(
            value: value,
            groupValue: groupValue,
            onChanged: (value) => onChanged(value!),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            activeColor: Colors.orange,
          ),
          Expanded(
            flex: 5,
            child: Text(
              label,
              style: TextStyle(
                color: value == groupValue ? Colors.orange : Colors.white,
              ),
            ),
          ),
          if (save != null)
            Flexible(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(2.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    save!,
                    style: const TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
