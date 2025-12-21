# Date

Best practice: Store UTC (Z time) -> Display local  

You should always store UTC in MySQL, then convert on the frontend.
```
 Your API gives a UTC timestamp:
2025-11-14T10:00:00Z (Append "Z" to force UTC)

Exemple
- Stored: 2025-11-14 10:00:00 (UTC)
// UTC
console.log("UTC:", date.toISOString());
 // Local timezone (ex: Europe/Paris +1)
console.log("Local:", date.toString());
Display locally: 2025-11-14 11:00:00 (local)
```

## difference Z and P

what difference between Z and P in php 'Y-m-d\TH:i:sP' or 'Y-m-d\TH:i:sZ'

```
P — Timezone offset with colon
Format: +HH:MM or -HH:MM
echo date('P');  
Example (UTC+2): +02:00 (ISO-8601)

Z — Timezone offset in seconds
Format: number of seconds east or west of UTC
Example (UTC+2): 7200
Example (UTC−5): -18000
echo date('Z');

Y-m-d\TH:i:sZ  (different from \Z)
Outputs something like:
2025-03-10T14:20:55+0200 (incorrect — does NOT output timezone here!)

\Z - Zulu time (+00 meridian)
\Z prints a literal Z, meaning UTC in ISO-8601
Z is ZULU time (Zulu time is the military name for UTC) (from "Z"ero meridian)
Exemple: 2025-03-10T14:20:55+0000
```

### dateinterval php
```
P[n]Y[n]M[n]DT[n]H[n]M[n]S   (ISO 8601 duration format)

(P start date, T start time)
new DateInterval ('PT24H')    -> 24 hours
```

## Mysql !

```
How MySQL Actually Stores Dates
1. DATETIME
    Stores exact date & time you give it
    No timezone information
    MySQL does not convert the value
    It's stored as YYYY-MM-DD HH:MM:SS
Example:
If you insert 2025-11-14 10:00:00, MySQL stores exactly that, regardless of server timezone

---
MySQL DATETIME does not store timezone information, and if the column is DATETIME(3) or higher precision, it always appends fractional seconds (e.g., .000).
→ Your input:
2025-11-14T12:28:49Z

The Z is removed because DATETIME cannot keep timezone.
→ PHP parses this as UTC, When saving to MySQL DATETIME(3) or DATETIME(6), MySQL stores:
2025-11-14 12:28:49.000
```
