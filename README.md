# GOLDORACK
----------------------------

## Amstrad 6128 plus / 464 plus et GX4000

---------------


__Répertoir de travail__  
*./v0.1-beta*  

Dans ce répertoire le fichier "00-CPR_metamorphose winAPE.bat" est à executer pour compiler le code source avec RASM.  
La compilation génère des fichiers dans le répertoire de test : .sym et .cpr


__Répertoir de test__  
*../WinAPE20B2_betatest_goldorack*  

Dans ce répertoire les fichiers compilé provenant du répertoire de travail y sont écrit.  
C'est également le répertoire à fournir aux béta testeurs car il contient à chaque fois la dernière version du programme.


## Structure
---------------
__01-CPR_initialisation__  
initialisation du hardware

__02a-CPR_creation__  
* lecture du clavier
* routine ligne inférieur en #C000
* routine ligne inférieur en #4000
* routine de décompression des gfx et autres samples
* fondus de sorties en ROM
* routine de lecture des samples
* remise à zero des valeurs du CRTC et du retard vidéo 
  
__02b-CPR_screen__  
* formattage CRTC de l'écran titre
* Décompression des fichiers GO1 et GO2
* Rupture ligne 167
* Copie de la palette CPC+


__04_bis-Programme_ROM__  

* Vague de type 1 (tableau)
* Vague de type 2 (tableau)
* Mix vague de type 1 & 2 (tableau)
* Vague de type 3 (tableau)
* Les types de soucoupes (tableau) -> chaque ligne correspond à une apparition de soucoupe de une à six soucoupe maximum.
* Le nombre d'ennemis simultanés (tableau) -> chaque ligne corresponds aux lignes du tableau "Les types de soucoupes". Sauf les 2 premiers paramètres qui détermine le timing de début et de fin de vague.  
Chaque tableau corresponds à un niveau du jeu.











## Logs
---------------

__04/01/2023__  

1. L'image de présentation n'affiche pas toute les bonnes couleurs : Il manque un violet et un rose en arrière-plan et un vert clair dans la fumée située derrière Actarus : Correction des couleurs sur l'écran titre (Titan)

2. Bug dans le dégradé du titre "Goldorak" : une ligne jaune est absente. J'ai corrigé cela sur la nouvelle version de l'image disponible sur le site.

