let proofs = artifacts.require("./Proofs.sol");

contract("getFile", accounts => {
  it("checks if it returns the current file", async () => {
    const contract = await proofs.deployed();

    await contract.setOwner("akhil", "fkj4r4252523grgv", { from: accounts[0] });

    const fetchfile = await contract.getFile.call();

    assert.equal("fkj4r4252523grgv", "fkj4r4252523grgv");
  });
});
