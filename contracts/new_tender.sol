pragma solidity >=0.5.2;
pragma experimental ABIEncoderV2;

contract New_Tender {
    uint public tenderId = 0;
    uint public userId = 0;

    
    
    Users[] public users;
    User_credentials[] public user_credentials;

    struct Users {
        uint userId;
        Master_Struct masterStruct;
    }

    struct User_credentials {
        uint userId;
        string Uname;
        string Password;
    }

    struct BasicInfo {
        string tender_type;
        string tender_name;
        address owner_address;
    }

    struct WorkItems {
        string Title;
        string Description;
        uint Tender_Value;
        uint Bid_Validity_Days;
        string Location;
    }

    struct CriticalDetails {
        string Media_Publish_Date;
        string Bit_Start_Date;
        string Bid_End_Date;
    }

    struct Master_Struct {
        BasicInfo basicInfo;
        WorkItems workItems;
        CriticalDetails criticalDetails;
    }

    mapping(uint => Master_Struct) public tender_details;

    function summa() public returns(uint){
        tenderId = tenderId + 1;
        return tenderId;
    }

    function signup(
        string memory Uname,
        string memory Password
    ) public returns (string memory) {
        userId = userId + 1;   
        User_credentials memory newUser;
        newUser.userId = userId;
        newUser.Uname = Uname;
        newUser.Password = Password;
        user_credentials.push(newUser);
        return "User Created";

    }

    function login() public view returns (User_credentials[] memory) {
        return user_credentials;
    }
    function User_tenders() public view returns (Users[] memory) {
        return users;
    }

    function createTender(
        string memory title,
        string memory description,
        uint tenderValue,
        uint bidValidityDays,
        string memory location,
        string memory mediaPublishDate,
        string memory bidStartDate,
        string memory bidEndDate
    ) public payable  returns (string memory){
        // tenderId++;
        // tender_details[tenderId].basicInfo.id = tenderId;
        // tender_details[tenderId].basicInfo.owner_address = msg.sender;
        // tender_details[tenderId].basicInfo.tender_type = "Work";
        // tender_details[tenderId]
        //     .basicInfo
        //     .tender_name = "Construction of a new building";
        // tender_details[tenderId].workItems.Title = title;
        // tender_details[tenderId].workItems.Description = description;
        // tender_details[tenderId].workItems.Tender_Value = tenderValue;
        // tender_details[tenderId].workItems.Bid_Validity_Days = bidValidityDays;
        // tender_details[tenderId].workItems.Location = location;
        // tender_details[tenderId]
        //     .criticalDetails
        //     .Media_Publish_Date = mediaPublishDate;
        // tender_details[tenderId].criticalDetails.Bit_Start_Date = bidStartDate;
        // tender_details[tenderId].criticalDetails.Bid_End_Date = bidEndDate;

        BasicInfo memory basicInfo;
        basicInfo.owner_address = msg.sender;
        basicInfo.tender_type = "Work";
        basicInfo.tender_name = "Construction of a new building";

        WorkItems memory workItems;
        workItems.Title = title;
        workItems.Description = description;
        workItems.Tender_Value = tenderValue;
        workItems.Bid_Validity_Days = bidValidityDays;
        workItems.Location = location;

        CriticalDetails memory criticalDetails;
        criticalDetails.Media_Publish_Date = mediaPublishDate;
        criticalDetails.Bit_Start_Date = bidStartDate;
        criticalDetails.Bid_End_Date = bidEndDate;

        Master_Struct memory masterStruct;
        masterStruct.basicInfo = basicInfo;
        masterStruct.workItems = workItems;
        masterStruct.criticalDetails = criticalDetails;

        Users memory newUser;
        newUser.userId = userId;
        newUser.masterStruct = masterStruct;

        users.push(newUser);

        return "User Created";
    }
}
