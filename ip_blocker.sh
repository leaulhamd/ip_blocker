#!/bin/bash

# Function to display banner
show_banner() {
    echo "============================="
    echo "      IP Blocker Tool       "
    echo "         by Moeen           "
    echo "============================="
    echo " Secure your system from threats"
    echo
}

# Function to block IP addresses
block_ips() {
    echo "Enter IP address(es) or range(s) to block (comma-separated):"
    read -p "Input: " ip_list

    IFS=',' read -ra ADDR <<< "$ip_list"
    report_file="$(dirname "$0")/ip_block_report.log"
    echo "Blocking the following IPs or ranges:" > "$report_file"

    for ip in "${ADDR[@]}"; do
        command="sudo iptables -A INPUT -s $ip -j DROP"
        echo -e "\e[1;31m$command\e[0m"  # Highlight the command in red
        eval $command
        echo -e "\e[1;32m$ip blocked.\e[0m" | tee -a "$report_file"  # Highlight the message in green
    done

    echo "IPs blocked successfully and logged to $report_file"

    echo -e "\n1. Show All Blocked IPs\n2. Block Again\n3. Exit"
    read -p "Choose an option: " choice
    case $choice in
        1) show_blocked_ips ;;
        2) block_ips ;;
        3) exit 0 ;;
        *) echo "Invalid choice. Exiting."; exit 1 ;;
    esac
}

# Function to show all blocked IPs
show_blocked_ips() {
    echo "Currently blocked IPs:" 
    sudo iptables -L INPUT -v -n | grep DROP

    echo -e "\n1. Block Again\n2. Exit"
    read -p "Choose an option: " choice
    case $choice in
        1) block_ips ;;
        2) exit 0 ;;
        *) echo "Invalid choice. Exiting."; exit 1 ;;
    esac
}

# Main function
main() {
    show_banner
    block_ips
}

# Run the script
main
