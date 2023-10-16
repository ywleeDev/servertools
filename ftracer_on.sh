#!/bin/bash

echo 0 > /sys/kernel/debug/tracing/events/enable
echo 1 > /sys/kernel/debug/tracing/events/syscalls/enable
echo 1 > tracing_on
