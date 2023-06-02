
import 'package:flutter/material.dart';
import 'package:mental_health_app/Constants/project_colors.dart';


class SearchInput extends StatelessWidget {
  const SearchInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: bgLavender1,
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 3),
            child: Icon(
              Icons.search,
              color: lavender,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search a doctor or health issue',
                hintStyle: TextStyle(
                    fontSize: 13,
                    color: lavender,
                    fontWeight: FontWeight.w700),
              ),
              cursorColor: Colors.indigoAccent,
            ),
          ),
        ],
      ),
    );
  }
}
