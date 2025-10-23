# User Guide - ARGOS ROI Calculator

## Offline Usage on Tablet

### Method 1: Simple Usage (Recommended)

**Step 1: Download the file**
1. Go to your GitHub repository: `https://github.com/jbcholat/Calculateur-ARGOS`
2. Click on the `index.html` file
3. Click the "Raw" or "Download" button
4. Save the file to your tablet

**Step 2: Open on tablet**
1. Locate the `index.html` file in your downloads
2. Double-click or tap on the file
3. Select your browser (Chrome, Safari, Edge, Firefox)
4. The calculator displays immediately!

**⚠️ Important for OFFLINE usage**
- On first opening, the file downloads necessary libraries (React, Tailwind)
- **Make sure you have an internet connection during the FIRST use**
- After the first load, these libraries are cached
- Then you can use the calculator **completely offline**

### Method 2: Fully Offline Version - Optimized CSS

**For environments without internet at all**

Use the `index-offline.html` file which replaces Tailwind CSS with optimized CSS:

1. Download `index-offline.html` from GitHub
2. Open it on your tablet
3. On first opening, it downloads React (very light, ~140 KB total)
4. Then works 100% offline

**Advantages**:
- Lighter than standard version
- Optimized and fast CSS
- Works offline after first load

### Method 3: 100% Offline Version - No Internet Dependency

**For use without ANY internet connection, even the first time**

#### Option A: Automatic Script (Recommended)

If you have access to a computer with internet:

```bash
# Download the repository
git clone https://github.com/jbcholat/Calculateur-ARGOS.git
cd Calculateur-ARGOS

# Run the script
./create-fully-offline-version.sh
```

The script will automatically create `index-fully-offline.html` with all embedded libraries (~1.4 MB).

#### Option B: Manual

1. Download `index-offline.html` from GitHub
2. Download the following libraries:
   - [react.production.min.js](https://unpkg.com/react@18/umd/react.production.min.js) (~6 KB)
   - [react-dom.production.min.js](https://unpkg.com/react-dom@18/umd/react-dom.production.min.js) (~130 KB)
   - [babel.min.js](https://unpkg.com/@babel/standalone/babel.min.js) (~1.3 MB)
3. Create a `libs/` folder next to the HTML file
4. Place the 3 downloaded files in the `libs/` folder
5. Modify `index-offline.html` lines 366-368 to point to `libs/`

**Total size**: ~1.4 MB (very reasonable for a tablet)

**Advantage**: Works even on airplanes, submarines, or areas without network!

---

## Using the Calculator

### Left Panel - Global Parameters

1. **Total Number of Pumps**: Enter the total number of pumps on site
2. **Argos Price per Pump**: Annual cost of Argos service per pump (€)
3. **Detection Percentage**: Failure detection efficiency (typically 70%)

### Right Columns - Equipment Categories

For each category (Regular Tools, Bottleneck Tools, Batch Tools):

**Colored Block**: Displays equipment type and distribution
- Regular Tools: 60% of pumps (teal/cyan)
- Bottleneck Tools: 20% of pumps (red)
- Batch Tools: 20% of pumps (orange)

**Input Parameters**:
- **Failure Rate**: Annual failure percentage (%)
- **Cost per Failure**: Average cost of a failure (€)

**Annual Cost Analysis** (NEW):
- **Annual Failure Cost**: Total failure costs per year
- **Annual Service Cost**: Total Argos service cost
- **Savings from Detection**: Savings through predictive maintenance
- **Net Annual Value**: Net benefit (green if positive, red if negative)

**ROI**: Return on investment with color coding
- 🔴 Red: Negative ROI
- 🟠 Orange: Low ROI (0-15%)
- 🟢 Green: High ROI (>15%)

---

## Usage Tips

### On iPad/iOS Tablet
1. Download the file via Safari
2. The file appears in the "Files" app
3. Tap on the file to open it in Safari
4. For quick access: add the page to home screen
   - Tap the "Share" button
   - Select "Add to Home Screen"

### On Android Tablet
1. Download the file via Chrome
2. The file appears in "Downloads"
3. Tap on the file to open it in Chrome
4. For quick access: add to Chrome bookmarks

### Full Screen Mode
- **Chrome**: Menu → "Add to Home Screen"
- **Safari**: Share button → "Add to Home Screen"
- This creates an icon that launches the calculator in full screen

---

## Client Presentation

### Landscape Mode Recommended
The calculator is optimized for landscape (horizontal) display.

### Interactive Demonstration
1. Start with default values
2. Modify parameters in real-time to show impact
3. Calculations update instantly
4. Use different scenarios (conservative, optimistic, realistic)

### Suggested Scenarios

**Scenario 1: Conservative Client**
- Low failure rates
- Moderate failure costs
- Detection at 60%

**Scenario 2: Standard Client**
- Default values (already configured)

**Scenario 3: Client with Critical Equipment**
- Increase failure costs for bottleneck tools
- Detection at 80%
- Show high ROI

---

## Troubleshooting

### Calculator doesn't display
- Check that you have internet connection (first use)
- Try another browser (Chrome recommended)
- Clear browser cache and retry

### Input fields lose focus
- This bug has been fixed in version 7
- If the problem persists, reload the page

### Display too small on tablet
- Use browser zoom (pinch to zoom)
- Design is responsive and adapts automatically

---

## Updates

To get the latest version:
1. Return to GitHub
2. Download the `index.html` file again
3. Replace the old file on your tablet

---

## Technical Support

For any questions or issues:
- Consult the README.md file on GitHub
- Open an "issue" on the GitHub repository
- Contact the ARGOS Digital Services team

---

## Version

**Current version**: 7.0
**Last update**: October 2025

**Version 7 Features**:
- ✅ Fixed input field focus loss bug
- ✅ Added detailed annual cost analysis
- ✅ Rebalanced vertical spacing
- ✅ English interface
- ✅ Offline mode after first use
- ✅ 100% offline version available

---

## Version Comparison

| Feature | index.html | index-offline.html | index-fully-offline.html |
|---------|------------|-------------------|-------------------------|
| **Connection required 1st time** | ✅ Yes | ✅ Yes (light) | ❌ No |
| **Works offline after** | ✅ Yes | ✅ Yes | ✅ Yes |
| **File size** | ~30 KB | ~45 KB | ~1.4 MB |
| **CSS Framework** | Tailwind CDN | Inline CSS | Inline CSS |
| **React Libraries** | CDN | CDN | Embedded |
| **Ideal for** | Normal usage | Limited network | No network |
| **Performance** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ |

**Recommendation**:
- **Most cases**: Use `index.html` (simple and light)
- **Limited network**: Use `index-offline.html` (optimized)
- **No internet**: Create `index-fully-offline.html` with the script
