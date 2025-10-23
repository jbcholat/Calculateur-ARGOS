# Configuration Offline - Guide Rapide

Ce guide explique comment créer une version 100% offline du calculateur ROI ARGOS.

## Méthode Rapide : Script Automatique

### Prérequis
- Un ordinateur avec accès internet
- `curl` installé (disponible par défaut sur Mac/Linux)
- Bash shell

### Étapes

1. **Cloner ou télécharger le repository**
   ```bash
   git clone https://github.com/jbcholat/Calculateur-ARGOS.git
   cd Calculateur-ARGOS
   ```

2. **Exécuter le script**
   ```bash
   chmod +x create-fully-offline-version.sh
   ./create-fully-offline-version.sh
   ```

3. **Résultat**
   Le script crée automatiquement :
   - `libs/` - Dossier avec les bibliothèques téléchargées
   - `index-fully-offline.html` - Fichier HTML autonome complet

4. **Transférer sur tablette**
   - Copiez `index-fully-offline.html` sur votre tablette
   - Ouvrez-le dans n'importe quel navigateur
   - Fonctionne sans aucune connexion internet !

## Méthode Manuelle

Si vous préférez tout faire manuellement :

### 1. Télécharger les bibliothèques

Téléchargez ces 3 fichiers sur votre ordinateur :

```bash
# Créer le dossier
mkdir libs
cd libs

# Télécharger React
curl -o react.production.min.js https://unpkg.com/react@18/umd/react.production.min.js

# Télécharger ReactDOM
curl -o react-dom.production.min.js https://unpkg.com/react-dom@18/umd/react-dom.production.min.js

# Télécharger Babel
curl -o babel.min.js https://unpkg.com/@babel/standalone/babel.min.js

cd ..
```

### 2. Modifier index-offline.html

Ouvrez `index-offline.html` et trouvez ces lignes (vers la ligne 366) :

```html
<script crossorigin src="https://unpkg.com/react@18/umd/react.production.min.js"></script>
<script crossorigin src="https://unpkg.com/react-dom@18/umd/react-dom.production.min.js"></script>
<script src="https://unpkg.com/@babel/standalone/babel.min.js"></script>
```

Remplacez-les par :

```html
<script src="libs/react.production.min.js"></script>
<script src="libs/react-dom.production.min.js"></script>
<script src="libs/babel.min.js"></script>
```

### 3. Structure finale

Votre structure de dossier devrait ressembler à :

```
Calculateur-ARGOS/
├── index-offline.html
└── libs/
    ├── react.production.min.js
    ├── react-dom.production.min.js
    └── babel.min.js
```

### 4. Transférer sur tablette

Transférez **tout le dossier** (y compris `libs/`) sur votre tablette et ouvrez `index-offline.html`.

## Vérification

Pour vérifier que tout fonctionne :

1. Activez le mode avion sur votre appareil
2. Ouvrez le fichier HTML
3. Si le calculateur s'affiche et fonctionne, c'est parfait ! ✅

## Taille des fichiers

- `react.production.min.js` : ~6 KB
- `react-dom.production.min.js` : ~130 KB
- `babel.min.js` : ~1.3 MB
- **Total** : ~1.4 MB

C'est très léger pour une application moderne !

## Dépannage

### Le script ne fonctionne pas
- Vérifiez que `curl` est installé : `curl --version`
- Vérifiez votre connexion internet
- Essayez d'exécuter les commandes `curl` manuellement

### Le calculateur ne s'affiche pas
- Vérifiez que les 3 fichiers sont dans le dossier `libs/`
- Vérifiez que les chemins dans le HTML sont corrects
- Ouvrez la console du navigateur (F12) pour voir les erreurs

### Erreur "React is not defined"
- Le fichier `react.production.min.js` n'est pas chargé correctement
- Vérifiez le chemin dans le HTML

## Support

Pour toute question :
- Consultez le [GUIDE_UTILISATION.md](GUIDE_UTILISATION.md)
- Ouvrez une issue sur GitHub
- Contactez l'équipe ARGOS Digital Services

---

**Note** : Cette méthode fonctionne pour toutes les plateformes (Windows, Mac, Linux, iOS, Android) et tous les navigateurs modernes (Chrome, Safari, Firefox, Edge).
