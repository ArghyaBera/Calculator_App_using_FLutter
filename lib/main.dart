import 'package:calculator_app/colors.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main(){
  runApp(const MaterialApp(
    home: CalculatorApp(),
  ));
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  //variable

  // double num1=0.0;
  // double num2=0.0;
  var input='';
  var output='';
  // var operator='';

  onButtonClick(value) {
    if (value == 'AC') {
      input = '';
      output = '';
    }
    else if (value == '->') {
      if(input.isNotEmpty)
        {
          input = input.substring(0, input.length - 1);
        }
    }

    else if (value == "=") {
      if(input.isNotEmpty)
        {
          var userInput=input;
          Parser p=Parser();
          Expression ex=p.parse(userInput);
          ContextModel cm=ContextModel();
          var finalValue=ex.evaluate(EvaluationType.REAL, cm);
          output=finalValue.toString();
          if(output.endsWith(".0"))
            {
              output = output.substring(0, output.length - 2);
            }
          input=output;
        }
    }
    else{
      input=input+value;
    }
    setState(() {

    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          
          
          // SCREEN 
          Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(12.0),
                color: Colors.black,
                child: Column(
                  mainAxisAlignment:MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      input,
                      style: TextStyle(
                        fontSize: 48,
                        color: Colors.orangeAccent,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      output,
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.orangeAccent.withOpacity(0.7),
                      ),
                    ),
                    SizedBox(height: 15,)
                  ],
                ),
              ),
          ),
          
          
          
          
          // BUTTONS 
          Row(
            children: [
              button(text: 'AC',bcolor: operatorcolor),
              button(text: '->',bcolor: operatorcolor),
              button(text: '=',bcolor: buttoncolor),
              button(text: '+',bcolor: buttoncolor)
            ],
          ),
          Row(
            children: [
              button(text: '1',bcolor: buttoncolor),
              button(text: '2',bcolor: buttoncolor),
              button(text: '3',bcolor: buttoncolor),
              button(text: '-',bcolor: operatorcolor)
            ],
          ),
          Row(
            children: [
              button(text: '4',bcolor: buttoncolor),
              button(text: '5',bcolor: buttoncolor),
              button(text: '6',bcolor: buttoncolor),
              button(text: '/',bcolor: operatorcolor)
            ],
          ),
          Row(
            children: [
              button(text: '7',bcolor: buttoncolor),
              button(text: '8',bcolor: buttoncolor),
              button(text: '9',bcolor: buttoncolor),
              button(text: '*',bcolor: operatorcolor)
            ],
          ),
        ],
      ),

    );
  }



  Widget button({text,bcolor=buttoncolor,})
  {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(8),
        child: ElevatedButton(
          style:ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              backgroundColor: buttoncolor
          ),
          onPressed:()=>onButtonClick(text),
          child: Text(text,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold, color: Colors.black),),
        ),
      ),
    );
  }



}





