#!/bin/bash

# Mot de passe par défaut
PASSWORD="Cybercap001@"

for i in {1..5}
do
    USERNAME="user$i"
    # Création de l'utilisateur avec répertoire home et mot de passe chiffré
    sudo useradd -m -p $(openssl passwd -1 $PASSWORD) $USERNAME
    echo "Utilisateur $USERNAME créé avec succès."
done
