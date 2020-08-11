ffpmeg -i /tmp/test.mp4 -stream_loop -1 -rtsp_transport tcp -vcodec h264 -f rtsp rtsp://127.0.0.1:554/test.sdp
