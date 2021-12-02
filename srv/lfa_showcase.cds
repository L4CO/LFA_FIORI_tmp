using { my.fsdm as fsdm } from '../db/fsdm_fasade';

service FSDM_raw_data @(path:'/browse_FSDM_raw_data') {
	entity BusinessPartnerFasade			as projection on fsdm.BusinessPartnerFasade;
	entity FinancialContractFasade			as projection on fsdm.FinancialContractFasade;
	entity BpContractAssignmentFasade		as projection on fsdm.BpContractAssignmentFasade;
	entity AssignmentToContract				as projection on fsdm.ContractAssignmentToFinancialContract;
}


service TotalCommitmentView @(path:'/browse_STR_TotalCommitmentView') {
	entity TotalCommitmentView		    as projection on fsdm.TotalCommitmentView;
}