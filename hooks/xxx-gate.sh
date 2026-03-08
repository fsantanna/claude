#!/bin/bash
if test -f /tmp/claude-xxx-allow; then
    exit 0
else
    echo "Edit blocked: say 'xxx' first" >&2
    exit 2
fi
