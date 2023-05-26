#!/bin/bash

# Chemin du dossier Backup
backup_dir="Backup"

# Chemin du fichier de logs
log_file="/var/log/auth.log"

# Obtenir le nombre de connexions à votre session
connection_count=$(grep "session opened for user" "$log_file" | wc -l)

# Date et heure actuelles
current_date=$(date +"%d-%m-%Y-%H:%M")

# Nom du fichier avec le nombre de connexions et la date/heure actuelles
file_name="number_connection-$current_date"

# Chemin complet du fichier
file_path="$backup_dir/$file_name"

# Écrire le nombre de connexions dans le fichier
echo "$connection_count" > "$file_path"

# Archiver le fichier avec tar
tar -czvf "$file_path.tar.gz" "$file_path"

# Déplacer le fichier archivé dans le dossier Backup
mv "$file_path.tar.gz" "$backup_dir/"
