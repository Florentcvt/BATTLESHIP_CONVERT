// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyContract {
    string public name = "My Contract";
     struct Boat {
        uint256 length;
        uint256 width;
        uint256 depth;
    }
    Boat[] public boats;
}

contract ContractFactory {
    address[] public contracts;

    using Counters for Counters.Counter;
    Counters.Counter triesCounter;

    function createContract() public {
        address newContract = address(new MyContract());
        contracts.push(newContract);
    }

    // 1) fonction ajouter un bateau

    function addBoat(
        uint256 length,
        uint256 width
    ) 
    public {
        require(length > 0, "La longueur doit être supérieure à zéro.");
        require(width > 0, "La largeur doit être supérieure à zéro.");
        
        
        Boat memory newBoat = Boat(length, width, depth);
        boats.push(newBoat);
    }

    // 2) fonction pour placer les bateaux

    function placeBoat(
        Name name,        // Nom du joueur qui place le bateau
        Boat calldata boat // Les informations sur le bateau à placer
    ) external             // Fonction publique, appelable depuis l'extérieur du contrat
    onlyPlayers            // Vérifie que le joueur qui appelle la fonction est un joueur valide
    onlyWater(boat)       // Vérifie que le bateau est placé dans l'eau
    beforeStart           // Vérifie que le jeu n'a pas encore commencé
    isCoherent(name, boat)// Vérifie que les informations sur le bateau sont cohérentes
    {
        // Récupérer l'adresse du joueur qui place le bateau
        address playerAddress = getPlayerAddress(name);

        // Ajouter le bateau à la liste des bateaux du joueur
        players[playerAddress].boats.push(boat);

        // Émettre un événement pour signaler que le bateau a été placé avec succès
        emit BoatPlaced(playerAddress, boat);
    }

    // 3) fonction pour verifier si le tir est bon

    function testShot(
    Name opponent,  // Nom de l'adversaire
    uint256 x,      // Coordonnée X de la tentative
    uint256 y       // Coordonnée Y de la tentative
) public {
    // Récupérer l'adresse de l'adversaire
    address opponentAddress = getPlayerAddress(opponent);
    
    // Vérifier que la tentative n'a pas déjà été testée
    require(!opponents[opponentAddress].shots[x][y], "Cette case a déjà été testée.");
    
    // Marquer la case comme ayant été testée
    opponents[opponentAddress].shots[x][y] = true;
    
    // Vérifier si la tentative touche un bateau
    bool hit = false;
    for (uint256 i = 0; i < opponents[opponentAddress].boats.length; i++) {
        if (opponents[opponentAddress].boats[i].x == x && opponents[opponentAddress].boats[i].y == y) {
            hit = true;
            emit BoatHit(opponentAddress, x, y);
            break;
        }
    }
    
    // Si la tentative n'a touché aucun bateau, émettre un événement pour signaler un échec
    if (!hit) {
        emit ShotMiss(opponentAddress, x, y);
    }
}

//4) test pour verifier si le tir est faux

function testMiss(
    Name opponent,  // Nom de l'adversaire
    uint256 x,      // Coordonnée X de la tentative
    uint256 y       // Coordonnée Y de la tentative
) public {
    // Récupérer l'adresse de l'adversaire
    address opponentAddress = getPlayerAddress(opponent);
    
    // Vérifier que la tentative n'a pas déjà été testée
    require(!opponents[opponentAddress].shots[x][y], "Cette case a déjà été testée.");
    
    // Marquer la case comme ayant été testée
    opponents[opponentAddress].shots[x][y] = true;
    
    // Émettre un événement pour signaler un échec
    emit ShotMiss(opponentAddress, x, y);
}



}
