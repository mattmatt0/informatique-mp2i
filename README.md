# Informatique MP2I
Cours d'informatique pour la première année de CPGE MP2I. Provient de la promotion 2021-2022 du Lycée Pierre De Fermat.
Il s'agit de notes d'élèves, et ne peuvent par conséquent se substituer à une attention rigoureuse en cours !
Les différents chapitres contiennent probablement des erreurs, des inexactitudes, des imprécisions ou des maladresses. Si vous en voyez une, n'hésitez pas à ouvrir une issue.

## Instructions 
Vous aurez besoin d'avoir une installation LaTeX fonctionnelle, comprenant pdflatex.
Si vous avez des difficultés pour votre système, n'hésitez pas à ouvrir une issue, cette section sera mise à jour.
Pour compiler un pdf, rendez-vous dans le **dossier** `.latex` correspondant, et lancez `make adapt`, puis `make`.
La commande `make view` vous permet alors de visualiser le pdf généré via votre visionneur de documents habituel. Vous pouvez cela dit le modifier en éditant le fichier `defs.mk`, et en remplaçant `VIEWER=xdg-open` par ce que vous préférez.

## Structure du répertoire
Le projet contient plusieurs fichiers:

- Les répertoires `<XX-nom>.latex` sont des projets LaTeX contenant un chapitre de cours.
- `include` est un dossier contenant les éléments communs à tous les projets;
- `defs.mk` et `commands.mk` sont des bouts de fichiers Makefile, communs à tous les projets;
- `Makefile` est le fichier Makefile principal (voir section [Makefile principal](#makefile-principal)) ;
- `README.md` est ce document;
- les autres fichiers sont utiles au fonctionnement de git.

Chaque projet contient lui-même plusieurs fichiers:

- `Makefile` vous permettra de compiler le pdf du chapitre (voir [Makefile général](#makefile-général)) ;
- `<nom>.pdf` est le fichier pdf du cours ;
- `src` est le dossier contenant le code source du cours, dans un unique fichier `<nom>.tex` ;
- `obj` contient les "résidus" de compilation (logs, cache)...


## Makefile principal
Le makefile principal, situé dans le dossier contenant tous les chapitres, permet de faire des opérations sur TOUS les projets:

- `make all` compilera tous les pdfs de tous les projets;
- `make clean` effacera tous les pdfs;
- `make view` affichera tous les pdfs disponibles. Notez que cela se fera en utilisant le logiciel défini par la variable `GLOBAL_VIEWER` définie dans ce makefile;
- `make preview` compilera tous les pdfs rapidement (en n'utilisant pas les classes KOMA-script), et affichera chaque pdf après compilation. Utile pour tester la compilation à grande échelle.
- `make hide` cachera les chemins d'accès globaux (spécifiés automatiquement via `make adapt` - voir Makefile général) pour cacher votre arborescence locale, et éviter les modifications inutiles. Il est donc recommandé d'éxécuter cette commande avant chaque commit.

## Makefile général
Chaque projet a son propre makefile, qui définit quelques variables propre au projet, avant de faire appel aux makefiles communs: `defs.mk` et `commands.mk`. Le fichier `defs.mk` est le seul vraiment digne d'intérêt: il vous permet de définir le logiciel que vous voulez utiliser pour afficher un pdf après l'éxécution de `make view`.

Les différentes commandes - définies dans `commands.mk` avec ce makefile sont les suivantes:

- `<nom>.pdf` génère le pdf du projet ;
- `view` affiche le pdf du projet, en le compilant s'il n'existe pas ;
- `preview` compilera comme `view` mais sans utiliser les classes KOMA-script. Cela implique une compilation plus rapide, mais le rendu sera différent.
- `adapt` adapte votre projet: Minted nécessitant l'utilisation de chemins absolus, chaque source latex (dans le dossier `scr`) contient une commande `\PATH`, qui permet d'avoir accès au répertoire du projet courant. `make adapt` définit correctement cette variable. Elle renome ensuite le pdf et le fichier source `.tex` selon le nom défini dans la variable `NAME` (défini dans le Makefile - et non `commands.mk` - du projet).
- `hide` supprime la définition de `\PATH` pour cacher votre arborescence de fichiers.
- `clean` supprime les fichiers pdf, log, aux, et les fichiers cache de minted. Si vous rencontrez des problèmes à la compilation du style `FancyVerb Error`, vous devriez essayer d'exécuter cette commande.


## État des cours
Certains chapitres comportent les polycopiés de Toky, qui ne sont pas modifiables car le code source n'est pas disponible : il seront supprimés à terme.

### Complets
Structures de données arborescentes (8)
OCaml Impératif (9)
Logique propositionnelle (10)
Le problème SAT (11)
Bases de données (13)

### Pas encore complets
Notions fondamentales (0)
Schémas de preuves (1)
Codages des nombres (2)
Complexité (3)
Relations d'ordre (6)
Induction (7)
Schémas algorithmiques (12)
Graphes (14)
Algorithmique du texte (15)

### Vides
Utilisation du shell (A1)
Utilisation de VIM (A2)
Utilisation de LaTeX (A3)
Utilisation de Python (A4)
