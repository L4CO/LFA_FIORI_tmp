const { foreach } = require('@sap/cds');
const cds = require('@sap/cds');


const { BusinessPartnerFasade,
        FinancialContractFasade,
        BpContractAssignmentFasade,
        TotalCommitmentView } = cds.entities;


module.exports = srv => {

/*    srv.on('READ', 'TotalCommitmentView' , async (req) => {
        const comitments = await SELECT.from (TotalCommitmentView);
        const result;
        comitments.foreach(element => {

        });        


        return comitments;
    })
*/

/*    srv.on('READ', 'TotalCommitment', async (req) => {
        
        const comitments = await SELECT.from (TotalCommitment);

        comitments.forEach(element => {
            getSum(element.BUSINESSPARTNERID).then(function(sum){
                element.FINANCIALCONTRACT_COUNT = sum.FINANCIALCONTRACT_COUNT;
                element.TOTAL = sum.TOTAL;
            })
//            console.log(sum);
        });

        return comitments;
    })
*/
}

/*

async function getSum(partnerID){

    const constractAssignement = await SELECT.from (BpContractAssignmentFasade).where( { "BUSINESSPARTNERID" : partnerID });
//    console.log(constractAssignement.length);
    sum = 0;
    total = 0;

    let loopAtAssignements = new Promise( (resolve)=> {
        constractAssignement.forEach(element => {
            getLoanAmount(element.FINANCIALCONTRACTID).then( (amount) => {
                sum += parseInt(amount);
                total++;
//                console.debug('sum: ',sum, 'total: ', total);
            });

            console.debug('sum: ',sum, 'total: ', total);
        });
//        console.debug('sum: ',sum, 'total: ', total);
        resolve( JSON.parse(`{ "FINANCIALCONTRACT_COUNT" : ${sum} , "TOTAL" : ${total} }`));
    });

    let result = await loopAtAssignements;
//    console.debug('result :', result); 
    return result;
}

async function getLoanAmount(contractID)
{
     let constractAssignement = await SELECT.from (FinancialContractFasade).where( { "FINANCIALCONTRACTID" : contractID });
//    console.debug('contr ID: ',contractID);
//    console.debug('nominal: ',constractAssignement[0].NOMINALAMOUNT);
    return constractAssignement[0].NOMINALAMOUNT;
}
*/