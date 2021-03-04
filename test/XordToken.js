//const _deploy_contracts = require("../migrations/2_deploy_contracts");

var XordToken = artifacts.require("./XordToken.sol");

contract("XordToken", function (accounts) {
  var tokenInstance;

  it("Initializes the contract with correct values", function () {
    return XordToken.deployed()
      .then(function (instance) {
        tokenInstance = instance;
        return tokenInstance.name();
      })
      .then(function (name) {
        assert.equal(name, "Xord", "has the correct name");
        return tokenInstance.symbol();
      })
      .then(function (symbol) {
        assert.equal(symbol, "XORD", "has the correct symbol");
      });
  });

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
        return tokenInstance.balanceOf(accounts[0]);
      })
      .then(function (adminBalance) {
        assert.equal(
          adminBalance.toNumber(),
          1000000,
          "it allocates the initial supply to admin"
        );
      });
  });

  it("Transfers ownership", function () {
    return XordToken.deployed()
      .then(function (instance) {
        tokenInstance = instance;
        return tokenInstance.trasfer.call(accounts[1], 999999999999999999);
      })
      .then(assert.fail)
      .catch(function (error) {
        assert(
          error.message.indexOf("revert") >= 0,
          "error message must contain revert"
        );
      });
  });
});
