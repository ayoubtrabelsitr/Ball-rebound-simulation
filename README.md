# Modélisation et Animation
## Simulation des rebonds d'une balle de tennis

### Réalisé par :
- TURIKUMWE Fabrice
- TRABELSI Ayoub

### Année :
2023-2024


## Introduction
Dans ce projet, nous explorerons la simulation physique du mouvement d’une balle de tennis. Pour comprendre ce mouvement, nous devrons appliquer et analyser les différentes forces qui agissent sur la balle.

## Objectifs
Le projet nous initie à la simulation basée sur les modèles physiques, où en appliquant les principes fondamentaux de la physique et des mathématiques, nous pouvons imiter le comportement d’une balle de tennis dans un environnement virtuel. Pour obtenir une simulation précise, il est essentiel de respecter les Lois du mouvement de Newton.

## Classes
### Boite
Nous avons une classe appelée 'Box' pour représenter un cadre 3D contenant une boîte et un rectangle gris.

### Balle
La balle de tennis est définie par sa position, sa vitesse, son rayon, et son poids. Les forces qui agissent sur la balle sont la gravité, les rebonds sur les faces, la friction, la résistance sur l’air et une force de poussée contrôlée par l’utilisateur.

## Forces et Mouvement
### Rebonds
Les rebonds sont appliqués en fonction de la géométrie et des propriétés de la boîte et de la balle. Si la distance entre la balle et une face est égale à celle du rayon, la balle est renvoyée dans le sens inverse d’un axe correspondant, et une nouvelle vitesse est calculée.

### Friction
La force de friction s’oppose au mouvement relatif ou à la tendance au mouvement entre deux surfaces en contact. Elle agit parallèlement à la surface de contact et s’oppose à la direction du mouvement ou à la tendance au mouvement.

### Résistance
La résistance est une force agissant à l’opposé du mouvement relatif de tout objet en mouvement par rapport à son environnement. Dans notre simulation, nous traitons de la résistance de l’air.

### Force de poussée
Deux types de forces de propulsion sont intégrés dans notre implémentation.

## Défis rencontrés
Nous avons rencontré des défis tels que les rebonds infinis et l'unité de mesures.

## Conclusion
La simulation des rebonds de balles dans un espace tridimensionnel requiert une compréhension approfondie des principes de la physique, des mathématiques et de l’informatique.


