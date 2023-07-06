import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/controller/comment_controller.dart';
import 'package:timeago/timeago.dart' as tago;

class CommentScreen extends StatefulWidget {
  final String id;
  CommentScreen({super.key, required this.id});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  final TextEditingController _commentController = TextEditingController();

  final CommentController commentController = Get.put(CommentController());
  @override
  void dispose() {
    super.dispose();
    _commentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    commentController.updatePostId(widget.id);
    return Scaffold(
      // bottomNavigationBar: ,
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              Expanded(
                child: Obx(() {
                  return ListView.builder(
                    itemCount: commentController.comments.length,
                    itemBuilder: (context, index) {
                      final comment = commentController.comments[index];
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(comment.profilePhoto),
                          backgroundColor: Colors.black,
                        ),
                        title: Row(
                          children: [
                            Text(
                              comment.username,
                              style: textStyle(
                                FontWeight.w700,
                                Colors.red,
                                20,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              comment.comment,
                              style: textStyle(
                                FontWeight.w500,
                                Colors.white,
                                20,
                              ),
                            ),
                          ],
                        ),
                        subtitle: Row(
                          children: [
                            Text(
                              tago.format(comment.datePublished.toDate()),
                              style: textStyle(
                                FontWeight.w300,
                                Colors.white,
                                12,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              '${comment.likes.length} likes',
                              style: textStyle(
                                FontWeight.w300,
                                Colors.white,
                                12,
                              ),
                            )
                          ],
                        ),
                        trailing: InkWell(
                          onTap: () =>
                              commentController.likeComment(comment.id),
                          child: Icon(
                            Icons.favorite,
                            size: 25,
                            color:
                                comment.likes.contains(authController.user.uid)
                                    ? Colors.red
                                    : Colors.white,
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),
              const Divider(),
              ListTile(
                title: TextFormField(
                  controller: _commentController,
                  style: textStyle(FontWeight.bold, Colors.white, 16),
                  decoration: InputDecoration(
                    labelText: 'Comment',
                    labelStyle: textStyle(FontWeight.w700, Colors.white, 20),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                ),
                trailing: TextButton(
                    onPressed: () =>
                        commentController.postComment(_commentController.text),
                    child: Text(
                      'Send',
                      style: textStyle(FontWeight.w700, Colors.white, 16),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
