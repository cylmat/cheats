# Date

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
