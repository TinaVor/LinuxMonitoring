#!/bin/bash

function generate_method {
	local method=$( shuf -e GET POST PUT PATCH DELETE -n 1)
	local route=$( shuf -e /server_id.html /project_status.html /student_id.html /student_profile.html /project_in.html /project_fail.html /level.html /peer_to_peer_points.html /coins.html /activities.html /dashboard.html /deadline.html /progress.html /calendar.html -n 1)
  local protocol=$( shuf -e HTTP/1.0 HTTP/1.1 HTTP/2 -n 1 )
	echo "$method $route $protocol"
}
