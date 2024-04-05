# Projet de TP sur Azure

Ce projet est réalisé dans le cadre d'un TP sur Microsoft Azure. Pour suivre ce TP, vous aurez besoin d'une machine virtuelle Azure, de vous connecter à cette machine et d'installer Azure CLI et Terraform. Voici les étapes à suivre :

## Prérequis

- Un compte Azure actif avec des droits suffisants pour créer des ressources.
- Accès à une machine virtuelle Azure.

## Étapes à suivre

1. **Création de la machine virtuelle Azure :**
   - Connectez-vous au portail Azure.
   - Créez une machine virtuelle Azure en fonction de vos besoins.

2. **Connexion à la machine virtuelle Azure :**
   - Utilisez les informations d'identification pour vous connecter à la machine virtuelle créée.

3. **Installation de Azure CLI :**
   - Sur la machine virtuelle, installez Azure CLI en suivant les instructions fournies par Microsoft [ici](https://learn.microsoft.com/fr-fr/cli/azure/install-azure-cli-linux?pivots=apt).

4. **Installation de Terraform :**
   - Sur la machine virtuelle, installez Terraform en suivant les instructions fournies sur le site officiel de Terraform [ici](https://learn.hashicorp.com/tutorials/terraform/install-cli).

5. **Génération de la clé SSH :**
   - Pour utiliser SSH avec votre serveur, générez une clé SSH en exécutant la commande suivante :
     ```bash
     ssh-keygen -t rsa
     ```
     Il vous sera demandé de spécifier un emplacement pour sauvegarder la clé. Vous pouvez simplement appuyer sur "Entrée" pour utiliser l'emplacement par défaut.

## Configuration du serveur

Une fois les outils installés, vous pouvez procéder à la configuration de votre serveur Azure.

1. **Connexion à Azure :**
   - Utilisez la commande suivante pour vous connecter à votre compte Azure :
     ```bash
     az login
     ```

2. **Récupération de l'ID de l'abonnement :**
   - Pour obtenir l'ID de votre abonnement Azure, exécutez la commande suivante :
     ```bash
     az account list --query "[].{name:name, subscriptionId:id}"
     ```

3. **Création d'un Service Principal :**
   - Utilisez la commande ci-dessous pour créer un "Service Principal" et attribuer le rôle "Contributor" :
     ```bash
     az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/<VotreIDAbonnement>"
     ```
     Assurez-vous de remplacer `<VotreIDAbonnement>` par l'ID de votre abonnement retourné par la commande précédente.

Avec ces étapes, votre serveur Terraform est prêt à être utilisé.

# Déploiement du projet

Une fois votre environnement configuré, vous pouvez déployer le projet en suivant ces étapes simples :

1. **Initialisation de Terraform :**
   - Initialisez Terraform dans le répertoire du projet en exécutant la commande suivante :
     ```bash
     terraform init
     ```

2. **Connexion à Azure :**
   - Connectez-vous à votre compte Azure en utilisant la commande suivante :
     ```bash
     az login
     ```

3. **Planification du déploiement :**
   - Planifiez le déploiement pour vérifier les changements à appliquer en exécutant la commande :
     ```bash
     terraform plan
     ```

4. **Application des changements :**
   - Appliquez les changements pour créer les ressources spécifiées dans le projet en exécutant la commande :
     ```bash
     terraform apply
     ```

Après le déploiement, vous pouvez vérifier dans le portail Azure que les ressources ont été créées avec succès. Vous pouvez également récupérer l'adresse IP publique de la nouvelle instance pour vous connecter via SSH en utilisant la commande :
```bash
ssh adminuser@<VotreAdresseIP>
