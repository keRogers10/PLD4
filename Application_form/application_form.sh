#!/bin/bash

# Function to create a form
create_form() {
    clear
    echo "Creating Application Form"
    echo "-------------------------"

    read -p "Enter National ID: " national_id
    read -p "Enter Age: " age
    read -p "Enter Residence Country: " residence_country
    read -p "Enter Birth Country: " birth_country
    read -p "Enter Phone Number: " phone_number
    read -p "Enter Email: " email
    read -p "Enter Reason for the Application: " reason
    read -p "Enter Purpose of Travel: " purpose
    read -p "Enter Destination Country: " destination
    read -p "Enter Attachments: " attachments

    echo "
    National ID:$national_id,  Age:$age,
    Residence Country:$residence_country,  Birth Country$birth_country,
    Phone Number:$phone_number,  Email:$email,
    Reason for the Application:$reason,  Purpose of Travel:$purpose,
    Destination Country:$destination,  Attachments:$attachments" >> "$file_name"
    echo "Form created successfully!"
}

# Function to view and edit the form summary
view_and_edit_form() {
    clear
    echo "View/Edit Application Form"
    echo "-------------------------"

    echo "Form Summary:"
    echo "-------------"
    cat "$file_name" | grep "$national_id"

    read -p "Do you want to edit the form? (y/n): " edit_choice
    if [ "$edit_choice" == "y" ]; then
        echo "Editing the form..."
        sed -i "/$national_id/d" "$file_name"
        create_form
    fi
}

# Main menu
while true; do
    clear
    echo "Application Form System"
    echo "-----------------------"
    echo "1. Passport Application"
    echo "2. Laissez-passer Application"
    echo "3. Visa Application"
    echo "5. Search for your application"
    echo "4. Exit"
    read -p "Enter your choice: " choice

    case $choice in
        1)
            file_name="passport_form001.txt"
            create_form
            ;;
        2)
            file_name="laissez-passer_form001.txt"
            create_form
            ;;
        3)
            file_name="Visa_form001.txt"
            create_form
            ;;
	5)
            read -p "Enter National ID to search: " search_national_id
    		grep "$search_national_id" "passport_form001.txt" "laissez-passer_form001.txt" "Visa_form001.txt";;
        4)
            echo "Exiting the application."
            exit
            ;;
        *)
            echo "Invalid choice. Please select a valid option."
            ;;
    esac

    view_and_edit_form

    read -p "Press Enter to continue..."
done

