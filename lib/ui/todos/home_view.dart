import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/models/todo_item.dart';
import 'package:todo/core/services/todo_service.dart';
import 'package:todo/ui/shared/todo_app_bar.dart';
import 'package:todo/ui/todos/widgets/no_tasks.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TodoAppBar(),
        Provider.of<TodoService>(context).todosCount() == 0
            ? NoTasks()
            : TodoList(items: Provider.of<TodoService>(context).fetchTodos()),
      ],
    );
  }
}

class TodoList extends StatelessWidget {
  final List<TodoItem> items;

  const TodoList({this.items});
  @override
  Widget build(BuildContext context) {
    return Consumer<TodoService>(
      builder: (BuildContext context, TodoService todoService, Widget child) {
        return SingleChildScrollView(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              final todoItem = items[index];

              return Card(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5.0),
                      bottomLeft: Radius.circular(5.0),
                    ),
                    color: todoItem.project.color,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 5.0),
                    child: Container(
                      color: Colors.white,
                      child: ListTile(
                        leading: CustomCheckbox(
                          isChecked: todoItem.done,
                          checkboxCallback: () {
                            todoService.toggleDone(todoItem);
                          },
                        ),
                        title: todoItem.done
                            ? TodoItemDoneTitle(todoItem: todoItem)
                            : TodoItemUnDoneTitle(todoItem: todoItem),
                        trailing: GestureDetector(
                            onTap: () {
                              todoService.toggleRemind(todoItem);
                            },
                            child: todoItem.remind
                                ? SvgPicture.asset(
                                    "assets/images/bell-yellow.svg")
                                : SvgPicture.asset(
                                    "assets/images/bell-gray.svg")),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class TodoItemDoneTitle extends StatelessWidget {
  const TodoItemDoneTitle({
    Key key,
    @required this.todoItem,
  }) : super(key: key);

  final TodoItem todoItem;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: <InlineSpan>[
        TextSpan(
          text: todoItem.date,
          style: TextStyle(
              fontFamily: 'Rubik', fontSize: 11.0, color: Color(0xFFC6C6C8)),
        ),
        WidgetSpan(
            child: SizedBox(
          width: 15.0,
        )),
        TextSpan(
          text: todoItem.title,
          style: TextStyle(
              fontFamily: 'Rubik',
              fontSize: 14.0,
              decoration: TextDecoration.lineThrough,
              color: Color(0xFFD9D9D9)),
        ),
      ]),
    );
  }
}

class TodoItemUnDoneTitle extends StatelessWidget {
  const TodoItemUnDoneTitle({
    Key key,
    @required this.todoItem,
  }) : super(key: key);

  final TodoItem todoItem;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: <InlineSpan>[
        TextSpan(
          text: todoItem.date,
          style: TextStyle(
              fontFamily: 'Rubik', fontSize: 11.0, color: Color(0xFFC6C6C8)),
        ),
        WidgetSpan(
            child: SizedBox(
          width: 15.0,
        )),
        TextSpan(
          text: todoItem.title,
          style: TextStyle(
              fontFamily: 'Rubik',
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
              color: Color(0xFF554E8F)),
        ),
      ]),
    );
  }
}

class CustomCheckbox extends StatelessWidget {
  final bool isChecked;
  final Function checkboxCallback;

  CustomCheckbox({this.isChecked, this.checkboxCallback});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: checkboxCallback,
      child: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(0.0, 0.0),
            child: Stack(
              children: <Widget>[
                isChecked
                    ? SvgPicture.asset("assets/images/checked.svg")
                    : SvgPicture.asset("assets/images/unchecked.svg"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
