async function main() {
    const ContractFactory = await ethers.getContractFactory("ContractFactory");
    const contractFactory = await ContractFactory.deploy();
    await contractFactory.deployed();
  
    console.log("ContractFactory deployed to:", contractFactory.address);
  
    await contractFactory.createContract();
    const contracts = await contractFactory.contracts();
    console.log("Contracts deployed to:", contracts);
  }
  
  main().then(() => process.exit(0)).catch(error => {
    console.error(error);
    process.exit(1);
  });
  