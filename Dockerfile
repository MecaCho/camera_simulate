docker pull jrottenberg/ffmpeg:4.0-scratch

FROM docker.io/jrottenberg/ffmpeg:4.0-scratch


ADD ./test.mp4 /tmp/test.mp4
RUN chmod +x /tmp/test.mp4

ADD ./scripts/start_camera_simulate.sh /root/scripts/start_camera_simulate.sh
RUN chmod +x /root/scripts/start_camera_simulate.sh
RUN cat /root/scripts/start_camera_simulate.sh

ENTRYPOINT ["/bin/sh", "-x", "/root/scripts/start_camera_simulate.sh"]

# COPY
# WORKDIR

# ENV DEP_VERSION="0.4.1"
#docker run -v /tmp:/tmp jrottenberg/ffmpeg:4.0-scratch -stream_loop -1 -i /tmp/test.mp4 -stats $ffmpeg_options rtsp://127.0.0.1:554/test.sdp
