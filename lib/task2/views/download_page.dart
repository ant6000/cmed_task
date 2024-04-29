// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';

// class DownloadPage extends StatefulWidget {
//   const DownloadPage({super.key});

//   @override
//   State<DownloadPage> createState() => _DownloadPageState();
// }

// class _DownloadPageState extends State<DownloadPage> {
//   String downloadMessage = 'initializing';
//   bool _isdownloading = false;
//   double _percentage = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             ElevatedButton(
//                 style: TextButton.styleFrom(
//                     backgroundColor: Colors.blue,
//                     foregroundColor: Colors.white),
//                 onPressed: () async {
//                   setState(() {
//                     _isdownloading = !_isdownloading;
//                   });
//                   var dir = await getExternalStorageDirectory();
//                   Dio dio = Dio();
//                   dio.download(
//                     'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
//                     '${dir!.path}/sample_video.mp4',
//                     onReceiveProgress: (actualbytes, totalbytes) {
//                       var percentage = actualbytes / totalbytes * 100;
//                       if (percentage < 100) {
//                         _percentage = percentage / 100;
//                         setState(() {
//                           downloadMessage =
//                               'Downloading....${percentage.floor()}%';
//                         });
//                       } else {
//                         downloadMessage = 'Successfully Downloaded';
//                       }
//                     },
//                   );
//                 },
//                 child: const Text('Download')),
//             Text(downloadMessage ?? ''),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: LinearProgressIndicator(
//                 value: _percentage,
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class DownloadPage extends StatefulWidget {
  const DownloadPage({Key? key});

  @override
  State<DownloadPage> createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage> {
  String downloadMessage = 'initializing';
  bool _isdownloading = false;
  double _percentage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              onPressed: () async {
                setState(() {
                  _isdownloading = !_isdownloading;
                });
                var dir = await getExternalStorageDirectory();
                Dio dio = Dio();
                try {
                  await dio.download(
                    'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
                    '${dir!.path}/sample_video.mp4',
                    onReceiveProgress: (actualbytes, totalbytes) {
                      var percentage = actualbytes / totalbytes * 100;
                      if (percentage < 100) {
                        setState(() {
                          _percentage = percentage / 100;
                          downloadMessage =
                              'Downloading....${percentage.floor()}%';
                        });
                      } else {
                        setState(() {
                          _percentage = 1.0; // Ensure progress indicator is at 100%
                          downloadMessage = 'Successfully Downloaded';
                        });
                      }
                    },
                  );
                } catch (e) {
                  setState(() {
                    downloadMessage = 'Error: $e';
                  });
                }
              },
              child: const Text('Download'),
            ),
            Text(downloadMessage ?? ''),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: LinearProgressIndicator(
                value: _percentage,
              ),
            )
          ],
        ),
      ),
    );
  }
}
