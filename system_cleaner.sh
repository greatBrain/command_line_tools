#!/bin/bash
# System logs cleaner
# Mr. Fana

function clean_logs()
{
	sudo rm -rf /var/log/*
  ls /var/log/
}

clean_logs
