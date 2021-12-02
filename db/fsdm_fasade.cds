namespace my.fsdm;

//@cds.persistence.exists
entity BusinessPartnerFasade{
	key BUSINESSPARTNERID	: String(128);
	key BUSINESSVALIDFROM	: Date;
	key BUSINESSVALIDTO		: Date;
	key SYSTEMVALIDFROM		: Timestamp;
	SYSTEMVALIDTO			: Timestamp;
	DATEOFBIRTH				: Date;
	GIVENNAME				: String(60);
	LASTNAME				: String(60);
	NAME					: String(256);
}

//@cds.persistence.exists
entity FinancialContractFasade {
	key FINANCIALCONTRACTID	: String(128);
	key IDSYSTEM			: String(40);
	BUSINESSVALIDFROM		: Date;
	BUSINESSVALIDTO			: Date;
	SYSTEMVALIDFROM			: Timestamp;
	SYSTEMVALIDTO			: Timestamp;
	EXPECTEDMATURITYDATE	: Date;
	NOMINALAMOUNTCURRENCY	: String(3);
	NOMINALAMOUNT			: Integer64;
	ORIGINALSIGNINGDATE		: Date;
};

//@cds.persistence.exists
entity BpContractAssignmentFasade {
	ROLEFASADE				: String(50);
	key FINANCIALCONTRACTID	: String(128);
	IDSYSTEM				: String(40);
	key BUSINESSPARTNERID	: String(128);
	BUSINESSVALIDFROM		: Date;
	BUSINESSVALIDTO			: Date;
	SYSTEMVALIDFROM			: Timestamp;
	SYSTEMVALIDTO			: Timestamp;
};

entity TotalCommitmentView as select from ContractAssignmentToFinancialContract join BusinessPartnerFasade
	on ContractAssignmentToFinancialContract.BUSINESSPARTNERID = BusinessPartnerFasade.BUSINESSPARTNERID join FinancialContractFasade
	on ContractAssignmentToFinancialContract.FINANCIALCONTRACTID = FinancialContractFasade.FINANCIALCONTRACTID
	
 {

	ContractAssignmentToFinancialContract.BUSINESSPARTNERID as BUSINESSPARTNERID,
	BusinessPartnerFasade.GIVENNAME,
	BusinessPartnerFasade.LASTNAME,
	ContractAssignmentToFinancialContract.FINANCIALCONTRACTID,
	FinancialContractFasade.NOMINALAMOUNT

};

entity ContractAssignmentToFinancialContract as select from BpContractAssignmentFasade join	FinancialContractFasade 
	on BpContractAssignmentFasade.FINANCIALCONTRACTID = FinancialContractFasade.FINANCIALCONTRACTID
	{
		BpContractAssignmentFasade.BUSINESSPARTNERID,
		FinancialContractFasade.FINANCIALCONTRACTID,
		FinancialContractFasade.NOMINALAMOUNT,
		FinancialContractFasade.NOMINALAMOUNTCURRENCY

	};
