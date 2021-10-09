const CreateCat = artifacts.require("CreateCat");

module.exports = function (deployer) {
  deployer.deploy(CreateCat);
};
