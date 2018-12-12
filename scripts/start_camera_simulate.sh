#!/bin/bash
#./tmp/easydarwin install
#./tmp/easydarwin start.sh && echo "OK\n\n"
cd /tmp/EasyDarwin-linux-8.1.0-1811292237

sed 's/554/'${PORT}'/g' -i /tmp/EasyDarwin-linux-8.1.0-1811292237/easydarwin.ini
sed 's/10008/'${HTTP_PORT}'/g' -i /tmp/EasyDarwin-linux-8.1.0-1811292237/easydarwin.ini
cat easydarwin.ini

echo "\n\n"
./easydarwin start.sh &
sleep 5
echo "start easydarwin successfully...\n"
echo "Start ffmpeg ...\n"
ffmpeg -stream_loop -1 -i /tmp/test.mp4 -rtsp_transport tcp -vcodec h264 -f rtsp rtsp://$IP:$PORT/$FILE
