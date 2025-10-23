#!/bin/bash

# Script pour créer une version 100% offline du calculateur ROI ARGOS
# Ce script télécharge les bibliothèques et crée un fichier HTML complètement autonome

echo "========================================="
echo "Création de la version 100% offline"
echo "========================================="
echo ""

# Créer le dossier pour les bibliothèques
mkdir -p libs
cd libs

echo "📥 Téléchargement de React..."
curl -s -o react.production.min.js https://unpkg.com/react@18/umd/react.production.min.js
if [ $? -eq 0 ]; then
    echo "✅ React téléchargé ($(du -h react.production.min.js | cut -f1))"
else
    echo "❌ Erreur lors du téléchargement de React"
    exit 1
fi

echo "📥 Téléchargement de ReactDOM..."
curl -s -o react-dom.production.min.js https://unpkg.com/react-dom@18/umd/react-dom.production.min.js
if [ $? -eq 0 ]; then
    echo "✅ ReactDOM téléchargé ($(du -h react-dom.production.min.js | cut -f1))"
else
    echo "❌ Erreur lors du téléchargement de ReactDOM"
    exit 1
fi

echo "📥 Téléchargement de Babel Standalone..."
curl -s -o babel.min.js https://unpkg.com/@babel/standalone/babel.min.js
if [ $? -eq 0 ]; then
    echo "✅ Babel téléchargé ($(du -h babel.min.js | cut -f1))"
else
    echo "❌ Erreur lors du téléchargement de Babel"
    exit 1
fi

cd ..

echo ""
echo "📝 Création du fichier HTML avec bibliothèques intégrées..."

# Lire les fichiers
REACT_CODE=$(cat libs/react.production.min.js)
REACTDOM_CODE=$(cat libs/react-dom.production.min.js)
BABEL_CODE=$(cat libs/babel.min.js)

# Créer le fichier HTML complet
cat > index-fully-offline.html << 'EOF'
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ARGOS - Calculateur ROI (100% Offline)</title>
    <style>
EOF

# Copier le CSS de index-offline.html
sed -n '/<style>/,/<\/style>/p' index-offline.html | sed '1d;$d' >> index-fully-offline.html

cat >> index-fully-offline.html << 'EOF'
    </style>
</head>
<body>
    <div id="root"></div>

    <!-- React intégré -->
    <script>
EOF

echo "$REACT_CODE" >> index-fully-offline.html

cat >> index-fully-offline.html << 'EOF'
    </script>

    <!-- ReactDOM intégré -->
    <script>
EOF

echo "$REACTDOM_CODE" >> index-fully-offline.html

cat >> index-fully-offline.html << 'EOF'
    </script>

    <!-- Babel Standalone intégré -->
    <script>
EOF

echo "$BABEL_CODE" >> index-fully-offline.html

cat >> index-fully-offline.html << 'EOF'
    </script>

    <!-- Code de l'application -->
EOF

# Copier le code de l'application
sed -n '/<script type="text\/babel">/,/<\/script>/p' index-offline.html | grep -v "Instructions pour version 100% offline" -A 100 >> index-fully-offline.html

cat >> index-fully-offline.html << 'EOF'
</body>
</html>
EOF

echo "✅ Fichier index-fully-offline.html créé"
echo ""
echo "📊 Taille des fichiers:"
ls -lh index*.html | awk '{print "   " $9 ": " $5}'
echo ""
echo "========================================="
echo "✨ Version 100% offline créée avec succès!"
echo "========================================="
echo ""
echo "📱 Vous pouvez maintenant utiliser 'index-fully-offline.html'"
echo "   sans AUCUNE connexion internet, même la première fois!"
echo ""
echo "💡 Le dossier 'libs/' contient les bibliothèques téléchargées"
echo "   (vous pouvez le garder pour référence ou le supprimer)"
