# Guide d'Utilisation - Calculateur ROI ARGOS

## Utilisation Offline sur Tablette

### Méthode 1 : Utilisation Simple (Recommandée)

**Étape 1 : Télécharger le fichier**
1. Allez sur votre repository GitHub : `https://github.com/jbcholat/Calculateur-ARGOS`
2. Cliquez sur le fichier `index.html`
3. Cliquez sur le bouton "Raw" ou "Télécharger"
4. Sauvegardez le fichier sur votre tablette

**Étape 2 : Ouvrir sur la tablette**
1. Localisez le fichier `index.html` dans vos téléchargements
2. Double-cliquez ou appuyez sur le fichier
3. Sélectionnez votre navigateur (Chrome, Safari, Edge, Firefox)
4. Le calculateur s'affiche immédiatement !

**⚠️ Important pour utilisation OFFLINE**
- À la première ouverture, le fichier télécharge les bibliothèques nécessaires (React, Tailwind)
- **Assurez-vous d'avoir une connexion internet lors de la PREMIÈRE utilisation**
- Après le premier chargement, ces bibliothèques sont mises en cache
- Ensuite, vous pouvez utiliser le calculateur **complètement offline**

### Méthode 2 : Version Totalement Offline (Avancée)

Si vous avez besoin d'une version qui fonctionne **sans aucune connexion internet** (même la première fois), je peux créer une version avec toutes les bibliothèques incluses localement. Dites-le moi si nécessaire.

---

## Utilisation du Calculateur

### Panneau Gauche - Paramètres Globaux

1. **Nombre total de pompes** : Entrez le nombre total de pompes du site
2. **Prix Argos par pompe** : Coût annuel du service Argos par pompe (€)
3. **Pourcentage de détection** : Efficacité de détection des pannes (généralement 70%)

### Colonnes de Droite - Catégories d'Équipement

Pour chaque catégorie (Outils Standards, Outils Goulot, Outils Batch) :

**Bloc de couleur** : Affiche le type d'équipement et sa distribution
- Outils Standards : 60% des pompes (bleu/cyan)
- Outils Goulot : 20% des pompes (rouge)
- Outils Batch : 20% des pompes (orange)

**Paramètres d'entrée** :
- **Taux de panne** : Pourcentage annuel de pannes (%)
- **Coût par panne** : Coût moyen d'une panne (€)

**Analyse des coûts annuels** (NOUVEAU) :
- **Coût annuel pannes** : Total des coûts de pannes par an
- **Coût service annuel** : Coût total du service Argos
- **Économies détection** : Économies grâce à la maintenance prédictive
- **Valeur annuelle nette** : Bénéfice net (vert si positif, rouge si négatif)

**ROI** : Retour sur investissement avec code couleur
- 🔴 Rouge : ROI négatif
- 🟠 Orange : ROI faible (0-15%)
- 🟢 Vert : ROI élevé (>15%)

---

## Conseils d'Utilisation

### Sur Tablette iPad/iOS
1. Téléchargez le fichier via Safari
2. Le fichier apparaît dans l'app "Fichiers"
3. Tapez sur le fichier pour l'ouvrir dans Safari
4. Pour un accès rapide : ajoutez la page à l'écran d'accueil
   - Tapez le bouton "Partager"
   - Sélectionnez "Sur l'écran d'accueil"

### Sur Tablette Android
1. Téléchargez le fichier via Chrome
2. Le fichier apparaît dans "Téléchargements"
3. Tapez sur le fichier pour l'ouvrir dans Chrome
4. Pour un accès rapide : ajoutez aux favoris Chrome

### Mode Plein Écran
- **Chrome** : Menu → "Ajouter à l'écran d'accueil"
- **Safari** : Bouton Partager → "Ajouter à l'écran d'accueil"
- Cela crée une icône qui lance le calculateur en mode plein écran

---

## Présentation Client

### Mode Paysage Recommandé
Le calculateur est optimisé pour l'affichage en mode paysage (horizontal).

### Démonstration Interactive
1. Commencez avec les valeurs par défaut
2. Modifiez les paramètres en temps réel pour montrer l'impact
3. Les calculs se mettent à jour instantanément
4. Utilisez les différents scénarios (conservative, optimiste, réaliste)

### Scénarios Suggérés

**Scénario 1 : Client Conservateur**
- Taux de panne faibles
- Coûts de panne modérés
- Détection à 60%

**Scénario 2 : Client Standard**
- Valeurs par défaut (déjà configurées)

**Scénario 3 : Client avec Équipements Critiques**
- Augmenter les coûts par panne pour outils goulot
- Détection à 80%
- Montrer le ROI élevé

---

## Dépannage

### Le calculateur ne s'affiche pas
- Vérifiez que vous avez une connexion internet (première utilisation)
- Essayez un autre navigateur (Chrome recommandé)
- Videz le cache du navigateur et réessayez

### Les champs de saisie perdent le focus
- Ce bug a été corrigé dans la version 7
- Si le problème persiste, rechargez la page

### Affichage trop petit sur tablette
- Utilisez le zoom du navigateur (pinch to zoom)
- Le design est responsive et s'adapte automatiquement

---

## Mise à Jour

Pour obtenir la dernière version :
1. Retournez sur GitHub
2. Téléchargez à nouveau le fichier `index.html`
3. Remplacez l'ancien fichier sur votre tablette

---

## Support Technique

Pour toute question ou problème :
- Consultez le fichier README.md sur GitHub
- Ouvrez une "issue" sur le repository GitHub
- Contactez l'équipe Digital Services ARGOS

---

## Version

**Version actuelle** : 7.0
**Dernière mise à jour** : Octobre 2025

**Fonctionnalités Version 7** :
- ✅ Correction du bug de perte de focus dans les champs de saisie
- ✅ Ajout de l'analyse des coûts annuels détaillée
- ✅ Rééquilibrage de l'espacement vertical
- ✅ Interface en français
- ✅ Mode offline après première utilisation
