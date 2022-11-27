//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/math/SafeMath.sol";





interface   IERC721  {
    event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);
    event Approval(address indexed owner, address indexed approved, uint256 indexed tokenId);
    event ApprovalForAll(address indexed owner, address indexed operator, bool approved);

    function balanceOf(address owner)  external view returns (uint256 balance);
    function ownerOf(uint256 tokenId) external view returns (address owner);

    function approve(address to, uint256 tokenId) external;
    function getApproved(uint256 tokenId) external view returns (address operator);

    function setApprovalForAll(address operator, bool _approved) external;
    function isApprovedForAll(address owner, address operator) external view returns (bool);

    function transferFrom(address from, address to, uint256 tokenId) external;
    function safeTransferFrom(address from, address to, uint256 tokenId) external;

    function safeTransferFrom(address from, address to, uint256 tokenId, bytes memory data) external;
    function _burn(uint256 tokenId) external;

    function burn(uint256 tokenId) external;
}




interface IERC20 {
    function transfer(address to, uint256 value) external returns (bool);

    function approve(address spender, uint256 value) external returns (bool);

    function transferFrom(address from, address to, uint256 value) external returns (bool);

    function totalSupply() external view returns (uint256);

    function balanceOf(address who) external view returns (uint256);

    function allowance(address owner, address spender) external view returns (uint256);

    event Transfer(address indexed from, address indexed to, uint256 value);

    event Approval(address indexed owner, address indexed spender, uint256 value);
}




contract OwnaLendingBorrowing {

    //Safe math library for underflow/overflow value
    using SafeMath for uint256;

    address Owner = msg.sender;

    uint256 public maximumLoanDuration = 90 days;

    uint256 public maximumNumberOfActiveLoans = 100;

    uint256 public toalNoLoans;

    //Admin fee 2% of Owna
    uint256 public  adminFeeInBasisPoints = 200;

    //Monthly 1% debt
    uint256 public monthlyDebt = 100;

    //Acceptable Debt for Flexible
    uint256 public  acceptableDebt = 12;

    uint256 public maximumExpiration = 72 hours;

     function name() external pure returns (string memory) {
        return "Owna-FR ";
    }

     function symbol() external pure returns (string memory) {
        return "Ownafr";
    }



    //Events
     event AdminFeeUpdated(
        uint256 newAdminFee
    );

    event FixedLoan(

        uint256 fixedId,
        uint256 durations,
        uint256 entryFee,
        uint256 apr,
        uint256 minLoan,
        uint256 maxLoan,
        uint256 startTime,
        uint256 nftId,
        address nftContract,
        address erc20Contract,
        uint256 expiration,
        address lender

    );

    event FlexibleLoan(
        uint256 flexibleId,
        uint256 entryFee,
        uint256 apr,
        uint256 minLoan,
        uint256 maxLoan,
        uint256 acceptable_debt,
        uint256 startTime,
        uint256 nftId,
        address nftContract,
        address erc20Contract,
        uint256 expiration,
        address lender

    );

      event FlexibleBorrow(
        address borrower,
        uint256 loanAmount,
        address lender,
        uint256 totalRepayDebt,
        uint256 cummulatedFlexibleInterest,
        uint256 dailyFlexibleInterest
        
      );

       event FixBorrow(
        address borrower,
        uint256 loanAmount,
        address lender,
        uint256 totalRepayDebt,
        uint256 cummulatedMonthlyInterest,
        uint256 dailyFixInterest
        
       );


    event LoanFixRepaid(
        uint256 repaidId,
        address borrower,
        address lender,
        uint256 totalRepaidDebt,
        uint256 monthlyRepaid,
        uint256 repaidLoanFee
    );

 


    //Structures

    //Fixed offer
    struct Fixed {
        uint256 fixedId;
        uint256 durations;
        uint256 entryFee;
        uint256 apr;
        uint256 minLoan;
        uint256 maxLoan;
        uint256 startTime;
        uint256 nftId;
        address nftContract;
        address erc20Contract;
        uint256 expiration;
        address lender;

    }

    mapping(uint256=>Fixed) public fixedLoanId;


    //Flexible offer
    struct Flexible{
        uint256 flexibleId;
        uint256 entryFee;
        uint256 apr;
        uint256 minLoan;
        uint256 maxLoan;
        uint256 acceptable_debt;
        uint256 startTime;
        uint256 nftId;
        address nftContract;
        address erc20Contract;
        uint256 expiration;
        address lender;
    }

    

      struct FlexibledBorrow{
        address borrower;
        uint256 loanAmount;
        uint256 remainingLoanAmount;
        address lender;
        uint256 repayLoanFee;
        uint256 totalRepayDebt;
        uint256 cummulatedFlexibleInterest;
        uint256 dailyFlexibleInterest;
        address erc20Contract;
    }

    mapping (uint256=>Flexible) public flexibledLoanId;
    mapping (uint256=>FlexibledBorrow) public flexibleBorrow;


    struct FixedBorrow{
        address borrower;
        uint256 loanAmount;
        uint256 remainingLoanAmount;
        address lender;
        uint256 repayLoanFee;
        uint256 totalRepayDebt;
        uint256 cummulatedMonthlyInterest;
        uint256 dailyFixInterest;
        address erc20Contract;
    }

    mapping (uint256=>FixedBorrow) public fixBorrow;

    struct RepayFixedLoan{
        uint256 id;
        uint256 pendingAmount;
        uint256 repayAmount;
        uint256 totalAmount;
    }

    mapping (address=>bool) public borrowerAddressIsWhitelisted;

    //Check loan is offering or borrowing already with mapping

    mapping(uint256=>bool) public isFixedOffering;
    mapping(uint256=>bool) public isFlexibledOffering;
    mapping(uint256=>bool) public isFixedRepaid;
    mapping(uint256=>bool) public isFlexibledRepaid;

    mapping(uint256=>bool) public isBorrowing;

    mapping(uint256=>bool) public isNftOffering;

    mapping(uint256=>uint256) public timeElapse;

   

    //Lending and Borrowing Functions

    /* FIXED Loan Offering 
       FIXED Borrowing
       FIXED Refund
    
    */

    function fixedLoanOffer( 
       
        uint _durations,
        uint _entryFee,
        uint _apr,
        uint _minLoan,
        uint _maxLoan,
        uint _nftId,
        address _nftContract,
        address _erc20Contract,
        uint256 _expiration,
        address _borrower,
        address _lender) public  {

           

            Fixed memory fix = Fixed({
                fixedId:toalNoLoans,
                durations:_durations,
                entryFee:_entryFee,
                apr:_apr,
                minLoan:_minLoan,
                maxLoan:_maxLoan,
                startTime:block.timestamp,
                nftId:_nftId,
                nftContract:_nftContract,
                erc20Contract:_erc20Contract,
                expiration: _expiration,
                lender:_lender      
            });
            
            require(!isFixedOffering[fix.fixedId],"Already offering loan");
            require(!isNftOffering[fix.nftId],"Already fixed loan offering NFT");
            require(fix.expiration == maximumExpiration,"Loan Offering(escrow) time is is only 72 hours");
            require(fix.durations <= maximumLoanDuration,"Duration of loan should be less than or equal 90 days");
            require(fix.durations != 0,"Duration of loan zero no acceptable");
            require(fix.entryFee == adminFeeInBasisPoints,"Admin fee should be 2% (200 in params) acceptable only");
            require(fix.minLoan > 0,"Minimum loan should be greater 0");
            require(fix.maxLoan > fix.minLoan,"Maximum should be greater than minimum loan");

             fixedLoanId[toalNoLoans] = fix;
             toalNoLoans = toalNoLoans.add(1);

             isFixedOffering[fix.fixedId] = true;

             isNftOffering[fix.nftId] = true;

            //
            IERC721(fix.nftContract).transferFrom(_borrower, address(this), fix.nftId);
            
            IERC20(fix.erc20Contract).transferFrom(fix.lender,address(this),fix.maxLoan);

            emit FixedLoan(fix.fixedId, fix.durations, fix.entryFee, fix.apr, fix.minLoan, fix.maxLoan, fix.startTime, fix.nftId, fix.nftContract, fix.erc20Contract, fix.expiration, fix.lender);

    }


    function borrowLoan(uint256 _id , address _borrower,uint256 _amount) public {

        if(isFixedOffering[_id]){

        Fixed memory fix = fixedLoanId[_id];

        require(block.timestamp > fix.expiration,"Loan Fixed offering  was only escrow for 72 hours");
        require(isFixedOffering[fix.fixedId],"Not existing Fixed Loan Offering id");
        require(msg.sender == _borrower,"Only Borrower can borrow");
        require(!isBorrowing[_id] , "Already borrowed fixed loan");
        require(borrowerAddressIsWhitelisted[_borrower],"Borrower not whitelisted for this contract");


        //Calculate 2% fee debt on amount
        uint256 repayLoanInterestFee = percentageCalculate(_amount);

        //Calculate 1% fee debt Monthly
        uint256 repayMonthlyInterest = percentageMonthly(_amount);

        

        uint256 repayWithMonthly = repayMonthlyInterest.mul(3);

        uint256 totalDebt = repayWithMonthly.add(repayLoanInterestFee).add(_amount);
         
        uint256 dailyDebtInterest = dailyFixedInterest(totalDebt);

        //Remaining loan amount calculate
        uint256 remainLoan = fix.maxLoan - _amount;

        //Borrowing true
        isBorrowing[_id] = true;

        //Sleceted Loan amount send to the borrower
        IERC20(fix.erc20Contract).transfer(_borrower,_amount);

        //Remaining Loan amount send to the lender
        IERC20(fix.erc20Contract).transfer(fix.lender,remainLoan);

        //Store val in Structure of FixBorrow
         fixBorrow[fix.fixedId].borrower = _borrower;
         fixBorrow[fix.fixedId].loanAmount = _amount;
         fixBorrow[fix.fixedId].remainingLoanAmount = remainLoan;
         fixBorrow[fix.fixedId].lender = fix.lender;
         fixBorrow[fix.fixedId].repayLoanFee = repayLoanInterestFee;
         fixBorrow[fix.fixedId].totalRepayDebt = totalDebt;
         fixBorrow[fix.fixedId].cummulatedMonthlyInterest = repayWithMonthly;
         fixBorrow[fix.fixedId].dailyFixInterest = dailyDebtInterest;
         fixBorrow[fix.fixedId].erc20Contract = fix.erc20Contract;

         emit FixBorrow(fixBorrow[fix.fixedId].borrower, fixBorrow[fix.fixedId].loanAmount, fixBorrow[fix.fixedId].lender,  fixBorrow[fix.fixedId].totalRepayDebt, fixBorrow[fix.fixedId].cummulatedMonthlyInterest, fixBorrow[fix.fixedId].dailyFixInterest);

        } else {


            Flexible memory flexible = flexibledLoanId[_id];

            require(block.timestamp > flexible.expiration,"Loan Fixed offering  was only escrow for 72 hours");
            require(isFlexibledOffering[flexible.flexibleId],"Not existing Fixed Loan Offering id");
            require(msg.sender == _borrower,"Only Borrower can borrow");
            require(!isBorrowing[_id] , "Already borrowed flexible loan");

            require(borrowerAddressIsWhitelisted[_borrower],"Borrower not whitelisted for this contract");

            //2% fee calculate
            uint256 repayLoanInterestFee = percentageCalculate(_amount);

            //%1 monthly
            uint256 repayMonthlyInterest = percentageMonthly(_amount);

            //12% acceptable debt
            uint256 repayAcceptableDebt = percentageAcceptableDebt(_amount);
            
            uint256 repayWithMonthly = repayMonthlyInterest.mul(1);

            //Remaining loan amount calculate
            uint256 remainLoan = flexible.maxLoan - _amount;

            uint256 totalDebt = repayLoanInterestFee.add(repayMonthlyInterest).add(repayAcceptableDebt).add(_amount);

            uint256 dailyDebtFlexibleInterest = dailyFlexibledInterest(totalDebt);

            IERC20(flexible.erc20Contract).transfer(_borrower,_amount);

            //Remaining Loan amount send to the lender
            IERC20(flexible.erc20Contract).transfer(flexible.lender,remainLoan);

            isBorrowing[_id] = true;

            //Store val in Structure of Flexible Borrow
            flexibleBorrow[flexible.flexibleId].borrower = _borrower;
            flexibleBorrow[flexible.flexibleId].loanAmount = _amount;
            flexibleBorrow[flexible.flexibleId].remainingLoanAmount = remainLoan;
            flexibleBorrow[flexible.flexibleId].lender = flexible.lender;
            flexibleBorrow[flexible.flexibleId].repayLoanFee = repayLoanInterestFee;
            flexibleBorrow[flexible.flexibleId].totalRepayDebt = totalDebt;
            flexibleBorrow[flexible.flexibleId].cummulatedFlexibleInterest = repayWithMonthly;
            flexibleBorrow[flexible.flexibleId].dailyFlexibleInterest  = dailyDebtFlexibleInterest;
            flexibleBorrow[flexible.flexibleId].erc20Contract = flexible.erc20Contract;


            emit FlexibleBorrow(flexibleBorrow[flexible.flexibleId].borrower, flexibleBorrow[flexible.flexibleId].loanAmount, flexibleBorrow[flexible.flexibleId].lender,  flexibleBorrow[flexible.flexibleId].totalRepayDebt, flexibleBorrow[flexible.flexibleId].cummulatedFlexibleInterest,flexibleBorrow[flexible.flexibleId].dailyFlexibleInterest);


        }

    }



    function repayLoan(uint256 _id,uint256 _selectAmount) public {

        //Fixed Repay Loan Amount Calculation
        FixedBorrow memory fixedBorrow = fixBorrow[_id];
            Fixed memory fix = fixedLoanId[_id];

        uint256 pendingFixedAmount = fixedBorrow.totalRepayDebt.sub(_selectAmount);

        //FLexible Repay Loan Amount Calculation
        FlexibledBorrow memory flexibledBorrow = flexibleBorrow[_id];

            Flexible memory flexible = flexibledLoanId[_id];

        uint256 pendingFlexibledAmount = flexibledBorrow.totalRepayDebt.sub(_selectAmount);




        if(isFixedOffering[_id]){

            

        // FixedBorrow memory fixedBorrow = fixBorrow[_id];

        if(fixedBorrow.totalRepayDebt==_selectAmount){
            
        require(!(isFixedRepaid[_id]),"Already Loan Repaid");
        require(msg.sender==fixedBorrow.borrower,"Only Borrower can refund");

        IERC20(fix.erc20Contract).transferFrom(fixedBorrow.borrower,address(this),fixedBorrow.totalRepayDebt);

        //Tranfer Repay Amount From Owna To Lender with Interest of 90 days
        uint256 repayFromOwnaToLender = fixedBorrow.loanAmount.add(fixedBorrow.cummulatedMonthlyInterest);
        IERC20(fix.erc20Contract).transfer(fixedBorrow.lender,repayFromOwnaToLender);

            isFixedRepaid[_id] = true;
         emit LoanFixRepaid (
                _id,
                fixedBorrow.borrower,
                fixedBorrow.lender,
                fixedBorrow.totalRepayDebt,
                fixedBorrow.cummulatedMonthlyInterest,
                fixedBorrow.repayLoanFee
            );

            //burn nft Id from Borrower address
            IERC721(fix.nftContract).burn(fix.nftId);
            
            // delete fix.nftId;

            //Delete Structure of fixed borrowing
            delete fixBorrow[_id];
            delete fixedLoanId[_id];
    
        }else{

                uint256 newFixedRepay = pendingFixedAmount;

                fixBorrow[fix.fixedId].totalRepayDebt = newFixedRepay;

                IERC20(fix.erc20Contract).transferFrom(fixedBorrow.borrower,address(this),_selectAmount);

        }
        

        //For Erc20 Contract to interact with interface of IERC20
        
        } else{


            if(flexibledBorrow.totalRepayDebt == _selectAmount){
                require(msg.sender==flexibledBorrow.borrower,"Only Borrower can refund");

            //uint256 endTime = block.timestamp;

            //uint256 timeWithDays = endTime - flexible.startTime; 

             

            

              //uint256 payingTime = timeElapse[timeIndays(flexible.startTime, endTime)];


            IERC20(flexible.erc20Contract).transferFrom(flexibledBorrow.borrower,address(this),flexibledBorrow.totalRepayDebt);

            uint256 repayFromOwnaToLender = flexibledBorrow.loanAmount.add(flexibledBorrow.cummulatedFlexibleInterest);
            IERC20(flexible.erc20Contract).transfer(flexibledBorrow.lender,repayFromOwnaToLender);


            IERC721(flexible.nftContract).burn(flexible.nftId);

            //Delete Structure of fixed borrowing
            delete flexibleBorrow[_id];
            delete flexibledLoanId[_id];
            
            }else{

                uint256 newFlexibledRepay = pendingFlexibledAmount;

                flexibleBorrow[flexible.flexibleId].totalRepayDebt = newFlexibledRepay;

                IERC20(flexible.erc20Contract).transferFrom(flexibledBorrow.borrower,address(this),_selectAmount);



            }

            
            


        }
        
    }



    /*FLEXIBLE LOAN OFFERING FUNCTIONS*/

    function flexibledLoanOffer(   
        uint256 _entryFee,
        uint256 _apr,
        uint256 _minLoan,
        uint256 _maxLoan,
        uint256 _acceptable_debt,
        uint256 _nftId,
        address _nftContract,
        address _erc20Contract,
        uint256 _expiration,
        address _borrower,
        address _lender) public {

             Flexible memory flexible = Flexible({
                flexibleId:toalNoLoans,
                entryFee:_entryFee,
                apr:_apr,
                minLoan:_minLoan,
                maxLoan:_maxLoan,
                acceptable_debt: _acceptable_debt,
                startTime:block.timestamp,
                nftId:_nftId,
                nftContract:_nftContract,
                erc20Contract:_erc20Contract,
                expiration:_expiration,
                lender:_lender      
            });

            

            require(!isFlexibledOffering[flexible.flexibleId],"Already offering loan");
            require(!isNftOffering[flexible.nftId],"Already flexible offering  NFT ");
            require(flexible.entryFee == adminFeeInBasisPoints,"Admin fee should be 2% (200 in params) acceptable only");
            
            require(flexible.expiration == maximumExpiration,"Loan Offering time Finished");
            require(flexible.minLoan != 0,"Minimum loan should be 5000&");
            require(flexible.maxLoan > flexible.minLoan,"Maximum should be 7500&");

             flexibledLoanId[toalNoLoans] = flexible;
             toalNoLoans = toalNoLoans.add(1);

             isNftOffering[flexible.nftId] = true;
             isFlexibledOffering[flexible.flexibleId] = true;

            IERC721(flexible.nftContract).transferFrom(_borrower, address(this), flexible.nftId);


            //Transfer maximum loan amount from lender to Owna contract
            IERC20(flexible.erc20Contract).transferFrom(flexible.lender,address(this),flexible.maxLoan);

            emit FlexibleLoan(flexible.flexibleId, flexible.entryFee, flexible.apr, flexible.minLoan, flexible.maxLoan, flexible.acceptable_debt, flexible.startTime, flexible.nftId, flexible.nftContract, flexible.erc20Contract, flexible.expiration, flexible.lender);


    }






    //Formula's functions

    function percentageCalculate ( uint256 _val ) public view returns(uint256){

        uint256 percent =  _val.div(100).mul(adminFeeInBasisPoints)/100;

        return percent;
    }

    function percentageMonthly(uint256 _val) public view returns(uint256){

            uint256 percentMonthly = _val.div(monthlyDebt);

            return percentMonthly;

    }

   

    function percentageAcceptableDebt(uint _val) public view returns(uint256){

        uint256 percentAcceptableDebt = _val.div(100).mul(acceptableDebt);

        return percentAcceptableDebt;
    }

    function timeIndays (uint256 _strt, uint256 _end) public pure   returns(uint256 timeInday, uint256 timeInHours, uint256 timeInMinutes){

           uint256 currentTime = _end - _strt;
            
           timeInday =  currentTime / 86400;

           timeInHours = currentTime / 60 minutes;

           timeInMinutes = currentTime / 60 seconds;

    }

    function dailyFixedInterest (uint256 _val) public pure returns(uint256 interest) {

        uint256 interestDaily = _val.div(90);

        return interest = interestDaily;

        

    }

    function dailyFlexibledInterest(uint256 _val) public pure returns(uint256 interest) {

        uint256  interestDaily = _val.div(365);

         return interest = interestDaily;
    }

    //Admin Functions
    function updateMaximumLoanDuration(uint256 _newMaximumLoanDuration) external   onlyOwner {
        require(_newMaximumLoanDuration <= uint256(~uint32(0)), 'loan duration cannot exceed space alotted in struct');
        maximumLoanDuration = _newMaximumLoanDuration;
    }

    

    function updateMaximumNumberOfActiveLoans(uint256 _newMaximumNumberOfActiveLoans) external  onlyOwner {
        maximumNumberOfActiveLoans = _newMaximumNumberOfActiveLoans;
    }

    

    function updateAdminFee (uint256 _newAdminFeeInBasisPoints) external onlyOwner{
        adminFeeInBasisPoints = _newAdminFeeInBasisPoints;
    }

    function whitelistBorrower(address _borrower, bool _setWhitelist) public onlyOwner{

        borrowerAddressIsWhitelisted[_borrower] = _setWhitelist;
    }

    //Modifier
    modifier onlyOwner {
        require(msg.sender == Owner, "That's only owner can run this function");
        _;
    }

  

}