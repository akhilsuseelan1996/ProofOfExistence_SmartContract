pragma solidity 0.5.0;


contract Proofs{

    struct FileDetails{
        uint  timestamp;
        string owner;
    }

    mapping(string => FileDetails) Files;

    event logFileAddedStatus(bool status, uint timestamp, string owner, string fileHash);

    function setOwner(string memory owner, string memory fileHash) public{

        if(Files[fileHash].timestamp == 0){
            Files[fileHash] = FileDetails(block.timestamp, owner);   

            emit logFileAddedStatus(true,block.timestamp, owner, fileHash);
        }
        else{
             emit logFileAddedStatus(false, block.timestamp, owner, fileHash);
        }
    }

    function getFile(string memory fileHash) public view returns (uint  timestamp, string  memory owner)  {
        return (Files[fileHash].timestamp, Files[fileHash].owner);
    }
}