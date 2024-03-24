import 'dart:io';

import 'package:dio/dio.dart';
import 'package:epub_view/epub_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:reader/src/common/common.dart';
import 'package:reader/src/features/book_details/book_details.dart';
import 'package:reader/src/features/features.dart';

class DownloadButton extends ConsumerStatefulWidget {
  final Entry entry;

  const DownloadButton({super.key, required this.entry});

  @override
  ConsumerState<DownloadButton> createState() => _DownloadButtonState();
}

class _DownloadButtonState extends ConsumerState<DownloadButton> {
  Dio dio = Dio();
  String? get id => widget.entry.id?.t;
  String? get fileName =>
      widget.entry.title?.t?.replaceAll(' ', '_').replaceAll(r"\'", "'");

  String progress = '';
  bool isDownloading = false;

  @override
  Widget build(BuildContext context) {
    if (id != null) {
      final book = ref
          .watch(downloadNotifierProvider)
          .valueOrNull
          ?.firstWhere((element) => element.id == id);
      return Container(
        decoration: BoxDecoration(
          color: context.theme.colorScheme.secondary,
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: InkWell(
          borderRadius: const BorderRadius.all(
            Radius.circular(20.0),
          ),
          onTap: () {
            if (isDownloading) {
              return;
            }
            if (book?.path != null) {
              openBook(book!.path!, context, ref);
            } else {
              checkPermissionAndDownload();
            }
          },
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Builder(builder: (context) {
                if (isDownloading) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                      Text(
                        progress,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      )
                    ],
                  );
                } else {
                  return Text(
                    book == null ? 'Download' : 'Read',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  );
                }
              }),
            ),
          ),
        ),
      );
    }
    return Container();
  }

  checkPermissionAndDownload() async {
    if (kIsWeb || Platform.isMacOS) {
      createFile();
      return;
    }

    final PermissionStatus permission = await Permission.storage.status;
    if (permission != PermissionStatus.granted) {
      await Permission.storage.request();
      await Permission.accessMediaLocation.request();
      await Permission.manageExternalStorage.request();
    }

    createFile();
  }

  createFile() async {
    final appDocDir = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory();

    if (appDocDir == null) {
      return;
    }

    String filePath;
    if (Platform.isAndroid) {
      String dirPath = appDocDir.path.split('Android')[0];
      Directory(dirPath + Strings.appName).createSync();
      filePath = path.join(dirPath, Strings.appName, '$fileName.epub');
    } else {
      final String dirPath = path.join(appDocDir.path, Strings.appName);
      Directory(dirPath).createSync();
      filePath = path.join(dirPath, '$fileName.epub');
    }

    final File file = File(filePath);
    if (!await file.exists()) {
      await file.create();
    } else {
      await file.delete();
      await file.create();
    }

    download(filePath);
  }

  download(String filePath) async {
    final downloadUrl = widget.entry.downloadUrl;
    if (downloadUrl == null) {
      return;
    }
    isDownloading = true;
    await dio.download(downloadUrl, filePath,
        onReceiveProgress: (count, total) {
      setState(() {
        progress = '${(count / total * 100).toStringAsFixed(0)}%';
      });
    }).then((value) {
      final book = Book(
        id: id,
        path: filePath,
        image: widget.entry.cover,
        name: fileName,
      );
      isDownloading = false;
      ref.read(downloadNotifierProvider.notifier).addBook(book, id!);
    });
  }

  Future<void> openBook(
    String path,
    BuildContext context,
    WidgetRef ref,
  ) async {
    final bookFile = File(path);
    if (bookFile.existsSync()) {
      EpubController controller =
          EpubController(document: EpubDocument.openFile(bookFile));
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) {
            return EpubView(controller: controller);
          },
        ),
      );
    } else {
      context.showSnackBarUsingText(
          'Could not find the book file. Please download it again');
      if (id != null) {
        ref.read(downloadNotifierProvider.notifier).deleteBook(id!);
      }
    }
  }
}
