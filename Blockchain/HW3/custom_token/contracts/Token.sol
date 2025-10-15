// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

contract Token {
    address payable public owner;
    uint256 supply;
    string name;
    string symbol;
    uint128 price = 600 wei;

    mapping(address => uint256) private balances;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Mint(address indexed to, uint256 value);
    event Sell(address indexed from, uint256 value);

    constructor(string memory _name, string memory _symbol) payable {
        name = _name;
        symbol = _symbol;
        owner = payable(msg.sender);
    }

    fallback() external payable {}

    function totalSupply() public view returns (uint256) {
        return supply;
    }

    function balanceOf(address _account) public view returns (uint256) {
        return balances[_account];
    }

    function getName() public view returns (string memory) {
        return name;
    }

    function getSymbol() public view returns (string memory) {
        return symbol;
    }

    function getPrice() public view returns (uint128) {
        return price;
    }

    function transfer(address to, uint256 value) public returns (bool) {
        require(balanceOf(msg.sender) >= value, "Balance insuficiente");
        balances[msg.sender] -= value;
        balances[to] += value;

        emit Transfer(msg.sender, to, value);
        return true;
    }

    function mint(address to, uint256 value) public returns (bool) {
        require(msg.sender == owner, "solo el owner puede mintear tokens");
        // Sigo la especificaion al pie de la letra, si quisiera que el contrato tenga que tener eth para respaldar cada
        //token deberia agregar el require:
        // require(
        //     address(this).balance >= (totalSupply() + value) * getPrice(),
        //     "El contrato no tiene fondos suficientes para respaldar los tokens"
        // );
        supply += value;
        balances[to] += value;

        emit Mint(to, value);
        return true;
    }

    function sell(uint256 value) public returns (bool) {
        require(value > 0, "Debes vender al menos un token");
        require(balanceOf(msg.sender) >= value, "Balance insuficiente");
        uint256 ethers = value * getPrice();
        //no deberia pasar nunca
        require(
            address(this).balance >= ethers,
            "el contrato tiene fondos insuficientes"
        );
        balances[msg.sender] -= value;
        supply -= value;
        payable(msg.sender).transfer(ethers);

        emit Sell(msg.sender, value);
        return true;
    }

    function close() public {
        require(
            msg.sender == owner,
            "solo el owner puede destruir el contrato"
        );

        selfdestruct(owner);
    }
}
