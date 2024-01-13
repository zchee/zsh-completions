#!/usr/bin/env bash
set -euo pipefail

#   up         Connect to Tailscale, logging in if needed
#   down       Disconnect from Tailscale
#   set        Change specified preferences
#   login      Log in to a Tailscale account
#   logout     Disconnect from Tailscale and expire current node key
#   switch     Switches to a different Tailscale account
#   configure  [ALPHA] Configure the host to enable more Tailscale features
#   netcheck   Print an analysis of local network conditions
#   ip         Show Tailscale IP addresses
#   status     Show state of tailscaled and its connections
#   ping       Ping a host at the Tailscale layer, see how it routed
#   nc         Connect to a port on a host, connected to stdin/stdout
#   ssh        SSH to a Tailscale machine
#   funnel     Serve content and local servers on the internet
#   serve      Serve content and local servers on your tailnet
#   version    Print Tailscale version
#   web        Run a web server for controlling Tailscale
#   file       Send or receive files
#   bugreport  Print a shareable identifier to help diagnose issues
#   cert       Get TLS certs
#   lock       Manage tailnet lock
#   licenses   Get open source license information
#   exit-node  Show machines on your tailnet configured as exit nodes
#   update     [BETA] Update Tailscale to the latest/different version
#   whois      Show the machine and user associated with a Tailscale IP (v4 or v6)

# for c in '' up down set login logout switch configure 'configure kubeconfig' netcheck ip status ping nc ssh funnel 'funnel status' 'funnel reset' serve 'serve status' 'serve reset' version web file 'file cp' 'file get' cert lock 'lock init' 'lock status' 'lock add' 'lock remove' 'lock sign' 'lock disable' 'lock disablement-kdf' 'lock log' 'lock local-disable' 'lock revoke-keys' licenses exit-node 'exit-node list' whois; do ( tailscale $c --help 2>&1 && printf "\n-----------------------------------------------------------------------------\n\n" ) | tee -a _tailscale; done

tailscale_cmd='/Applications/Tailscale.app/Contents/MacOS/Tailscale'

for c in '' up down set login logout switch; do ( $tailscale_cmd $c --help 2>&1 && printf "\n-----------------------------------------------------------------------------\n\n" ) | tee -a _tailscale; done

# configure
( $tailscale_cmd configure --help 2>&1 && printf "\n-----------------------------------------------------------------------------\n" ) | tee -a _tailscale
( $tailscale_cmd configure kubeconfig --help 2>&1 && printf "\n-----------------------------------------------------------------------------\n" ) | tee -a _tailscale

for c in netcheck ip status ping nc ssh; do ( $tailscale_cmd $c --help 2>&1 && printf "\n-----------------------------------------------------------------------------\n\n" ) | tee -a _tailscale; done

# funnel
( $tailscale_cmd funnel --help 2>&1 && printf "\n-----------------------------------------------------------------------------\n\n" ) | tee -a _tailscale
( $tailscale_cmd funnel status --help 2>&1 && printf "\n-----------------------------------------------------------------------------\n\n" ) | tee -a _tailscale
( $tailscale_cmd funnel reset --help 2>&1 && printf "\n-----------------------------------------------------------------------------\n\n" ) | tee -a _tailscale

# serve
( $tailscale_cmd serve --help 2>&1 && printf "\n-----------------------------------------------------------------------------\n\n" ) | tee -a _tailscale
( $tailscale_cmd serve status --help 2>&1 && printf "\n-----------------------------------------------------------------------------\n\n" ) | tee -a _tailscale
( $tailscale_cmd serve reset --help 2>&1 && printf "\n-----------------------------------------------------------------------------\n\n" ) | tee -a _tailscale

for c in version web; do ( $tailscale_cmd $c --help 2>&1 && printf "\n-----------------------------------------------------------------------------\n\n" ) | tee -a _tailscale; done

# file
( $tailscale_cmd file --help 2>&1 && printf "\n-----------------------------------------------------------------------------\n\n" ) | tee -a _tailscale
( $tailscale_cmd file cp --help 2>&1 && printf "\n-----------------------------------------------------------------------------\n\n" ) | tee -a _tailscale
( $tailscale_cmd file get --help 2>&1 && printf "\n-----------------------------------------------------------------------------\n\n" ) | tee -a _tailscale

( $tailscale_cmd cert --help 2>&1 && printf "\n-----------------------------------------------------------------------------\n\n" ) | tee -a _tailscale

# lock
( $tailscale_cmd lock --help 2>&1 && printf "\n-----------------------------------------------------------------------------\n" ) | tee -a _tailscale
for c in init status add remove sign disable disablement-kdf log local-disable revoke-keys; do ( $tailscale_cmd lock $c --help 2>&1 && printf "\n-----------------------------------------------------------------------------\n" ) | tee -a _tailscale; done

( $tailscale_cmd licenses --help 2>&1 && printf "\n-----------------------------------------------------------------------------\n" ) | tee -a _tailscale

# exit-node
( $tailscale_cmd exit-node --help 2>&1 && printf "\n-----------------------------------------------------------------------------\n\n" ) | tee -a _tailscale
( $tailscale_cmd exit-node list --help 2>&1 && printf "\n-----------------------------------------------------------------------------\n\n" ) | tee -a _tailscale

( $tailscale_cmd whois --help 2>&1 && printf "\n-----------------------------------------------------------------------------\n" ) | tee -a _tailscale
