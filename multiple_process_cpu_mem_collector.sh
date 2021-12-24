#!/bin/bash

function multiple_process_cpu_mem_collector(){
     process_name="firefox"
     time_interval=1
     iterations=10
     i=1
     echo "cpu_usage,mem_usage"
     while (( ${i} <= ${iterations} ))
     do
      cpu_usage=`ps aux | grep ${process_name} | awk '{print $3}' | paste -s -d '+' | bc`
      mem_usage=`ps aux | grep ${process_name} | awk '{print $4}' | paste -s -d '+' | bc`
      echo "${cpu_usage},${mem_usage}" 
      sleep $time_interval
      ((i++))
     done
}

multiple_process_cpu_mem_collector
