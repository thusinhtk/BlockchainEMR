pragma solidity ^0.4.7;
//import "github.com/ethereum/dapp-bin/library/stringUtils.sol";
contract PPRContract {   
    string public nameOfDisease;
    uint public bill;
    address public patient; //owner
    address public provider;     

    modifier onlyProvider {
        if (msg.sender != provider) throw;
        _;
    }
    modifier onlyProvider_Patient {
        if (msg.sender != provider || msg.sender != patient) throw;
        _;
    }

    //Khi deploy phải cho biết PPR này của ai, ai quản lý
    function PPRContract(address _patient, address _provider, string _nameOfDisease, uint _bill)
    {
        patient = _patient;
        provider = _provider;
        nameOfDisease = _nameOfDisease;
        bill = _bill;
    }

    function getPPRInfo() constant returns (address _patient, address _provider, string _nameOfDisea, uint _bill)
    {   
        _patient = patient;
        _provider = provider;
        _nameOfDisea = nameOfDisease;
        _bill = bill;
        return (_patient, _provider,_nameOfDisea,_bill);
	}
    function updatePPR(string _nameOfDisease, uint _bill) onlyProvider() returns(bool) 
    {
        nameOfDisease = _nameOfDisease;
        bill = _bill;
        return true;
    } 
    //Library
    function stringToBytes32(string memory source) returns (bytes32 result) {
    assembly {
        result := mload(add(source, 32))
    }
}
}
