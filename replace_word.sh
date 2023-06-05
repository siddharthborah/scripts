#!/bin/bash


if [ $# -lt 4 ] || [ $(expr $# % 2) -ne 0 ]; then
echo "Usage: $0 <template_file> <output_file> <placeholder_1> <value_1> [<placeholder_2> <value_2> ...]"
exit 1
fi



template_file=$1

# Get the path of the output file
output_file=$2
# Get the placeholders and their values
placeholders=("${@:3}")

# Create a new file with the replaced placeholders
cat $template_file > $output_file


# echo template file $template_file $output_file $placeholders
# Loop through the placeholders and their values
for ((i = 0; i < ${#placeholders[@]}; i+=2)); do
# Replace the placeholder with its valueecho  "test 1";
sed -i "" "s/${placeholders[$i]}/${placeholders[$i+1]}/g" $output_file;
done

# Close the output file
echo "" >> $output_file

# Print a message to the user
echo "The placeholders have been replaced successfully."



# Generate a new UUID
# new_uuid=$(uuidgen)

# Replace the "objectId" value in the JSON file with the new UUID
# sed -i "s/OBJECT_ID/$uuid/g" ./testfile/example.json