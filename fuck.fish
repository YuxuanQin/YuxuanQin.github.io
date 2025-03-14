
# Check if the user provided a folder path
if test (count $argv) -ne 1
    echo "Usage: delete_html.fish <folder_path>"
    exit 1
end

# Assign the provided folder path to a variable
set folder_path $argv[1]

# Check if the folder exists
if not test -d $folder_path
    echo "Error: The specified folder does not exist."
    exit 1
end

# Recursively find and delete all .html files in the folder
find $folder_path -type f -name "*.html" -delete

echo "All .html files in $folder_path have been deleted."
