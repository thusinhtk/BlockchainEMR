pragma solidity ^0.4.7;

contract SummaryContract{    
    
    struct PPR_Status{
        address pprAddress; 
        bool status; // Tồn tại (true) or không tồn tại(false)
        uint timeStamp; //Created date.
    }
    struct SC{
        address ethAddr;
        PPR_Status[] pprStatus;
        string scName;
        uint scType;// 0: patient - 1:provider
    }
    SC sc;
    //Add new SC when deploy
    function SummaryContract(address _ethAddr, string _scName, uint _scType){
        sc.ethAddr = _ethAddr;
        sc.scName = _scName;
        sc.scType = _scType;
    }

    function scAddNewPPR(address _pprAddress) returns (bool)
    { 
        sc.pprStatus.push(PPR_Status({
                pprAddress: _pprAddress,
                status: true,
                timeStamp: now
        }));
	}

    function updateSC(string _scName, uint _scType) returns (bool)
    {
        sc.scName = _scName;
        sc.scType = _scType;
        return true;
	}
    
    function getSCInfo()constant returns (string, uint)
    {   
        return (
            sc.scName,
            sc.scType
        );
	}

    function getPPRCount() constant returns (uint)
    {
        PPR_Status[] pprStatus = sc.pprStatus;

        return pprStatus.length;
    }
    function getPPRStatus() constant returns (address, bool, uint)
    {
        PPR_Status[] pprStatus = sc.pprStatus;
        PPR_Status pprStt = pprStatus[_idPPRStatus];

        return(
            pprStt.pprAddress,
            pprStt.status,
            pprStt.timeStamp
        );
    }   
    //Library
    function bytes32ToString(bytes32 x) constant returns (string) {
        bytes memory bytesString = new bytes(32);
        uint charCount = 0;
        for (uint j = 0; j < 32; j++) {
            byte char = byte(bytes32(uint(x) * 2 ** (8 * j)));
            if (char != 0) {
                bytesString[charCount] = char;
                charCount++;
            }
        }
        bytes memory bytesStringTrimmed = new bytes(charCount);
        for (j = 0; j < charCount; j++) {
            bytesStringTrimmed[j] = bytesString[j];
        }
        return string(bytesStringTrimmed);
    }
}
