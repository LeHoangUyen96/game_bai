
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:viet_trung_mobile/res/colors.dart';
import 'package:viet_trung_mobile/widget/text_customized.dart';

class DatepickerCustomized extends StatefulWidget {
 
  @override
  State<StatefulWidget> createState() {
    return _DatePickerCustomiedState();
  }
  
}

class _DatePickerCustomiedState extends State<DatepickerCustomized> {
  DateTime? pickedDate;
  
  @override
  void initState() {
    super.initState();
     pickedDate = DateTime.now();
  }
    _pickDate (BuildContext context) async {
      DateTime? date = await showDatePicker(
       context: context, 
      initialDate: pickedDate!, 
      firstDate: DateTime(DateTime.now().year-10), 
      lastDate: DateTime(DateTime.now().year+10),
      );
      if(date != null)
       setState(() {
         pickedDate = date;
         print(date.toString());
       });
     }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
        width:  Get.width,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: MAIN_BT_SAVE_ADDRESS,
            ),
            borderRadius: BorderRadius.all(Radius.circular(9))
        ),
      child: Row (
        crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 8,
              child: InkWell(
                onTap: (){_pickDate(context).toString();} ,
                child: TextCustomized(
                  text: "${pickedDate!.day}/${pickedDate!.month}/${pickedDate!.year}")
              )
              ),
              
             // Expanded(child: SvgPicture.asset(IC_CALENDAR)),
          ],
        
      ),
    );
    
  }
  
}
