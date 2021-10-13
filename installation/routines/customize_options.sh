#!/usr/bin/env bash

_option_static_ip() {
  # ENABLE_STATIC_IP
  CURRENT_IP_ADDRESS=$(hostname -I)
  echo "Would you like to set a static IP (will be ${CURRENT_IP_ADDRESS})?
It'll save a lot of start up time. This can be changed later.
[Y/n] " 1>&3
  read -rp "ENABLE_STATIC_IP" response
  case "$response" in
    [nN][oO]|[nN])
      ENABLE_STATIC_IP=false
      ;;
    *)
      ;;
  esac
  echo "ENABLE_STATIC_IP=${ENABLE_STATIC_IP}"
}

_option_ipv6() {
  # DISABLE_IPv6
  echo "Do you want to disable IPv6? [Y/n] " 1>&3
  read -rp "DISABLE_IPv6" response
  case "$response" in
    [nN][oO]|[nN])
      DISABLE_IPv6=false
      ;;
    *)
      ;;
  esac
  echo "DISABLE_IPv6=${DISABLE_IPv6}"
}

_option_bluetooth() {
  # DISABLE_BLUETOOTH
  echo "Do you want to disable Bluethooth?
We recommend to turn off Bluetooth to save energy and booting time.
[Y/n] " 1>&3
  read -rp "DISABLE_BLUETOOTH" response
  case "$response" in
    [nN][oO]|[nN])
      DISABLE_BLUETOOTH=false
      ;;
    *)
      ;;
  esac
  echo "DISABLE_BLUETOOTH=${DISABLE_BLUETOOTH}"
}

_option_bootscreen() {
  # DISABLE_BOOT_SCREEN
  echo "Do you want to disable the Rainbow boot screen?
We recommend to turn off it off booting time.
[Y/n] " 1>&3
  read -rp "DISABLE_BOOT_SCREEN" response
  case "$response" in
    [nN][oO]|[nN])
      DISABLE_BOOT_SCREEN=false
      ;;
    *)
      ;;
  esac
  echo "DISABLE_BOOT_SCREEN=${DISABLE_BOOT_SCREEN}"
}

_option_bootlogs() {
  # DISABLE_BOOT_LOGS_PRINT
  echo "Do you want to disable the boot logs?
We recommend to turn off it off booting time. You will have to
enable it if you need to debug the booting routine for some reason.
[Y/n] " 1>&3
  read -rp "DISABLE_BOOT_LOGS_PRINT" response
  case "$response" in
    [nN][oO]|[nN])
      DISABLE_BOOT_LOGS_PRINT=false
      ;;
    *)
      ;;
  esac
  echo "DISABLE_BOOT_LOGS_PRINT=${DISABLE_BOOT_LOGS_PRINT}"
}

_option_samba() {
  # ENABLE_SAMBA
  echo "Would you like to install and configure Samba for easy file transfer?
There are other ways to copy music to your RPi but Samba is the simplest
method. If you are unsure, say yes!
[Y/n] " 1>&3
  read -rp "ENABLE_SAMBA" response
  case "$response" in
    [nN][oO]|[nN])
      ENABLE_SAMBA=false
      ENABLE_KIOSK_MODE=false
      ;;
    *)
      ;;
  esac
  echo "ENABLE_SAMBA=${ENABLE_SAMBA}"
}

_option_webapp() {
  # ENABLE_WEBAPP
  echo "Would you like to install the web application?
If you don't want to use a graphical interface to manage your Phoniebox,
you don't need to install the web application.
[Y/n] " 1>&3
  read -rp "ENABLE_WEBAPP" response
  case "$response" in
    [nN][oO]|[nN])
      ENABLE_WEBAPP=false
      ENABLE_KIOSK_MODE=false
      ;;
    *)
      ;;
  esac
  echo "ENABLE_WEBAPP=${ENABLE_WEBAPP}"
}

_option_kiosk_mode() {
  # ENABLE_KIOSK_MODE
  echo "Would you like to enable the Kiosk Mode?
If you have a screen attached to your RPi, this will launch the
web application right after boot. It will only install the necessary
xserver dependencies and not the entire RPi desktop environment.
[y/N] " 1>&3
  read -rp "ENABLE_KIOSK_MODE" response
  case "$response" in
    [yY])
      ENABLE_KIOSK_MODE=true
      ;;
    *)
      ;;
  esac
  echo "ENABLE_KIOSK_MODE=${ENABLE_KIOSK_MODE}"
}

_options_update_os() {
  # UPDATE_OS
  echo "Would you like to update the operating system?
This shall be done eventually, but increases the installation time a lot.
[y/N] " 1>&3
  read -rp "UPDATE_OS" response
  case "$response" in
    [yY])
      UPDATE_OS=true
      ;;
    *)
      ;;
  esac
  echo "UPDATE_OS=${UPDATE_OS}"
}

customize_options() {
  echo "Customize Options starts"

  _option_static_ip
  _option_ipv6
  _option_bluetooth
  _option_bootscreen
  _option_bootlogs
  _option_samba
  _option_webapp
  if [ "$ENABLE_WEBAPP" = true ] ; then _option_kiosk_mode; fi
  _options_update_os

  echo "Customize Options ends"
}