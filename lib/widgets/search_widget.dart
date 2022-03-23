import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  final String text;
  final ValueChanged<String> onChanged;
  final String hintText;

  const SearchWidget({
    Key? key,
    required this.text,
    required this.onChanged,
    required this.hintText,
  }) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final controller = TextEditingController();
  FocusNode focusNode = FocusNode();

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _styleActive = Theme.of(context).textTheme.headline3;
    final _styleHint = Theme.of(context).textTheme.headline4;
    final _style = widget.text.isEmpty ? _styleHint : _styleActive;

    return Material(
      elevation: 7,
      shadowColor: const Color.fromARGB(70, 187, 250, 245),
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 25, right: 15),
          child: TextField(
            focusNode: focusNode,
            cursorWidth: 1,
            cursorHeight: 20,
            controller: controller,
            strutStyle: const StrutStyle(height: 1.8),
            textAlignVertical: TextAlignVertical.center,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              suffixIcon: widget.text.isNotEmpty
                  ? GestureDetector(
                      child: Icon(Icons.close, color: _style?.color),
                      onTap: () {
                        focusNode.requestFocus();
                        controller.clear();
                        widget.onChanged('');
                        FocusScope.of(context).requestFocus(FocusNode());
                      },
                    )
                  : Icon(
                      Icons.search,
                      color: _style?.color,
                    ),
              hintText: widget.hintText,
              hintStyle: _style,
              border: InputBorder.none,
            ),
            style: _style,
            onChanged: widget.onChanged,
          ),
        ),
      ),
    );
  }
}
