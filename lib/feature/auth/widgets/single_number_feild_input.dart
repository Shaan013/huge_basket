import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:huge_basket/core/theme/app_colors.dart';
import 'package:huge_basket/core/theme/app_out_line_border.dart';

class SingleNumberFieldInput extends StatefulWidget {
  final int numberSize;
  final FormFieldSetter<int>? onSaved;
  final String? Function(int?) validation;
  final TextEditingController controller;

  const SingleNumberFieldInput({
    super.key,
    required this.onSaved,
    required this.numberSize,
    required this.validation,
    required this.controller,
  });

  @override
  State<SingleNumberFieldInput> createState() => _SingleNumberFieldInputState();
}

class _SingleNumberFieldInputState extends State<SingleNumberFieldInput> {
  // Use late (without final) or initialize in initState for better lifecycle control
  late List<FocusNode> _focusNodeList;
  late List<TextEditingController> _controllerList;

  @override
  void initState() {
    super.initState();
    _focusNodeList = List.generate(widget.numberSize, (index) => FocusNode());
    _controllerList = List.generate(
      widget.numberSize,
      (index) => TextEditingController(),
    );
  }

  @override
  void dispose() {
    // ALWAYS dispose nodes and controllers to avoid memory leaks
    for (var node in _focusNodeList) {
      node.dispose();
    }
    for (var controller in _controllerList) {
      controller.dispose();
    }
    super.dispose();
  }

  void _handleOnTap(int index) {
    final _fisrtNode = _controllerList.indexWhere((con) => con.text.isEmpty);
    debugPrint("f node :$_fisrtNode");
    if (_fisrtNode != -1) {
      log("call");
      _focusNodeList[_fisrtNode].requestFocus();
    } else {
      // 2. Fix cursor position: Force it to the end so they can't type "behind" the number
      _focusNodeList[widget.numberSize-1].requestFocus();
    }
    // if()
  }

  String update() {
    String pin = _controllerList.map((tem) => tem.text).join();
    widget.controller.text = pin;
    return pin;
  }

  @override
  Widget build(BuildContext context) {
    return FormField<int>(
      autovalidateMode: .onUserInteraction,
      onSaved: widget.onSaved,
      validator: widget.validation,
      builder: (field) {
        void hendleOnChange(_) {
          // String value =
          // field.didChange(value);
          print("object");
        }

        return Column(
          children: [
            Row(
              spacing: 20,
              mainAxisAlignment: .center,
              children: [
                ...List.generate(widget.numberSize, (index) {
                  print(index);
                  print(_focusNodeList[index]);
                  return _singleField(
                    onChange: (value) {
                      if (value.isNotEmpty) {
                        if (index < widget.numberSize - 1) {
                          _focusNodeList[index + 1].requestFocus();
                        } else {
                          _focusNodeList[index].unfocus(); // Last field filled
                        }
                      }
                      if (value.isEmpty && index > 0) {
                        FocusScope.of(
                          context,
                        ).requestFocus(_focusNodeList[index - 1]);
                      }

                      final pin = update();
                      field.didChange(int.tryParse(pin));
                      if (field.hasError) {
                        field
                            .validate(); // Re-runs validation to clear the error message
                      }
                    },

                    currentNode: index,
                    nextNode: (index < index) ? index + 1 : null,
                  );
                }),

                // Show validation error if it exists
              ],
            ),
            if (field.hasError)
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  field.errorText ?? "",
                  style: const TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
          ],
        );
      },
    );
  }

  Widget _singleField({
    required ValueChanged<String> onChange,
    required int currentNode,
    required int? nextNode,
  }) {
    return SizedBox(
      width: 50,
      child: KeyboardListener(
        // FocusNode is required to capture keyboard events
        focusNode: FocusNode(),
        onKeyEvent: (KeyEvent event) {
          // Only trigger on KeyDown (when key is pressed)
          if (event is KeyDownEvent) {
            // Check if backspace was pressed and the current field is empty
            if (event.logicalKey == LogicalKeyboardKey.backspace &&
                _controllerList[currentNode].text.isEmpty &&
                currentNode > 0) {


              _focusNodeList[currentNode - 1].requestFocus();

              // Optional: Clear the previous field when moving back
              // _controllerList[currentNode - 1].clear();
            }
          }
        },
        child: TextField(
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly
          ],
          enableInteractiveSelection: false,
          showCursor: false,
          textAlign: .center,
          controller: _controllerList[currentNode],
          focusNode: _focusNodeList[currentNode],
          keyboardType: TextInputType.number,
          maxLength: 1,
          onTap: () => _handleOnTap(currentNode),
          onChanged: onChange,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
            hintText: "-",
            filled: true,
            fillColor: AppColors.deepGray,
            enabledBorder: AppOutLineBorder.authEnable,
            focusedBorder: AppOutLineBorder.authFocus,
            counterText: "",
          ),
        ),
      ),
    );
  }
}
