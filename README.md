## SimSSE - Backend

Le projet SimSSE du Centre Hospitalier Universitaire (CHU) de Nantes a pour objectif de développer une application web pour la gestion de scénarios d'exercices de secours dans des Situations Sanitaires Exceptionnelles (SSE). Cette application doit permettre la génération, la gestion et la modification en temps réel des scénarios, tout en étant reliée à une nouvelle base de données PostgreSQL et au backend Strapi.

---

### Présentation du backend

Le backend de l'application SimSSE est construit avec Strapi et interagit avec une base de données PostgreSQL hébergée dans un container Docker. Il est responsable de la gestion des données et des interactions entre le frontend et la base de données, permettant la gestion des scénarios d'exercices en temps réel.

---

### Précisions sur le projet

- La base de données est hébergée et accessible à l'aide d'un container Docker.
- La documentation utilisateur est disponible sur le repository.
- La documentation développeur est disponible dans le dossier documentation_compodoc sous la forme d'une application WEB avec comme page d'accueil index.html.
- Le code est commenté, sa structure est à explorer dans la documentation.
- La base de données est une base de données relationnelle PostgreSQL exploitée par l'application backend via Strapi.

---

### Liens utiles

- **[Page GitHub du projet frontend](https://github.com/nonamgrig/SimSSE_Editor)**
- **[Page GitHub du projet backend](https://github.com/nonamgrig/SimSSE_Editor_BDD)**
- **[Guide d'installation](Documentation/installation/installation.md)**
- **[Documentation Strapi](https://strapi.io/)**

---

### Installation du backend

Clonez ce dépôt sur votre machine locale et installez les dépendances nécessaires :

```bash
git clone https://github.com/nonamgrig/SimSSE_Editor_BDD.git
cd SimSSE_Editor_BDD
npm install
```

### Lancement du backend

Le backend peut être démarré de deux manières :

#### 1. Via Node.js

Démarrez le serveur Strapi en mode développement :

```bash
npm run develop
```

Démarrage en mode production :

```bash
npm run build
npm start
```

#### 2. Via Docker

Si vous souhaitez exécuter le backend dans un container Docker, suivez ces étapes :

1. Assurez-vous que Docker est installé et en cours d'exécution.
2. Exécutez la commande suivante pour construire et exécuter le container :

```bash
docker-compose up -d
```

---

### Installation de la base de données

Le backend utilise PostgreSQL comme base de données. Pour configurer la base de données, procédez comme suit :

1. **Création du container PostgreSQL** :

   ```bash
   docker run --name strapi_postgres \
     -e POSTGRES_USER=simsse \
     -e POSTGRES_PASSWORD=simsse \
     -e POSTGRES_DB=simsse \
     -p 5434:5432 -d postgres
   ```

2. **Importation du fichier dump.sql** :

   ```bash
   docker cp dump.sql strapi_postgres:/dump.sql
   docker exec -it strapi_postgres psql -U simsse -d simsse -f /dump.sql
   ```

La base de données est maintenant opérationnelle.

---

### Accès à l'interface Strapi

Une fois le backend en cours d'exécution, vous pouvez accéder à l'interface Strapi via :

[http://localhost:1337/admin](http://localhost:1337/admin)

Dans **Settings -> Roles**, double-cliquez sur **public** et activez "Select All" pour tous les éléments afin de permettre l'accès aux données.

---

### Aide supplémentaire

Pour plus d'informations sur Strapi, vous pouvez consulter la [documentation officielle](https://strapi.io/).

