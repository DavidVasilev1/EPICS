make:
	rm -f ./pages/*.ts

	# delay to initialize properly
	sleep 2

	# stream 1 
	ffmpeg -rtsp_transport tcp -i rtsp://admin:abc12345@192.168.10.118:554/ \
		-c copy -f hls -hls_time 10 -hls_list_size 8 -hls_flags delete_segments \
		./pages/stream.m3u8 & 

	# stream 2
	ffmpeg -rtsp_transport tcp -i rtsp://admin:abc12345@192.168.10.119:554/ \
		-c copy -f hls -hls_time 10 -hls_list_size 8 -hls_flags delete_segments \
		./pages/stream2.m3u8 &

	# delay to initialize
	sleep 2

	# create server
	bundle exec jekyll serve