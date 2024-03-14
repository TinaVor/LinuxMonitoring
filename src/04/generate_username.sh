#!/bin/bash

function generate_username {

  local username=$( shuf -e user0a user1b user2c user3d user4e user5f user6g user7h -n 1)
	echo $username
}