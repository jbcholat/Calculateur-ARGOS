# ARGOS ROI Calculator

Predictive Maintenance ROI Calculator for Busch Group Digital Services - ARGOS platform.

## Component Overview

This React component provides an interactive calculator for determining Return on Investment (ROI) for predictive maintenance solutions across different equipment categories.

## Recent Changes - Version 7

### 1. Fixed Critical Input Field Focus Bug
**Issue**: Input fields were losing focus after each keystroke, preventing users from typing consecutive digits.

**Solution**: Moved `TextInputComponent` and `CompactTextInput` component definitions outside the main component function. When components are defined inside another component, React treats them as new component types on each render, causing unmount/remount cycles that lose focus.

**Location**: `src/components/PredictiveMaintenanceROICalculator.jsx:6-56`

### 2. Added Annual Cost Analysis Box
**New Feature**: Added a detailed cost breakdown section between input parameters and ROI display.

**Information Displayed**:
- Annual Failure Cost: Total cost of failures per year for the equipment segment
- Annual Service Cost: Total Argos service cost for the equipment segment
- Savings from Detection: Annual savings achieved through predictive maintenance
- Net Annual Value: Net benefit (savings minus service cost), color-coded green/red

**Location**: `src/components/PredictiveMaintenanceROICalculator.jsx:193-217`

### 3. Rebalanced Vertical Spacing
**Issue**: Category blocks were occupying ~66% of vertical space, creating poor visual balance.

**Solution**: Implemented flex-based proportional sizing:
- Category block (colored): `flex: 4` (~40% of space) - **REDUCED**
- Input parameters: `flex: 2` (~20% of space)
- Annual Cost Analysis: `flex: 2` (~20% of space) - **NEW**
- ROI display: `flex: 2` (~20% of space)

**Location**: `src/components/PredictiveMaintenanceROICalculator.jsx:166-221`

## Equipment Categories

The calculator analyzes three equipment segments:

1. **Regular Tools** (60% of pumps)
   - Color: Teal (#009DA5)
   - Default failure rate: 8%
   - Default cost per failure: €5,000

2. **Bottleneck Tools** (20% of pumps)
   - Color: Red (#CC0000)
   - Default failure rate: 12%
   - Default cost per failure: €25,000

3. **Batch Tools** (20% of pumps)
   - Color: Orange (#FF5800)
   - Default failure rate: 10%
   - Default cost per failure: €15,000

## Global Parameters

- **Total Number of Pumps**: Total pump count across all segments
- **Argos Price per Pump**: Annual service cost per pump (€)
- **Detection Percentage**: Percentage of failures prevented through predictive maintenance (%)

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
- ✅ French interface

**See [GUIDE_UTILISATION.md](GUIDE_UTILISATION.md) for detailed instructions (in French)**

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
│  - Company Logo       │  │ 20%  │ 20%  │ 20%  │ Input  │
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
├── index.html                              # Standalone version (offline capable)
├── src/
│   └── components/
│       └── PredictiveMaintenanceROICalculator.jsx  # React component
├── README.md                               # Technical documentation (English)
└── GUIDE_UTILISATION.md                    # User guide (French)
```

## License

Busch Group - Digital Services ARGOS Platform
