# Rapport Semaine 6 - mouadln6

## Mission 1 : Manipulation de fichiers texte
La commande `grep "erreur" journal-sys.log` a permis de filtrer les lignes suivantes :
> 2026-05-20 09:15 - erreur: échec de connexion à la base de données
> 2026-05-20 10:45 - erreur: espace disque insuffisant sur /var/www
> 2026-05-20 13:02 - erreur: permission refusée pour le fichier wp-config.php

La commande utilisée pour trouver et lister les fichiers log dans le dossier `/var/log` était :
`sudo find /var/log -type f -name "*.log" > liste-logs.md`

## Mission 2 : Processus et services
Les 3 processus consommant le plus de CPU (identifiés avec la commande `ps aux --sort=-%cpu | head -n 4`) étaient :
1. `/snap/firefox/8306/usr/lib/firefox/firefox` (PID: 21856, %CPU: 4.6%)
2. `/usr/bin/snap userd` (PID: 20581, %CPU: 3.0%)
3. `/snap/firefox/.../firefox -contentproc` (PID: 23037, %CPU: 2.8%)

**Analyse htop :**
- **Processus le plus gourmand :** htop
- **PID :** 26081
- **Utilisateur :** mouadln6
- **% CPU :** 1.9%

**Gestion du service SSH :**
1. **Statut initial :** Vérifié avec `systemctl status ssh`, le service n'était pas trouvé.
2. **Installation :** Effectuée avec succès via `sudo apt update` et `sudo apt install openssh-server`.
3. **Démarrage :** Vérifié avec `systemctl status ssh`, le statut indiquait `active (running)`.
4. **Arrêt :** Le service a été arrêté avec `sudo systemctl stop ssh`, passant au statut `inactive (dead)`.

## Mission 3 : Réseau depuis Linux
- **Adresse IP de la VM :** `10.0.2.15` (trouvée sous l'interface `enp0s3` via la commande `ip a`).
- **Type d'adresse :** Il s'agit d'une adresse IP **privée**. *(Note : la commande `curl ifconfig.me` pour afficher l'IP publique a échoué car le paquet `curl` n'est pas installé sur la machine).*
- **Passerelle par défaut :** Pour accéder à Internet, la VM passe par la passerelle `10.0.2.2` (identifiée avec `ip route show`).
- **Connectivité :** Les tests `ping` vers `8.8.8.8` et `google.com` (résolu avec l'IP 142.250.69.78) ont réussi avec 4 paquets transmis et 0% de perte.
