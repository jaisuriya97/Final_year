import Web3 from "web3";
import 'bootstrap/dist/css/bootstrap.css'
import configuration from '../build/contracts/New_Tender.json'


const CONTRACT_ADDRESS = configuration.networks['5777'].address;
const CONTRACT_ABI = configuration.abi;


const web3 = new Web3(
    Web3.givenProvider || 'http://127.0.0.1:7545'
);




const contract = new web3.eth.Contract(CONTRACT_ABI, CONTRACT_ADDRESS);

let account;

const accountEl = document.getElementById('Account');
const FormInput = document.getElementById('formGroupExampleInput10');
const connectToMetamask = document.getElementById('connect');
const main = async () => {
    const accounts = await ethereum.request({ method: 'eth_requestAccounts' });
    account = accounts[0];
    accountEl.innerHTML = account;
    FormInput.value = account
    console.log(account)
}
connectToMetamask.addEventListener('click',main)


// Create Tender
const create_tender = async (account) => {
    var tender_name = document.getElementById('formGroupExampleInput9').value;
    var tender_type = document.getElementById('formGroupExampleInput11').value;
    var owner_addres = document.getElementById('formGroupExampleInput10').value;

    var title = document.getElementById('formGroupExampleInput4').value;
    var description = document.getElementById('formGroupExampleInput5').value;
    var tender_value = document.getElementById('formGroupExampleInput6').value;
    var bid_valid_date = document.getElementById('formGroupExampleInput7').value;
    var location = document.getElementById('formGroupExampleInput8').value;


    var Media_Publish_Date = document.getElementById('formGroupExampleInput').value;
    var Bit_Start_Date = document.getElementById('formGroupExampleInput2').value;
    var Bid_End_Date = document.getElementById('formGroupExampleInput3').value;

    //console.log(tender_name,tender_type,owner_addres,title,description,tender_value,bid_valid_date,location,Media_Publish_Date,Bid_End_Date,Bit_Start_Date);
     try{
        const receipt = await contract.methods.createTender(
            title,
            description,
            tender_value,
            bid_valid_date,
            location,
            Media_Publish_Date,
            Bit_Start_Date,
            Bid_End_Date
        ).send({
            from:account,
            gas: 500000
        });
        console.log(receipt)
        console.log("Transaction Hash:", receipt.transactionHash);
        
     }
     catch(error){
        console.error("Error creating tender:", error);
     }
}

const btn = document.getElementById('btn')
btn.addEventListener('click', ()=>create_tender(account));


