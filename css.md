CSS cheats
===

FLEXBOX

```
Conteneur

display: flex;
display: inline-flex;

Direction

flex-direction: row;
flex-direction: column;

Retour à la ligne

flex-wrap: nowrap;
flex-wrap: wrap;

Axe principal

justify-content: flex-start;
justify-content: flex-end;
justify-content: center;
justify-content: space-between;
justify-content: space-around;
justify-content: space-evenly;

Axe secondaire

align-items: stretch;
align-items: flex-start;
align-items: flex-end;
align-items: center;
align-items: baseline;

Plusieurs lignes

align-content: flex-start;
align-content: center;
align-content: space-between;
align-content: space-around;
align-content: stretch;

Éléments

flex-grow: 1;
flex-shrink: 1;
flex-basis: auto;

flex: 1;
order: 1;

align-self: center;

Espacement

gap: 1rem;
row-gap: 1rem;
column-gap: 1rem;
```

GRID

```
Conteneur

display: grid;
display: inline-grid;

Structure

grid-template-columns: 250px 1fr;
grid-template-columns: repeat(3, 1fr);

grid-template-rows: auto 1fr auto;

Zones

grid-template-areas:
    "header header"
    "sidebar main"
    "footer footer";

grid-area: header;
grid-area: sidebar;
grid-area: main;
grid-area: footer;

Positionnement

grid-column: 1 / 3;
grid-column: span 2;

grid-row: 1 / 3;
grid-row: span 2;

Alignement global

justify-items: center;
align-items: center;

place-items: center;

Alignement d'un élément

justify-self: center;
align-self: center;

place-self: center;

Alignement de la grille

justify-content: center;
align-content: center;

place-content: center;

Espacement

gap: 1rem;
row-gap: 1rem;
column-gap: 1rem;
```

BLOCK / LAYOUT CLASSIQUE

```
Affichage

display: block;
display: inline;
display: inline-block;
display: none;

Positionnement

position: static;
position: relative;
position: absolute;
position: fixed;
position: sticky;

Coordonnées

top: 0;
right: 0;
bottom: 0;
left: 0;

Dimensions

width: 100%;
height: 100%;

min-width: 0;
max-width: 1200px;

min-height: 100vh;

Marges

margin: 0 auto;
margin-top: 1rem;
margin-bottom: 1rem;

Padding

padding: 1rem;
padding-top: 1rem;
padding-bottom: 1rem;

Texte

text-align: left;
text-align: center;
text-align: right;

vertical-align: middle;

Débordement

overflow: visible;
overflow: hidden;
overflow: auto;
overflow: scroll;

Empilement

z-index: 1;
z-index: 999;

Ancienne mise en page

float: left;
float: right;
clear: both;

Modèle de boîte

box-sizing: border-box;
```
