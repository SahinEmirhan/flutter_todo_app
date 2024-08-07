import "dart:ui";

import "package:flutter/material.dart";

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        title: Center(child: Title(color: Colors.blueAccent, child: Text('Todo List' , style : TextStyle(color : Colors.white)))),
        backgroundColor: Color.fromARGB(255, 114, 139, 180),
      ),
      body : TodoStateful(),
      );
  }
}




class TodoStateful extends StatefulWidget {
  TodoStateful({super.key });
  
  @override
  State<TodoStateful> createState() => _TodoStatefulState();
}

class _TodoStatefulState extends State<TodoStateful> {
 final List<String> todoList = [];
 final List<String> completedTasks = [];
 final taskController = TextEditingController();
  void addTodo(String task){
    setState(() {
      todoList.add(task);
    });
    taskController.clear();
  }
  void removeTodoItem(int index){
    setState(() => {
      todoList.removeAt(index)
    });
  }
  void completeTask(int index){
    setState(() {
      completedTasks.add(todoList[index]);
      todoList.removeAt(index);
      if(completedTasks.length > 5)
      {
        completedTasks.removeAt(0);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment : Alignment.topCenter,
        child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Flexible(
                  flex: 1,
                  child: Column(
                    children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin: EdgeInsets.all(20),
                    child: Text('Görevlerim' , style: TextStyle(color:Color.fromARGB(157, 0, 0, 0) , fontSize : 22),),
                    decoration: BoxDecoration(
                  
                    ),
                  ),
                ),
                Expanded(
                  
                  child: Container(
                    decoration: BoxDecoration(),
                    child: ListView.builder(itemCount: todoList.length, itemBuilder: (context , index){
                      return Dismissible(
                        key: Key(todoList[index]),
                         background: Container(
                          color: Colors.green,
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                        ),
                        secondaryBackground: Container(
                          color: Colors.red,
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ),
                        onDismissed: (direction) {
                          if (direction == DismissDirection.startToEnd) {
                            // Sağa kaydırıldığında tamamla
                            completeTask(index);
                          } else if (direction == DismissDirection.endToStart) {
                            // Sola kaydırıldığında sil
                            removeTodoItem(index);
                          }
                        },
                        child: Container(
                            
                            padding: EdgeInsets.all(10),
                            margin : EdgeInsets.only(bottom : 5 , top:5 ,  right: 24 , left: 24),
                            decoration: BoxDecoration(
                              color:Color.fromARGB(255, 98, 156, 255),
                              borderRadius: BorderRadius.all(Radius.circular(16))
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(todoList[index], style: TextStyle(color:Colors.white , fontSize : 16 , fontWeight: FontWeight.w500),),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed:(){
                                        removeTodoItem(index);
                                      },
                                      icon: Icon(Icons.delete , color:Colors.redAccent),
                                    ),
                                    IconButton(
                                      onPressed:(){
                                        completeTask(index);
                                      },
                                      icon: Icon(Icons.check , color:Colors.greenAccent),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                      );
                    }),
                  ),
                ), 
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Column(
                    children: [
                      Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin: EdgeInsets.all(20),
                    child: Text('Tamamlanan Görevler' , style: TextStyle(color:Color.fromARGB(157, 0, 0, 0) , fontSize : 22),),
                    decoration: BoxDecoration(
                  
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(itemCount: completedTasks.length, itemBuilder: (context , index){
                    return Container(
                        width: 250,
                        padding: EdgeInsets.all(10),
                        margin : EdgeInsets.only(bottom : 5 , top:5 ,  right: 24 , left: 24),
                        decoration: BoxDecoration(
                          color:const Color.fromARGB(255, 114, 139, 180),
                          borderRadius: BorderRadius.all(Radius.circular(16))
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(completedTasks[index], style: TextStyle(color:Colors.white , fontSize : 16 , fontWeight: FontWeight.w500),),
                          ],
                        ),
                      );
                  }),
                ), 
                    ],
                  ),
                ),
                
        TextField(
        controller: taskController,
        
        decoration: InputDecoration(
          border : OutlineInputBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight:Radius.circular(24) ),
          ),
          hintText: 'Write your task..',
          suffixIcon: IconButton(onPressed: (){
            addTodo(taskController.text);
          }, icon: Icon(Icons.send)),
        ),
        ) 
              ],
            ),
        );
  }
}