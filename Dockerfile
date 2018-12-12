#docker pull jrottenberg/ffmpeg:4.0-scratch

FROM docker.io/jrottenberg/ffmpeg:4.0-centos
#FROM docker.io/jrottenberg/ffmpeg:4.0-scratch
#FROM docker.io/jrottenberg/ffmpeg:3.4-alpine

ADD EasyDarwin-linux-8.1.0-1811292237 /tmp/EasyDarwin-linux-8.1.0-1811292237
#RUN chmod +x /tmp/EasyDarwin-linux-8.1.0-1811292237.tar.gz
#RUN tar -xzvf /tmp/EasyDarwin-linux-8.1.0-1811292237.tar.gz -C /tmp
RUN cd /tmp/EasyDarwin-linux-8.1.0-1811292237 
#RUN sed 's/554/${PORT}/g' -i /tmp/EasyDarwin-linux-8.1.0-1811292237/easydarwin.ini
#RUN sed 's/10008/${HTTP_PORT}/g' -i /tmp/EasyDarwin-linux-8.1.0-1811292237/easydarwin.ini


ADD easydarwin.ini /tmp/easydarwin.ini
ADD easydarwin /tmp/easydarwin
RUN chmod +x /tmp/easydarwin

ADD test.mp4 /tmp/test.mp4
RUN chmod +x /tmp/test.mp4

ADD ./scripts/start_camera_simulate.sh /root/scripts/start_camera_simulate.sh
RUN chmod +x /root/scripts/start_camera_simulate.sh
RUN cat /root/scripts/start_camera_simulate.sh

ENTRYPOINT ["/bin/sh", "-x", "/root/scripts/start_camera_simulate.sh"]

# COPY
# WORKDIR

# ENV DEP_VERSION="0.4.1"
#docker run -v /tmp:/tmp jrottenberg/ffmpeg:4.0-scratch -stream_loop -1 -i /tmp/test.mp4 -stats $ffmpeg_options rtsp://127.0.0.1:554/test.sdp
