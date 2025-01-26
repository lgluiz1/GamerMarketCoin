// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {ERC20Permit} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";


contract GamerMarketCoin is ERC20 {
    // Definindo o supply inicial de 5 bilhões de tokens (com 18 casas decimais)
    uint256 public constant INITIAL_SUPPLY = 5 * 10**9 * 10**18; // 5 bilhões de tokens

    // Endereço do criador do contrato
    address public owner;

    // O dono pode criar novos tokens
    constructor() ERC20("GamerMarketCoin", "GMKC") {
        owner = msg.sender; // O criador do contrato é o dono
        _mint(owner, INITIAL_SUPPLY); // Emitindo os 5 bilhões de tokens para o dono
    }

    // Função de mint para permitir que o dono crie novos tokens
    function mint(address to, uint256 amount) public {
        require(msg.sender == owner, "Somente o proprietario pode Criar novos tokens.");
        _mint(to, amount); // Emitindo tokens para o endereço especificado
    }

    // Override da função totalSupply para refletir o total de tokens criados
    function totalSupply() public view virtual override returns (uint256) {
        return super.totalSupply(); // Super chama a função do ERC20, que já considera os mintados
    }
}
