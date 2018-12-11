docker pull jrottenberg/ffmpeg:4.0-scratch

docker run -v /tmp:/tmp jrottenberg/ffmpeg:4.0-scratch -stream_loop -1 -i /tmp/test.mp4 -stats $ffmpeg_options rtsp://127.0.0.1:554/test.sdp
