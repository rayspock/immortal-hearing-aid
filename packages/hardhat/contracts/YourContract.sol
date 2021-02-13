pragma solidity >=0.6.0 <0.7.0;

import "hardhat/console.sol";

//import "@openzeppelin/contracts/access/Ownable.sol"; //https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol

contract YourContract {
    event SetPurpose(address sender, string purpose);
    event Attest(address sender, string hash);

    mapping(address => string) public attestations;
    string public purpose = "Immortal Hearing Aid";

    constructor() public {
        // what should we do on deploy?
    }

    function setPurpose(string memory newPurpose) public {
        purpose = newPurpose;
        console.log(msg.sender, "set purpose to", purpose);
        emit SetPurpose(msg.sender, purpose);
    }

    function attest(string memory hash) public {
        console.log(msg.sender, "attests to", hash);
        emit Attest(msg.sender, hash);
        attestations[msg.sender] = hash;
    }
}
