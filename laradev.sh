#!/bin/bash

COLOR_SERVER="\033[1;34m"
COLOR_NPM="\033[1;32m"
COLOR_QUEUE="\033[1;35m"
COLOR_SCHEDULE="\033[1;36m"
COLOR_ERROR="\033[1;31m"
COLOR_RESET="\033[0m"

run_cmd() {
  local prefix="$1"
  local color="$2"
  shift 2

  "$@" 2>&1 | while IFS= read -r line; do
    if [[ "$line" == *"error"* || "$line" == *"Error"* || "$line" == *"failed"* || "$line" == *"Failed"* ]]; then
      echo -e "${COLOR_ERROR}[$prefix] $line${COLOR_RESET}"
    else
      echo -e "${color}[$prefix]${COLOR_RESET} $line"
    fi
  done
}

RUN_SERVER=false
RUN_NPM=false
RUN_QUEUE=false
RUN_SCHEDULE=false

while [[ "$#" -gt 0 ]]; do
  case $1 in
    serve) RUN_SERVER=true ;;
    npm) RUN_NPM=true ;;
    queue) RUN_QUEUE=true ;;
    schedule) RUN_SCHEDULE=true ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
  shift
done

if ! $RUN_SERVER && ! $RUN_NPM && ! $RUN_QUEUE && ! $RUN_SCHEDULE; then
  echo "Usage: $0 [serve] [npm] [queue] [schedule]"
  echo "Please specify at least one process to run."
  exit 1
fi

PIDS=""
if $RUN_SERVER; then
  echo -e "${COLOR_SERVER}[INFO] Starting 'php artisan serve'...${COLOR_RESET}"
  run_cmd "SERVER" "$COLOR_SERVER" php artisan serve &
  PIDS="$PIDS $!"
fi

if $RUN_NPM; then
  echo -e "${COLOR_NPM}[INFO] Starting 'npm run dev'...${COLOR_RESET}"
  run_cmd "NPM" "$COLOR_NPM" npm run dev &
  PIDS="$PIDS $!"
fi

if $RUN_QUEUE; then
  echo -e "${COLOR_QUEUE}[INFO] Starting 'php artisan queue:listen'...${COLOR_RESET}"
  run_cmd "QUEUE" "$COLOR_QUEUE" php artisan queue:listen &
  PIDS="$PIDS $!"
fi

if $RUN_SCHEDULE; then
  echo -e "${COLOR_SCHEDULE}[INFO] Starting 'php artisan schedule:work'...${COLOR_RESET}"
  run_cmd "SCHEDULE" "$COLOR_SCHEDULE" php artisan schedule:work &
  PIDS="$PIDS $!"
fi

trap "kill $PIDS" EXIT

wait
