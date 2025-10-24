# ARGOS ROI Calculator

Predictive Maintenance ROI Calculator for Busch Group Digital Services - ARGOS platform.

## Component Overview

This React component provides an interactive calculator for determining Return on Investment (ROI) for predictive maintenance solutions across different equipment categories.

## Recent Changes - Version 8

### Version 8 Updates (Latest)

**Default Values Updated:**
- Regular Tools Cost per Failure: €5,000 → €10,000
- Bottleneck Tools Cost per Failure: €25,000 → €50,000
- Batch Tools Cost per Failure: €15,000 → €150,000
- Argos Price per Pump: €500 → €2,500

**Input Step Increments Added:**
- Total Number of Pumps: `step="10"` (practical increments for typical installations)
- Argos Price per Pump: `step="100"` (fast pricing adjustments)
- Failure Rate: `step="1"` (precise percentage control)
- Cost per Failure: `step="5000"` (realistic cost increments)

**UI Improvements:**
- Added **Reset Button** at bottom of left panel - one-click restoration of all default values
- Removed company logo for cleaner, more focused interface
- Logo code commented out for easy restoration if needed

### Version 7 Features (Foundation)

**1. Fixed Critical Input Field Focus Bug**
- Moved component definitions outside main component to prevent focus loss
- Users can now type consecutive digits without repeated clicking

**2. Added Annual Cost Analysis Box**
- Detailed cost breakdown between input parameters and ROI display
- Shows: Annual Failure Cost, Annual Service Cost, Savings from Detection, Net Annual Value
- Color-coded Net Annual Value (green/red)

**3. Rebalanced Vertical Spacing**
- Category block: `flex: 4` (~40% of space)
- Input parameters: `flex: 2` (~20% of space)
- Annual Cost Analysis: `flex: 2` (~20% of space)
- ROI display: `flex: 2` (~20% of space)

## Equipment Categories

The calculator analyzes three equipment segments:

1. **Regular Tools** (60% of pumps)
   - Color: Teal (#009DA5)
   - Default failure rate: 8%
   - Default cost per failure: €10,000
   - Step increment: 1% (failure rate), €5,000 (cost)

2. **Bottleneck Tools** (20% of pumps)
   - Color: Red (#CC0000)
   - Default failure rate: 12%
   - Default cost per failure: €50,000
   - Step increment: 1% (failure rate), €5,000 (cost)

3. **Batch Tools** (20% of pumps)
   - Color: Orange (#FF5800)
   - Default failure rate: 10%
   - Default cost per failure: €150,000
   - Step increment: 1% (failure rate), €5,000 (cost)

## Global Parameters

- **Total Number of Pumps**: Total pump count across all segments (default: 1,000, step: 10)
- **Argos Price per Pump**: Annual service cost per pump (default: €2,500, step: €100)
- **Detection Percentage**: Percentage of failures prevented through predictive maintenance (default: 70%, step: 1%)

## ROI Color Coding

- **Red**: Negative ROI
- **Orange**: Low positive ROI (0-15%)
- **Green**: High ROI (>15%)

## Technical Details

### Dependencies
- React 16.8+ (uses hooks: `useState`, `useMemo`)
- Tailwind CSS for styling

### Key Calculations

For each equipment segment:
```javascript
pumpsInSegment = totalPumps × distribution
failedPumps = pumpsInSegment × (failureRate / 100)
annualFailureCost = failedPumps × costPerFailure
annualServiceCost = pumpsInSegment × argosPricePerPump
avoidedFailures = failedPumps × (detectionPercentage / 100)
savings = avoidedFailures × costPerFailure
netAnnualValue = savings - annualServiceCost
roi = ((savings - annualServiceCost) / annualServiceCost) × 100
```

## Usage

### Option 1: Standalone HTML (Recommended for Tablets/Offline Use)

**Perfect for client presentations on tablets or offline demos.**

1. Download `index.html` from this repository
2. Open it in any modern browser (Chrome, Safari, Firefox, Edge)
3. Works offline after first load (requires internet connection on first use to download React/Tailwind libraries)

**Features:**
- ✅ Single file solution - no build process required
- ✅ Works offline on tablets (iPad, Android)
- ✅ No installation needed
- ✅ All functionality included
- ✅ English interface

**See [USER_GUIDE.md](USER_GUIDE.md) for detailed instructions**

### Option 2: React Component Integration

For integration into a React application:

```jsx
import PredictiveMaintenanceROICalculator from './src/components/PredictiveMaintenanceROICalculator';

function App() {
  return (
    <div>
      <PredictiveMaintenanceROICalculator />
    </div>
  );
}
```

## Layout Structure

```
┌─────────────────────────────────────────────────────────┐
│  Left Panel (25%)     │  Right Panel (75%)              │
│                       │                                  │
│  - Title              │  ┌──────┬──────┬──────┐        │
│  - Global Inputs      │  │ Col1 │ Col2 │ Col3 │        │
│    • Total Pumps      │  │      │      │      │        │
│    • Price/Pump       │  │ 40%  │ 40%  │ 40%  │ Cat    │
│    • Detection %      │  │      │      │      │        │
│  - ROI Legend         │  ├──────┼──────┼──────┤        │
│  - Reset Button       │  │ 20%  │ 20%  │ 20%  │ Input  │
│                       │  ├──────┼──────┼──────┤        │
│                       │  │ 20%  │ 20%  │ 20%  │ Cost   │
│                       │  ├──────┼──────┼──────┤        │
│                       │  │ 20%  │ 20%  │ 20%  │ ROI    │
│                       │  └──────┴──────┴──────┘        │
└─────────────────────────────────────────────────────────┘
```

## File Structure

```
Calculateur-ARGOS/
├── index.html                              # Standard version (Tailwind CDN)
├── index-offline.html                      # Optimized CSS version (lighter)
├── create-fully-offline-version.sh         # Script to create 100% offline version
├── src/
│   └── components/
│       └── PredictiveMaintenanceROICalculator.jsx  # React component for integration
├── README.md                               # Technical documentation
├── USER_GUIDE.md                           # User guide
└── OFFLINE_SETUP.md                        # Offline setup guide
```

## Available Versions

### 1. index.html (Standard)
- Uses Tailwind CSS from CDN
- Requires internet on first load
- Works offline after caching (~30 KB)
- **Best for**: Normal use cases

### 2. index-offline.html (Optimized)
- Custom CSS (no Tailwind dependency)
- Only needs React from CDN (~140 KB)
- Lighter and faster
- **Best for**: Limited network environments

### 3. index-fully-offline.html (100% Offline)
- All libraries embedded
- NO internet required at all (~1.4 MB)
- Create with: `./create-fully-offline-version.sh`
- **Best for**: Completely offline environments (airplanes, submarines, remote sites)

**See [USER_GUIDE.md](USER_GUIDE.md) for detailed comparison and usage instructions**

## License

Busch Group - Digital Services ARGOS Platform
