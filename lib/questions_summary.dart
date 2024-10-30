import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  QuestionsSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data){
              List<Color> activeColor = data['user_answer'] == data['correct_answer']
                  ? [Color(0xB64CAEE3), Color(0xDA24E5C4)] : [Color(0xC5EC17A6), Color(
                  0xD3E82A2A)];
              return Container(
                margin: EdgeInsets.only(bottom: 30),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        width: 50,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          gradient: LinearGradient(
                            colors: activeColor
                          ),
                        ),
                        child: Text(((data['question_index'] as int)+1).toString(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),)
                    ),
                    const SizedBox(width: 20,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data['question'] as String,
                            style: TextStyle(color: Colors.white),
                          ),
                          const SizedBox(height: 5,),
                          Text(
                            data['user_answer'] as String,
                            style: TextStyle(color: Color(0xCF0CEEDE)),
                          ),
                          Text(
                            'You choose: ${data['correct_answer'] as String}',
                            style: TextStyle(color: Color(0xA3FFFFFF)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
          }).toList(),
        ),
      ),
    );
  }
}
