import 'package:flutter/material.dart';
import 'package:login/Features/Order/Presentation/Bloc/Order_Cart/save_order_bloc.dart';
import 'package:login/core/Startup/injection.dart';

class Comment extends StatefulWidget {
  final String preComment;
  final int customerId;
  const Comment({
    super.key,
    required this.customerId,
    required this.preComment,
  });

  @override
  State<Comment> createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  late TextEditingController comment;
  late FocusNode commentFocusNode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    comment = TextEditingController(text: widget.preComment);

    commentFocusNode = FocusNode();

    commentFocusNode.addListener(() {
      if (!commentFocusNode.hasFocus) {
        getIt<SaveOrderBloc>().add(
          CommentChanged(comment: comment.text, customerId: widget.customerId),
        );
      }
    });
  }

  @override
  void dispose() {
    comment.dispose();
    // TODO: implement dispose
    super.dispose();
    commentFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
          padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
          decoration: BoxDecoration(
            color: Colors.white70.withValues(alpha: 0.88),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 3)],
          ),
          width: MediaQuery.sizeOf(context).width,
          height: 200,
          child: TextField(
            controller: comment,
            maxLines: 4,
            decoration: const InputDecoration(
              hintText: 'Enter your comment...',
              hintStyle: TextStyle(fontSize: 15, color: Colors.black26),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
