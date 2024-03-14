#!/bin/bash

function generate_user_agent {

	user_agent=""
	user_agent_num=$(( $RANDOM % 12 + 1 ))

	case $user_agent_num in
		1)
			# Firefox on Windows
			user_agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:107.0) Gecko/2010001 Firefox/107.0"
			;;
		2)
			# Latest Chrome on Windows 10 (Standard)
			user_agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36"
			;;
		3)
			# Opera on Windows
			user_agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 OPR/93.0.4585.21"
			;;
		4)
			# Safari (Standard)
			user_agent="Mozilla/5.0 (Macintosh; Intel Mac OS X 13_0_1) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.1 Safari/605.1.15"
			;;	
		5)
			# Internet Explorer 8, Windows XP
			user_agent="Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0)"
			;;	
		6)
			# Latest Edge on Windows 10 (Standard)
			user_agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36 Edg/107.0.1418.68"
			;;	
		7)
			# MegaIndex Crawler 2.0
			user_agent="Mozilla/5.0 (compatible; MegaIndex.ru/2.0; +http://megaindex.com/crawler)"
			;;	
		8)
			# Googlebot 2.1
			user_agent="Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)"
			;;
		9)
			# Python urllib Library 2.7
			user_agent="Python-urllib/2.7"
			;;	
		10)
			# Net tool - Google Read Aloud
			user_agent="Mozilla/5.0 (Linux; Android 7.0; SM-G930V Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36 (compatible; Google-Read-Aloud; +https://support.google.com/webmasters/answer/1061943)"
			;;
    11)
			# Mozilla  Windows
			user_agent="Mozilla/5.0 (Linux; Android 7.0; SM-G930V Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.125 Mobile Safari/537.36 (compatible; Google-Read-Aloud; +https://support.google.com/webmasters/answer/1061943)"
			;;
    12)
			# Python requests Library 2.28.2
			user_agent="python-requests/2.28.2"
			;;
	esac

	echo $user_agent
			
}