import 'package:flutter/material.dart';
import 'package:flutter_study/ui/widgets/dropdown/dropdown_plus.dart';


class DropDownFormField extends FormField<dynamic> {
  final String titleText;
  final String hintText;
  final TextStyle hintStyle;
  final bool required;
  final String errorText;
  final dynamic value;
  final List dataSource;
  final String textField;
  final String valueField;
  final Function onChanged;

  DropDownFormField(
      {FormFieldSetter<dynamic> onSaved,
        FormFieldValidator<dynamic> validator,
        bool autovalidate = false,
        this.titleText = 'Title',
        this.hintText = '请选择',
        this.hintStyle ,
        this.required = false,
        this.errorText = '请选择',
        this.value,
        this.dataSource,
        this.textField,
        this.valueField,
        this.onChanged})
      : super(
    onSaved: onSaved,
    validator: validator,
    autovalidate: autovalidate,
    builder: (FormFieldState<dynamic> state) {
      return Container(
        child:
//        Column(
//          crossAxisAlignment: CrossAxisAlignment.start,
//          children: <Widget>[
//            InputDecorator(
//              decoration: InputDecoration(
//                contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 0),
//                labelText: titleText,
//                filled: true,
//              ),
//              child:
             DropdownButtonHideUnderlinePlus(
                child: DropdownButtonPlus<dynamic>(
                  hint: Text(
                    hintText,
                    style: hintStyle,
                  ),
                  value: value == '' ? null : value,
                  onChanged: (dynamic newValue) {
                    state.didChange(newValue);
                    onChanged(newValue);
                  },
                  items: dataSource.map((item) {
                    return DropdownMenuItemPlus<dynamic>(
                      value: item[valueField],
                      child: Text(item[textField]),
                    );
                  }).toList(),
                ),
              ),
//            ),
//            SizedBox(height: state.hasError ? 5.0 : 0.0),
//            Text(
//              state.hasError ? state.errorText : '',
//              style: TextStyle(color: Colors.redAccent.shade700, fontSize: state.hasError ? 12.0 : 0.0),
//            ),
//          ],
//        ),
      );
    },
  );
}