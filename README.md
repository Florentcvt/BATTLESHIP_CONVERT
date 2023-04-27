# BATTLESHIP_CONVERT

grille d'éval :

le smart-contract compile correctement avec "npx hardhat compile" 1pt fonctionnel
le smart-contract est testé par la commande "npx hardhat test" (min 5 tests significatifs) 1pt fonctionnel

le test du smart-contract permet de tester le déploiement du contrat (deux joueurs obligatoires) 1pt fonction deploiement du contrat

le test du smart-contract permet de tester l'ajout correct d'un bateau sur sa grille 1pt fonction qui permet de placer les bateaux placeboat
le test du smart-contract permet de tester l'ajout incorrect d'un bateau sur sa grille 1pt fonction qui permet de placer les bateaux placeboat
le test du smart-contract permet de tester une tentative correcte sur la grille de l'adversaire 1pt fonction testshot
le test du smart-contract permet de tester une tentative incorrecte sur la grille de l'adversaire 1pt fonction testshot testMiss
le test du smart-contract permet de tester une tentative correcte mais par le mauvais joueur sur la grille de l'adversaire 1pt fonction testmiss
le test du smart-contract permet de tester si la partie est terminée 1pt
le test du smart-contract permet de tester qui est vainqueur. 1pt

l'appli react permet de démarrer une partie (on saisit à la main l'adresse de l'adversaire) 2pts elle démarre oui
l'appli react permet de jouer la partie 3pts

Bonus
le test du smart-contract permet de tester l'envoi d'un hash de la position des bateaux en début de partie 2pts
le test du smart-contract permet de tester la confirmation d'une tentative de l'adversaire 2pts
le test du smart-contract permet de tester l'envoi de la position des bateaux en fin de partie 2pts
