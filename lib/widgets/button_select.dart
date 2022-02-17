

import 'package:banipay_comercial/models/button_select_option.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonSelect extends FormField<ButtonSelectOption> {

  List<ButtonSelectOption>  list;
  ButtonSelectOption ? selected;

  Function onSelected;
  Size size;
  Color colorBg;
  IconData ? icon;
  BuildContext context;
  Color colorText;
  String text;
  ButtonSelect({Key? key,
    String? Function(ButtonSelectOption?)? validate,required this.selected, required this.context,this.icon,required this.list,required this.size,required this.colorText,required this.colorBg,required this.text,required this.onSelected})
      : super(key: key,initialValue: selected,validator: validate,builder: (FormFieldState<ButtonSelectOption> state){
    return GestureDetector(
      onTap: () async {
        ButtonSelectOption? selected=await showDialog(context: context, builder:
            (context){
          final _screenSize=MediaQuery.of(context).size;
          return AlertDialog(
            contentPadding: EdgeInsets.zero,
            titlePadding:EdgeInsets.zero ,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            title: Container(
              padding: EdgeInsets.symmetric(vertical: _screenSize.height*0.02 ),
              decoration: BoxDecoration(
                  color: colorBg,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20))
              ),
              child: Text( text,style: const TextStyle(color:  Colors.white,fontSize: 20,fontWeight: FontWeight.w700),textAlign: TextAlign.center,),
            ),
            content: SizedBox(
              height: _screenSize.height*0.18,
              width: _screenSize.width,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: _screenSize.height*0.01 ),
                itemBuilder: (context,index){
                  return TextButton(onPressed: (){

                    Navigator.pop(context,list[index]);
                  }, child:  Text( list[index].text,style: TextStyle(color:  colorText),textAlign: TextAlign.center,));
                },
                itemCount:  list.length,

              ),
            ),
            actionsPadding: EdgeInsets.zero,
            actions: [
              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: const Text("Cancelar",style: TextStyle(color: Colors.red),),)
            ],
          );
        });
        if(selected!=null){
          onSelected(selected);
          state.didChange(selected);
        }
      },

      child: Container(
          height: size.height,
          width: size.width,

          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                  color: !state.hasError?colorBg.withOpacity(0.5):Colors.red,width: 1)
          ),
          child:
          SizedBox(
            height:  size.height,
            width:  size.width*0.8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                 icon != null?Icon( icon,color:  colorText,):Container(),
                Text( selected!=null? selected.text: text, style: TextStyle(
                    color:  colorText,
                    fontSize: 14,

                    fontWeight: FontWeight.w600),maxLines: 1,overflow: TextOverflow.ellipsis,),

              ],
            ),
          )
      ),

    );
  });



}
