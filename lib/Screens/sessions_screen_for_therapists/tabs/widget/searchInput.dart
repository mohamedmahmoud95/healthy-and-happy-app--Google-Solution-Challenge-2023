
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
        color: bgLavender2,
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 3),
            child: Icon(
              Icons.search,
              color: lavender,
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search...',
                hintStyle: TextStyle(
                    fontSize: 15,
                    color: lavender,
                    fontWeight: FontWeight.w300),
              ),
              cursorColor: Colors.indigoAccent,
            ),
          ),
        ],
      ),
    );
  }
}
