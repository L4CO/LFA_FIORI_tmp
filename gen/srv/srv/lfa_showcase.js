const cds = require('@sap/cds');

const { BusinessPartnerFasade,
    FinancialContractFasade,
    BpContractAssignmentFasade,
    TotalCommitment } = cds.entities;

 

module.exports = (srv) => { 
    
 

    srv.after ('READ','TotalCommitment', calculateTotalCommitment );
    
}


async function calculateTotalCommitment(req){
    
    
    req.forEach( (item) => {
        item.CURRENCY = 'USD';
        sumAmaunt(req, item.BUSINESSPARTNERID).then(item.TOTAL);
        console.debug(item.TOTAL);
    });

}

async function sumAmaunt(req ,BusinessPartnerID){
    sum = 1;
    
    const { FSDM_raw_data } = cds.services;
    const db = FSDM_raw_data.transaction(req);
  
    const ContractAssignmentToFinancialContracts = await db.run(SELECT.from `AssignmentToContract` .where `BUSINESSPARTNERID = ${BusinessPartnerID}`);
   
   ContractAssignmentToFinancialContracts.forEach(element => {
        sum += parseInt(element.NOMINALAMOUNT);
    });
    console.log(sum);
    return sum;
}