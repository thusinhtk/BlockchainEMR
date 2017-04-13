pragma solidity ^0.4.7;
contract RegistrarContract {

    struct Account{
        string nickName;
        address ethAddr;
        address SC;
        string patientID;
    }            

    Account[] public listAccs;

    string public pprURL;
    function setUrlPPR(string _url){
        pprURL = _url;
    }
    function getUrlPPr()constant returns(string)
    {
        return pprURL;
    }

    function addNewRC(string _nickName, address _ethAddr, address scID) returns (bool)
    {
        uint rcID = listAccs.length++;
        Account a = listAccs[rcID];
        a.nickName = _nickName;
        a.ethAddr = _ethAddr;
        a.scID = scID ;
        return true;
    }  
    function getRC(uint id)constant returns (string, address, uint)
    {
        return (
            listAccs[id].nickName,
            listAccs[id].ethAddr,
            listAccs[id].scID
        );
    }

    function getNumberOfAccounts() constant returns (uint)
    {
        return listAccs.length;
    }

    function SearchIndex_ByAddress(address addr) constant returns (uint)
    {
        uint n=listAccs.length;

        for (uint i = 0; i < n; i++) {
            if(addr ==  listAccs[i].ethAddr )
                return i;
        }        
    }
}