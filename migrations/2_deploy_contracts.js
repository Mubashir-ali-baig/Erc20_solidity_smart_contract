const XordToken = artifacts.require("./XordToken.sol");

module.exports = function (deployer) {
  deployer.deploy(XordToken, 1000000);
};
