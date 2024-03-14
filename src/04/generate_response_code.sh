#!/bin/bash

function generate_response_code {
  # 200: OK response code - the request has succeeded

  # 201: The request has been fulfiled and resulted in a new resource being created

  # 400: Bad request - the request cannot be fulfilled due to bad syntax

  # 401: Unauthorized - when authentication is possible but has failed

  # 403: Forbidden - error code for user not authorized to perform the
    # operation or the resource is unavailable for some reason

  # 404: Not found - the requested resource could not be found
    # but may be available again in the future
  
  # 500: Internal server error - a generic error message, given
    # when no more specific message is suitable
  
  # 501: Not implemented - the server either does not recognize
    # the request method or it lacks the ability to fulfill the request
  
  # 502: Bad gateway - the server was acting as a gateway or proxy and
    # received an invalid response from the upstream server
   
  # 503: Service inavailable - the server is currently unavailable.
    # The server is not ready to handle the request. Common causes
    # are a server that is down for maintenance or that is overloaded.
  
	local code=""
	local ind_code=$( shuf -i 0-9 -n 1 )
	case $ind_code in
    0) response_code="503" ;;
		1) response_code="200" ;;
		2) response_code="201" ;;
		3) response_code="400" ;;
		4) response_code="401" ;;
		5) response_code="403" ;;
		6) response_code="404" ;;
		7) response_code="500" ;;
		8) response_code="501" ;;
		9) response_code="502" ;;
	esac
	echo $response_code

}
