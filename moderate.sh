#!/bin/bash

# Check if at least one argument is provided
if [ $# -lt 1 ]; then
    echo "Usage: $0 [-1 to -9] [extra_flags...]"
    exit 1
fi

# Get the flag value
flag="$1"
shift 1  # Remove the first argument from the list

# Check if the flag is within the valid range (-1 to -9)
if [ "$flag" -ge -9 ] && [ "$flag" -le -1 ]; then
    folder_name="Exercise_$((-flag))"
    script_path="$folder_name/ex$((-flag)).sh"
    
    
    # Check if the folder and script exist
    if [ -d "$folder_name" ] && [ -f "$script_path" ]; then
        # Execute the script with additional flags
        ./"$script_path" "${@}"
    else
        echo "Folder $folder_name or script $script_path does not exist."
        exit 1
    fi
else
    echo "Invalid flag: $flag (Use -1 to -9)"
    exit 1
fi

exit 0