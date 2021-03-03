//const _deploy_contracts = require("../migrations/2_deploy_contracts");

var XordToken = artifacts.require("./XordToken.sol");

contract("XordToken", function (accounts) {
  it("sets the total supply upon deployment", function () {
    return XordToken.deployed()
      .then(function (instance) {
        tokenInstance = instance;
        return tokenInstance.totalSupply();
      })
      .then(function (totalSupply) {
        assert.equal(
          totalSupply.toNumber(),
          1000000,
          "sets the total supply to 1,000,000"
        );
      });
  });
});
