import 'package:flutter/material.dart';

class MultiSizeBoxPage extends StatelessWidget {
  const MultiSizeBoxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: true,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 180,
                color: Colors.red,
              ),
              SizedBox(height: 10,),
              Container(
                width: double.infinity,
                child: GridView.count(
                  // childAspectRatio: 1,
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: List.generate(4, (index){
                    return Container(
                      color: Colors.blue,
                    );
                  }),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                width: double.infinity,
                height: 350,
                child: GridView.builder(
                  itemCount: 9,
                  physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                    ),
                    itemBuilder: (ctx,index){
                      return Container(
                        width: 50,
                        height: 50,
                        color: Colors.amber,
                      );
                    }),

              ),
              SizedBox(height: 10,),
            ],

          ),
        ),
      ),
    );
  }
}
