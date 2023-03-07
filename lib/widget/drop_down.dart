import 'package:flutter/material.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';

class AppDropDown extends StatefulWidget{
  final String? label;
  final Function(String)? onChanged;
  final String? hint;
  final List<String> items;
  final Function(String?)? onSave;



  AppDropDown({ Key? key,required this.label,required this.hint, this.items =const [],required this.onChanged,this.onSave}): super(key: key);
  @override
  _AppDropDownState createState()=> _AppDropDownState();
}
class _AppDropDownState extends State<AppDropDown>{
  String? selectedValue;

  Widget build(BuildContext context) {
    return  DropdownButtonFormField<String>(
      value: selectedValue,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelText:widget.label,
        labelStyle: TextStyle(color: Colors.black),
        border: OutlineInputBorder(),
        hintStyle: TextStyle(color: Colors.grey[800]),
        hintText: widget.hint,
      ),
      items: widget.items.map((String items) {
        return DropdownMenuItem(
          value: items,
          child: Text(items),
        );
      }).toList(),
      onChanged:(String? value) {
        setState(() {
          selectedValue = value;
          if (widget.onChanged != null) {
            widget.onChanged!(value!);
          }
        });
      },
      onSaved: widget.onSave,
    );
  }
}


class AppMultselect extends StatefulWidget{

  final List? items;
  final String title;
  void Function(dynamic)? onSave;

  AppMultselect({Key? key, this.items = const[],required this.title,required this.onSave}): super(key: key);

  _AppMultselectState createState()=> _AppMultselectState();
}
class _AppMultselectState extends State<AppMultselect>{
  String? selectedValue;
  late String _selectedResult;
  Widget build(BuildContext context) {
    return MultiSelectFormField(
        autovalidate: AutovalidateMode.onUserInteraction,
        chipBackGroundColor: Colors.blue,
        chipLabelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        dialogTextStyle: TextStyle(fontWeight: FontWeight.bold),
        checkBoxActiveColor: Colors.blue,
        checkBoxCheckColor: Colors.white,
        dialogShapeBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0))),
        title: Text(
         widget.title,
          style: TextStyle(fontSize: 16),
        ),
        validator: (value) {
          if (value == null || value.length == 0) {
            return 'Please select one or more options';
          }
          return null;
        },
        dataSource:widget.items,
        textField: 'display',
        valueField: 'value',
        okButtonLabel: 'OK',
        cancelButtonLabel: 'CANCEL',
        hintWidget: Text('Please choose one or more'),
        onSaved:widget.onSave
    );
  }

}