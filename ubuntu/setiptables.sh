#!/usr/bin/env sh
setFireWall () {
    # Flush all tables
    sudo iptables -F
    sudo iptables -X

    sudo ip6tables -F
    sudo ip6tables -X

    # Zero out all counters
    sudo iptables -Z

    sudo ip6tables -Z

    # Allow all incoming/outcoming/forwarding
    sudo iptables -P INPUT ACCEPT
    sudo iptables -P FORWARD ACCEPT
    sudo iptables -P OUTPUT ACCEPT

    sudo ip6tables -P INPUT ACCEPT
    sudo ip6tables -P FORWARD ACCEPT
    sudo ip6tables -P OUTPUT ACCEPT

    # Loopback interface
    sudo iptables -A INPUT -i lo -j ACCEPT

    sudo ip6tables -A INPUT -i lo -j ACCEPT

    # ICMP (ping)
    sudo iptables -A INPUT -p icmp -j ACCEPT

    sudo ip6tables -A INPUT -p ipv6-icmp -j ACCEPT

    # SSH
    sudo iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 22 -j ACCEPT

    sudo ip6tables -A INPUT -m state --state NEW -m tcp -p tcp --dport 22 -j ACCEPT

    # HTTP / HTTPS# Allow HTTP and HTTPS traffic
    sudo iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 80 -j ACCEPT
    sudo iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 443 -j ACCEPT

    sudo ip6tables -A INPUT -m state --state NEW -m tcp -p tcp --dport 80 -j ACCEPT
    sudo ip6tables -A INPUT -m state --state NEW -m tcp -p tcp --dport 443 -j ACCEPT

    # Also allow trafic on port 3000 because I like port 3000... react
    sudo iptables -A INPUT -m state --state NEW -m tcp -p tcp --dport 3000 -j ACCEPT

    sudo ip6tables -A INPUT -m state --state NEW -m tcp -p tcp --dport 3000 -j ACCEPT

    # End echo
    echo "Firewall configuration imported."
}

setNAT () {
    # Flush
    sudo iptables -t nat -F
    sudo iptables -t nat -X

    sudo ip6tables -t nat -F
    sudo ip6tables -t nat -X

    # Add redirections #################
    # 80 -> 3000 for react apps live
    sudo iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 3000

    sudo ip6tables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 3000

    echo "NAT configuration imported."
}

WARNME="Are you sure you want to \033[0;31mreconfigure all iptables\033[0m (y)?"
echo "\033[0;31mBe very cautious, this will erase all iptables, and make your firewall insecure. I hope you know what you are doing.\033[0m"
read -p "$(echo $WARNME) " choice

case "$choice" in
    y|Y )
        setFireWall;
        setNAT;
        ;;

    * )
        echo "Aborted";
        ;;
esac
