# Utiliser l'image Node.js officielle comme base
FROM node:20

# Définir le répertoire de travail à /app
WORKDIR /app

# Copier les fichiers package.json et package-lock.json (si vous utilisez npm)
COPY package*.json ./

# Installer les dépendances de l'application
RUN npm install --production

# Copier tout le reste du projet dans l'image Docker
COPY . .

# Exposer le port sur lequel Strapi va tourner (par défaut 1337)
EXPOSE 1337

# Définir la commande à exécuter lorsque le conteneur démarre
CMD ["npm", "start"]
