#!/bin/bash

# Lecture du fichier CSV
filename="/home/pierre/Shell_Userlist.csv"

while IFS="," read -r id prenom nom password role
    do
    # Vérification du rôle de l'utilisateur
    if [ "$role" = "User" ]; then
        # Création d'un utilisateur standard
        sudo useradd -m -p "$(openssl passwd -1 "$password")" "$prenom"
    elif [ "$role" = "Admin" ]; then
        # Création d'un utilisateur avec les droits sudo
        sudo useradd -m -p "$(openssl passwd -1 "$password")" "$prenom"
        sudo usermod -aG sudo "$prenom"
    fi
done < "$filename"
