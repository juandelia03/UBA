import { expect } from "chai";
import { network } from "hardhat";

const { ethers } = await network.connect();

describe("MatchingPennies", function () {
  let player1: any;
  let player2: any;
  let player3: any;
  let game: any;

  beforeEach(async function () {
    [player1, player2, player3] = await ethers.getSigners();
    game = await ethers.deployContract("MatchingPennies");
  });

  describe("precondiciones guess", function () {
    it("debería revertir si un jugador que no está en el juego intenta adivinar", async function () {
      const secreto = ethers.encodeBytes32String("secreto");

      await game.connect(player1).joinGame();
      await game.connect(player2).joinGame();

      await expect(
        game
          .connect(player3)
          .guess(secreto, { value: ethers.parseEther("0.1") })
      ).to.be.revertedWith("Solo pueden adivinar los jugadores de este juego");
    });

    it("debería revertir si el valor enviado no es 0.1 ETH", async function () {
      const secret = ethers.encodeBytes32String("secreto");

      await game.connect(player1).joinGame();
      await game.connect(player2).joinGame();

      await expect(
        game.connect(player1).guess(secret, { value: ethers.parseEther("0.2") })
      ).to.be.revertedWith("Para jugar se debe enviar 0.1 ether");

      await expect(
        game.connect(player1).guess(secret, { value: ethers.parseEther("0") })
      ).to.be.revertedWith("Para jugar se debe enviar 0.1 ether");

      await expect(
        game.connect(player1).guess(secret, { value: ethers.parseEther("0.1") })
      ).not.to.be.revert(ethers);
    });

    it("debería revertir si no ambos jugadores están listos", async function () {
      const secret = ethers.encodeBytes32String("secreto");

      await game.connect(player1).joinGame();

      await expect(
        game.connect(player1).guess(secret, { value: ethers.parseEther("0.1") })
      ).to.be.revertedWith(
        "Ambos jugadores deben estar listos para empezar a jugar"
      );

      await game.connect(player2).joinGame();

      await expect(
        game.connect(player1).guess(secret, { value: ethers.parseEther("0.1") })
      ).not.to.be.revert(ethers);

      await expect(
        game.connect(player2).guess(secret, { value: ethers.parseEther("0.1") })
      ).not.to.be.revert(ethers);
    });

    it("debería revertir si un jugador intenta adivinar dos veces", async function () {
      const secreto1 = ethers.encodeBytes32String("secreto1");
      const secreto2 = ethers.encodeBytes32String("secreto2");

      await game.connect(player1).joinGame();
      await game.connect(player2).joinGame();

      await expect(
        game
          .connect(player1)
          .guess(secreto1, { value: ethers.parseEther("0.1") })
      ).not.to.be.revert(ethers);

      await expect(
        game
          .connect(player1)
          .guess(secreto2, { value: ethers.parseEther("0.1") })
      ).to.be.revertedWith("No podes adivinar dos veces!");
    });

    it("no debería permitir adivinar si ya terminó un juego sin unirse de nuevo", async function () {
      //chequea el bit present
      const secret1 = ethers.encodeBytes32String("secreto1");
      const secret2 = ethers.encodeBytes32String("secreto2");

      await game.connect(player1).joinGame();
      await game.connect(player2).joinGame();

      const hash1 = ethers.keccak256(
        ethers.solidityPacked(["bool", "bytes32"], [false, secret1])
      );
      const hash2 = ethers.keccak256(
        ethers.solidityPacked(["bool", "bytes32"], [true, secret2])
      );

      await game
        .connect(player1)
        .guess(hash1, { value: ethers.parseEther("0.1") });
      await game
        .connect(player2)
        .guess(hash2, { value: ethers.parseEther("0.1") });

      await game.connect(player1).revealSecret(0, secret1);
      await game.connect(player2).revealSecret(1, secret2);

      const newSecret = ethers.encodeBytes32String("nuevoSecreto");
      await expect(
        game
          .connect(player1)
          .guess(newSecret, { value: ethers.parseEther("0.1") })
      ).to.be.revertedWith("Solo pueden adivinar los jugadores de este juego");

      const anotherSecret = ethers.encodeBytes32String("otroSecreto");
      await expect(
        game
          .connect(player2)
          .guess(anotherSecret, { value: ethers.parseEther("0.1") })
      ).to.be.revertedWith("Solo pueden adivinar los jugadores de este juego");
    });
  });

  describe("joinGame", function () {
    it("debería permitir a dos jugadores unirse", async function () {
      await game.connect(player1).joinGame();
      await game.connect(player2).joinGame();
    });

    it("debería revertir si un tercer jugador intenta unirse", async function () {
      await game.connect(player1).joinGame();
      await game.connect(player2).joinGame();

      await expect(game.connect(player3).joinGame()).to.be.revertedWith(
        "Ya hay dos jugadores"
      );
    });

    it("debería permitir que los jugadores se unan de nuevo después de que termina un juego", async function () {
      const secret1 = ethers.encodeBytes32String("secreto1");
      const secret2 = ethers.encodeBytes32String("secreto2");

      // Primer juego
      await game.connect(player1).joinGame();
      await game.connect(player2).joinGame();

      const hash1 = ethers.keccak256(
        ethers.solidityPacked(["uint8", "bytes32"], [0, secret1])
      );
      const hash2 = ethers.keccak256(
        ethers.solidityPacked(["uint8", "bytes32"], [1, secret2])
      );

      await game.connect(player1).guess(hash1, { value: ethers.parseEther("0.1") });
      await game.connect(player2).guess(hash2, { value: ethers.parseEther("0.1") });

      await game.connect(player1).revealSecret(0, secret1);
      await game.connect(player2).revealSecret(1, secret2);

      //aca termino el juego deberian poder conectarse de nuevo sin fallar

      await game.connect(player1).joinGame();
      await game.connect(player2).joinGame();
    });

  });

  describe("revealSecret", function () {

    it("debería revertir si quien llama no está en el juego", async function () {
      const secret = ethers.encodeBytes32String("secreto");
      await game.connect(player1).joinGame();
      await game.connect(player2).joinGame();

      const hash = ethers.keccak256(
        ethers.solidityPacked(["uint8", "bytes32"], [0, secret])
      );
      await game
        .connect(player1)
        .guess(hash, { value: ethers.parseEther("0.1") });

      await expect(
        game.connect(player3).revealSecret(0, secret)
      ).to.be.revertedWith(
        "Solo puede revelar su eleccion un jugador del juego"
      );
    });

    it("debería revertir si _choice y secret no coinciden con el hash almacenado", async function () {
      const secret = ethers.encodeBytes32String("secreto");
      await game.connect(player1).joinGame();
      await game.connect(player2).joinGame();

      const correctHash = ethers.keccak256(
        ethers.solidityPacked(["uint8", "bytes32"], [0, secret])
      );
      await game
        .connect(player1)
        .guess(correctHash, { value: ethers.parseEther("0.1") });

      const wrongSecret = ethers.encodeBytes32String("mal");
      await expect(
        game.connect(player1).revealSecret(1, wrongSecret)
      ).to.be.revertedWith(
        "El secreto y choice deben ser los ingresados originalmente"
      );
    });

    it("debería actualizar balance del ganador y resetear jugadores cuando ambos revelan", async function () {
      const secret1 = ethers.encodeBytes32String("secreto1");
      const secret2 = ethers.encodeBytes32String("secreto2");

      await game.connect(player1).joinGame();
      await game.connect(player2).joinGame();

      const hash1 = ethers.keccak256(
        ethers.solidityPacked(["bool", "bytes32"], [false, secret1])
      );
      const hash2 = ethers.keccak256(
        ethers.solidityPacked(["bool", "bytes32"], [true, secret2])
      );

      await game
        .connect(player1)
        .guess(hash1, { value: ethers.parseEther("0.1") });
      await game
        .connect(player2)
        .guess(hash2, { value: ethers.parseEther("0.1") });

      await game.connect(player1).revealSecret(0, secret1);
      await game.connect(player2).revealSecret(1, secret2);

      const p1 = await game.playersMapping(player1.address);
      const p2 = await game.playersMapping(player2.address);

      // player2 gana
      expect(p1.balance).to.equal(ethers.parseEther("0"));
      expect(p2.balance).to.equal(ethers.parseEther("0.2"));

      expect(p1.present).to.be.false;
      expect(p2.present).to.be.false;

    });

    it("debería actualizar balance del jugador1 cuando ambos revelan el mismo choice", async function () {
      const secret1 = ethers.encodeBytes32String("secreto1");
      const secret2 = ethers.encodeBytes32String("secreto2");

      await game.connect(player1).joinGame();
      await game.connect(player2).joinGame();

      const hash1 = ethers.keccak256(
        ethers.solidityPacked(["bool", "bytes32"], [false, secret1])
      );
      const hash2 = ethers.keccak256(
        ethers.solidityPacked(["bool", "bytes32"], [false, secret2])
      );

      await game
        .connect(player1)
        .guess(hash1, { value: ethers.parseEther("0.1") });
      await game
        .connect(player2)
        .guess(hash2, { value: ethers.parseEther("0.1") });

      await game.connect(player1).revealSecret(0, secret1);
      await game.connect(player2).revealSecret(0, secret2);

      const p1 = await game.playersMapping(player1.address);
      const p2 = await game.playersMapping(player2.address);

      // player1 gana
      expect(p1.balance).to.equal(ethers.parseEther("0.2"));
      expect(p2.balance).to.equal(ethers.parseEther("0"));
    });
  });

  describe("withdraw", function () {
    it("debería revertir si el balance es 0", async function () {
      await expect(game.connect(player3).withdraw()).to.be.revertedWith(
        "El balance debe ser mayor a cero"
      );
    });

    it("debería transferir el balance y resetearlo a 0", async function () {
      const secret1 = ethers.encodeBytes32String("secreto1");
      const secret2 = ethers.encodeBytes32String("secreto2");

      await game.connect(player1).joinGame();
      await game.connect(player2).joinGame();

      const hash1 = ethers.keccak256(
        ethers.solidityPacked(["bool", "bytes32"], [false, secret1])
      );
      const hash2 = ethers.keccak256(
        ethers.solidityPacked(["bool", "bytes32"], [true, secret2])
      );

      await game
        .connect(player1)
        .guess(hash1, { value: ethers.parseEther("0.1") });
      await game
        .connect(player2)
        .guess(hash2, { value: ethers.parseEther("0.1") });

      await game.connect(player1).revealSecret(0, secret1);
      await game.connect(player2).revealSecret(1, secret2);

      const balanceBefore = await ethers.provider.getBalance(player2.address);
      await game.connect(player2).withdraw();

      const balanceAfter = await ethers.provider.getBalance(player2.address);

      const margen = ethers.parseEther("0.001");
      const expectedBalance = balanceBefore + ethers.parseEther("0.2");
      // por el gas no queda igual chequeo que quede parecido
      expect(balanceAfter).to.be.closeTo(expectedBalance, margen);

      const playerData = await game.playersMapping(player2.address);
      expect(playerData.balance).to.equal(0);
    });
  });
});
