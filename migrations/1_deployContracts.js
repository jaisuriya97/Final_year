var Tender = artifacts.require("./new_tender.sol");


module.exports = function(deployer) {
    deployer.deploy(Tender);
};


// If we update the state of the contract we do migrations