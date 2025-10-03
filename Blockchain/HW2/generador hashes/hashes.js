const { ethers } = require("ethers");

const secreto1 = ethers.encodeBytes32String("s1");
const secreto2 = ethers.encodeBytes32String("s2");
console.log("secretos: ")
console.log(secreto1)
console.log(secreto2)



const hash1 = ethers.keccak256(
    ethers.solidityPacked(["bool", "bytes32"], [false, secreto1])
);

const hash2 = ethers.keccak256(
    ethers.solidityPacked(["bool", "bytes32"], [false, secreto2])
);

console.log("HASHES:")
console.log(hash1);
console.log(hash2);
