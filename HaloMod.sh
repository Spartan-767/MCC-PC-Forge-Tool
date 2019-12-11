#!/bin/bash
clear


#### Directory Checker ####
createdir()
{
     if [ ! -d $1 ]
          then
          mkdir -p $1
          echo "Directories Created"
          clear
     fi
}


#### Path Configuration ####
Settings()
{
printf "Please enter path to target directories:\n"
printf "Set the path to the folder labeled Halo The Master Chief Collection"
read -r -p 'Halo MCC Path under steamapps: ' GameDir
     if [ ! -d "$GameDir/ModFiles" ]; then
          printf "Checking for Mod Folders ..."
          sleep 2
          createdir $GameDir/ModFiles
          createdir $GameDir/ModFiles/Original
          createdir $GameDir/ModFiles/Mods
          cp -r Mods $GameDir/ModFiles
          sleep 2

     else
          printf "Modify File Paths(y/n): \n"
          while true; do
               read -r -p "Choice: " Option3

               if [[ $Option3 == y || $Option3 == Y ]]; then
                    clear
                    printf "Please enter path to target directories:\n"
	            read -r -p 'Original Halo Backup Path: ' Orig
	            read -r -p 'Modified Halo Files Path: ' Mods
	            read -r -p 'Halo MCC Path under steamapps: ' GameDir
	            sleep 2
	            clear
                    printf "Confirm these settings(Y/N)\n"
                    echo "Halo Backup Path: $Orig "
                    echo "Halo Mod Path: $Mod"
                    echo "Halo MCC Game Path: $GameDir"

               elif [[ $Option3 == n || $Option3 == N ]]; then
                    clear
                    printf "Exiting ... "
                    break
                    sys.exit

               else
                    clear
                    printf "Error Invalid Input, please try again\n"
                    sleep 1
                    clear

               fi


          done
     clear
     fi
}

#### Menu ####
Menu()
{
printf "     Halo Mod Switch V0.1\n"
printf " Coded by Allistar from STARSEC\n"
printf " --------------------------------\n"
printf "  01 - Switch Mod On/Off\n "
printf " 02 - Path Settings\n "
printf " 03 - Update Tool\n "
printf " 04 - Exit\n "
}


while true; do
     Menu
     read -r -p $"Option: " Option
     if [[ $Option == 1 || $Option == 01 ]]; then
          printf " 01 - Activate Forge"
          printf " 02 - Deactivate Forge"
          printf " 03 - Exit"
          while true; do
          read -r -p $"Option: " Option
          if [[ $Option == 1 || $Option == 01 ]]; then
               cp $GameDir/ModFiles/Mods/MCC-WindowsNoEditor.pak $GameDir/MCC/Content/Paks
               cp $GameDir/ModFiles/Mods/forge_halo.map $GameDir/haloreach/maps
               break

          elif [[ $Option == 2 || $Option == 02 ]]; then
               clear
               cp $GameDir/ModFiles/Original/MCC-WindowsNoEditor.pak $GameDir/MCC/Content/Paks
               cp $GameDir/ModFiles/Original/forge_halo.map $GameDir/haloreach/maps
               break
               sys.exit

          elif [[ $Option == 3 || $Option == 03 ]]; then
               printf "Exiting"
               sys.exit
               sleep 2
               clear

          else
               clear
               printf "Error Invalid Input, please try again\n"
               sleep 1
               clear

          fi


     done


     elif [[ $Option == 2 || $Option == 02 ]]; then
          clear
          Settings
          break

     elif [[ $Option == 3 || $Option == 03 ]]; then
          git clone github.com

     elif [[ $Option == 4 || $Option == 04 ]]; then
          printf "Exiting"

     else
          clear
          printf "Error Invalid Input, please try again\n"
          sleep 1
          clear

     fi


done


