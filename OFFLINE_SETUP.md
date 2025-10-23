# Offline Configuration - Quick Guide

This guide explains how to create a 100% offline version of the ARGOS ROI calculator.

## Quick Method: Automatic Script

### Prerequisites
- A computer with internet access
- `curl` installed (available by default on Mac/Linux)
- Bash shell

### Steps

1. **Clone or download the repository**
   ```bash
   git clone https://github.com/jbcholat/Calculateur-ARGOS.git
   cd Calculateur-ARGOS
   ```

2. **Run the script**
   ```bash
   chmod +x create-fully-offline-version.sh
   ./create-fully-offline-version.sh
   ```

3. **Result**
   The script automatically creates:
   - `libs/` - Folder with downloaded libraries
   - `index-fully-offline.html` - Complete standalone HTML file

4. **Transfer to tablet**
   - Copy `index-fully-offline.html` to your tablet
   - Open it in any browser
   - Works without any internet connection!

## Manual Method

If you prefer to do everything manually:

### 1. Download the libraries

Download these 3 files to your computer:

```bash
# Create the folder
mkdir libs
cd libs

# Download React
curl -o react.production.min.js https://unpkg.com/react@18/umd/react.production.min.js

# Download ReactDOM
curl -o react-dom.production.min.js https://unpkg.com/react-dom@18/umd/react-dom.production.min.js

# Download Babel
curl -o babel.min.js https://unpkg.com/@babel/standalone/babel.min.js

cd ..
```

### 2. Modify index-offline.html

Open `index-offline.html` and find these lines (around line 366):

```html
<script crossorigin src="https://unpkg.com/react@18/umd/react.production.min.js"></script>
<script crossorigin src="https://unpkg.com/react-dom@18/umd/react-dom.production.min.js"></script>
<script src="https://unpkg.com/@babel/standalone/babel.min.js"></script>
```

Replace them with:

```html
<script src="libs/react.production.min.js"></script>
<script src="libs/react-dom.production.min.js"></script>
<script src="libs/babel.min.js"></script>
```

### 3. Final structure

Your folder structure should look like:

```
Calculateur-ARGOS/
├── index-offline.html
└── libs/
    ├── react.production.min.js
    ├── react-dom.production.min.js
    └── babel.min.js
```

### 4. Transfer to tablet

Transfer **the entire folder** (including `libs/`) to your tablet and open `index-offline.html`.

## Verification

To verify everything works:

1. Enable airplane mode on your device
2. Open the HTML file
3. If the calculator displays and works, perfect! ✅

## File Sizes

- `react.production.min.js`: ~6 KB
- `react-dom.production.min.js`: ~130 KB
- `babel.min.js`: ~1.3 MB
- **Total**: ~1.4 MB

This is very light for a modern application!

## Troubleshooting

### The script doesn't work
- Check that `curl` is installed: `curl --version`
- Check your internet connection
- Try running the `curl` commands manually

### The calculator doesn't display
- Check that all 3 files are in the `libs/` folder
- Check that the paths in the HTML are correct
- Open the browser console (F12) to see errors

### Error "React is not defined"
- The `react.production.min.js` file isn't loaded correctly
- Check the path in the HTML

## Support

For any questions:
- Consult the [USER_GUIDE.md](USER_GUIDE.md)
- Open an issue on GitHub
- Contact the ARGOS Digital Services team

---

**Note**: This method works for all platforms (Windows, Mac, Linux, iOS, Android) and all modern browsers (Chrome, Safari, Firefox, Edge).
