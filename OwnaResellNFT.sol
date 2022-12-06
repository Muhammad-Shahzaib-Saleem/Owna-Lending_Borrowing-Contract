/**
 *Submitted for verification at polygonscan.com on 2022-12-05
*/

// 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
// 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2

// 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db
// 0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB

// 0x617F2E2fD72FD9D5503197092aC168c91465E7f2
// 0x17F6AD8Ef982297579C203069C1DbfFE4348c372


// File: @openzeppelin/contracts/utils/math/SafeMath.sol


// OpenZeppelin Contracts (last updated v4.6.0) (utils/math/SafeMath.sol)
pragma solidity ^0.8.0;

// CAUTION
// This version of SafeMath should only be used with Solidity 0.8 or later,
// because it relies on the compiler's built in overflow checks.

/**
 * @dev Wrappers over Solidity's arithmetic operations.
 *
 * NOTE: `SafeMath` is generally not needed starting with Solidity 0.8, since the compiler
 * now has built in overflow checking.
 */
library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function tryAdd(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            uint256 c = a + b;
            if (c < a) return (false, 0);
            return (true, c);
        }
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function trySub(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b > a) return (false, 0);
            return (true, a - b);
        }
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function tryMul(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
            // benefit is lost if 'b' is also tested.
            // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
            if (a == 0) return (true, 0);
            uint256 c = a * b;
            if (c / a != b) return (false, 0);
            return (true, c);
        }
    }

    /**
     * @dev Returns the division of two unsigned integers, with a division by zero flag.
     *
     * _Available since v3.4._
     */
    function tryDiv(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b == 0) return (false, 0);
            return (true, a / b);
        }
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers, with a division by zero flag.
     *
     * _Available since v3.4._
     */
    function tryMod(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b == 0) return (false, 0);
            return (true, a % b);
        }
    }

    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     *
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        return a + b;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return a - b;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     *
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        return a * b;
    }

    /**
     * @dev Returns the integer division of two unsigned integers, reverting on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator.
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return a / b;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * reverting when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return a % b;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * CAUTION: This function is deprecated because it requires allocating memory for the error
     * message unnecessarily. For custom revert reasons use {trySub}.
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        unchecked {
            require(b <= a, errorMessage);
            return a - b;
        }
    }

    /**
     * @dev Returns the integer division of two unsigned integers, reverting with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        unchecked {
            require(b > 0, errorMessage);
            return a / b;
        }
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * reverting with custom message when dividing by zero.
     *
     * CAUTION: This function is deprecated because it requires allocating memory for the error
     * message unnecessarily. For custom revert reasons use {tryMod}.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        unchecked {
            require(b > 0, errorMessage);
            return a % b;
        }
    }
}

// File: contracts/OwnaLendingBorrowing.sol

//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;






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
    address secondWallet = 0x7B46F9a8A33849745E8D89D1621a5D0CD20A8d34;
    

    uint256 public maximumLoanDuration = 90 days;

    uint256 public maximumNumberOfActiveLoans = 1000000;

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

    // struct MultiOffers{
    //     uint256 offerMaxVal;
    //     address[] lenders;
    //     address lenderSelect;
    // }

    //Fixed    []  public arr;

    //Flexible [] public flexArr;

    uint256 [] public arr ;

    mapping(uint256=>address[]) public lenders;
    //mapping(address => mapping(uint256 => MultiOffers)) public Offers;
    //mapping(uint256 => MultiOffers) public borrowerSelectLender;
    
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
        uint256 flexibleBorrowId;
        uint256 nftId;  
        address borrower;
        uint256 loanAmount;
        uint256 remainingLoanAmount;
        address lender;
        uint256 repayLoanFee;
        uint256 totalRepayDebt;
        uint256 totalBorrowerRepay;
        uint256 cummulatedFlexibleInterest;
        // uint256 loanAmountPlusCummulatedMonthlyInterest;
        uint256 dailyFlexibleInterest;
        address erc20Contract;
        address nftContract;
    }

    mapping (uint256=>Flexible) public flexibledLoanId;
    mapping (uint256=>FlexibledBorrow) public flexibleBorrow;


    struct FixedBorrow{
        uint256 fixedBorrowId;
        uint256 nftId;
        address borrower;
        uint256 loanAmount;
        uint256 remainingLoanAmount;
        address lender;
        uint256 repayLoanFee;
        uint256 totalRepayDebt;
        uint256 totalBorrowerRepay;
        uint256 cummulatedMonthlyInterest;
        // uint256 loanAmountPlusCummulatedMonthlyInterest;
        uint256 dailyFixInterest;
        address erc20Contract;
        address nftContract;
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

    mapping(uint256=>bool) public isNftExists;
    mapping(uint256=>bool) public isAccepted;

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



            
            
            //require(!isFixedOffering[fix.fixedId],"Already offering loan");
            //require(!isNftOffering[fix.nftId],"Already fixed loan offering NFT");
            require(fix.expiration == maximumExpiration,"Loan Offering(escrow) time is is only 72 hours");
            require(fix.durations <= maximumLoanDuration,"Duration of loan should be less than or equal 90 days");
            require(fix.durations != 0,"Duration of loan zero no acceptable");
            require(fix.entryFee == adminFeeInBasisPoints,"Admin fee should be 2% (200 in params) acceptable only");
            require(fix.minLoan > 0,"Minimum loan should be greater 0");
            require(fix.maxLoan > fix.minLoan,"Maximum should be greater than minimum loan");
            
            
            

             fixedLoanId[toalNoLoans] = fix;
             toalNoLoans = toalNoLoans.add(1);

             
            
             isFixedOffering[fix.fixedId] = true;

             //isNftOffering[fix.nftId] = true;

            //
            if(!isNftExists[fix.nftId]){
                IERC721(fix.nftContract).transferFrom(_borrower, address(this), fix.nftId);
                isNftExists[fix.nftId] = true;    
            }
            
            
            IERC20(fix.erc20Contract).transferFrom(fix.lender,address(this),fix.maxLoan);

            //Offers[msg.sender][fix.fixedId].offerMaxVal = fix.maxLoan;
            //lenders[fix.fixedId].push(msg.sender);
            //arr.push(fix.fixedId);

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

        //borrowerSelectLender[fix.fixedId].lenderSelect = fix.lender;

        //Calculate 2% fee debt on amount
        uint256 repayLoanInterestFee = percentageCalculate(_amount);


        // Calculate 1% fee debt Monthly
        uint256 repayMonthlyInterest = percentageMonthly(_amount);

        uint256 repayWithMonthly = repayMonthlyInterest.mul(3);
        
        //  Calculate 2% entry + 1% fee debt Monthly
        // uint256 loanAmountPlusCummulated = repayWithMonthly.add(_amount);

        uint256 totalDebt = repayWithMonthly.add(repayLoanInterestFee).add(_amount);
         
        uint256 dailyDebtInterest = dailyFixedInterest(totalDebt);

        //Remaining loan amount calculate
        uint256 remainLoan = fix.maxLoan - _amount;

        //Borrowing true
        isBorrowing[_id] = true;

        // 2% sending to secondWallet
        IERC20(fix.erc20Contract).transferFrom(_borrower, secondWallet, repayLoanInterestFee);

        // updating totalDebt
        totalDebt = totalDebt - repayLoanInterestFee;

        //Sleceted Loan amount send to the borrower
        IERC20(fix.erc20Contract).transfer(_borrower,  _amount);        

        //Remaining Loan amount send to the lender
        IERC20(fix.erc20Contract).transfer(fix.lender,remainLoan);


        isAccepted[_id] = true;

        //Store val in Structure of FixBorrow
         fixBorrow[fix.fixedId].fixedBorrowId = _id;
         fixBorrow[fix.fixedId].nftId = fix.nftId;
         fixBorrow[fix.fixedId].borrower = _borrower;
         fixBorrow[fix.fixedId].loanAmount = _amount;
         fixBorrow[fix.fixedId].remainingLoanAmount = remainLoan;
         fixBorrow[fix.fixedId].lender = fix.lender;
         fixBorrow[fix.fixedId].repayLoanFee = repayLoanInterestFee;
         fixBorrow[fix.fixedId].totalRepayDebt = totalDebt;
         fixBorrow[fix.fixedId].totalBorrowerRepay = totalDebt;
         fixBorrow[fix.fixedId].cummulatedMonthlyInterest = repayWithMonthly;
      //   fixBorrow[fix.fixedId].loanAmountPlusCummulatedMonthlyInterest = loanAmountPlusCummulated;
         fixBorrow[fix.fixedId].dailyFixInterest = dailyDebtInterest;
         fixBorrow[fix.fixedId].erc20Contract = fix.erc20Contract;
         fixBorrow[fix.fixedId].nftContract = fix.nftContract;

        //  for(uint256 i = 0; i <= arr.length - 1 ;i++){

        //     if(_id != i){

        //         Flexible memory flexible = flexibledLoanId[i];

        //         if(fixedLoanId[i].maxLoan != 0){
        //             IERC20(fix.erc20Contract).transfer(fixedLoanId[i].lender,fixedLoanId[i].maxLoan);

        //             delete fixedLoanId[i];

        //         }


        //         if(flexibledLoanId[i].maxLoan != 0){

        //             IERC20(flexible.erc20Contract).transfer(flexibledLoanId[i].lender,flexibledLoanId[i].maxLoan);

        //             delete flexibledLoanId[i];
        //         }
        //     }

        //         arr.pop();

        //         delete fixedLoanId[_id];

               
             

        // }
    
        

    emit FixBorrow(fixBorrow[fix.fixedId].borrower, fixBorrow[fix.fixedId].loanAmount, fixBorrow[fix.fixedId].lender,  fixBorrow[fix.fixedId].totalRepayDebt, fixBorrow[fix.fixedId].cummulatedMonthlyInterest, fixBorrow[fix.fixedId].dailyFixInterest);
         } 
        else {


            Flexible memory flexible = flexibledLoanId[_id];

            require(block.timestamp > flexible.expiration,"Loan Fixed offering  was only escrow for 72 hours");
            require(isFlexibledOffering[flexible.flexibleId],"Not existing Flexibled Loan Offering id");
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

            //  Calculate 2% entry + 1% fee debt Monthly
            // uint256 loanAmountPlusCummulated = repayWithMonthly.add(_amount);

            uint256 totalDebt = repayLoanInterestFee.add(repayMonthlyInterest).add(repayAcceptableDebt).add(_amount);

            uint256 dailyDebtFlexibleInterest = dailyFlexibledInterest(totalDebt);

            // 2% sending to secondWallet
            IERC20(flexible.erc20Contract).transferFrom(_borrower, secondWallet, repayLoanInterestFee);

            // updating totalDebt
            totalDebt = totalDebt - repayLoanInterestFee;


            IERC20(flexible.erc20Contract).transfer(_borrower,_amount);

            //Remaining Loan amount send to the lender
            IERC20(flexible.erc20Contract).transfer(flexible.lender,remainLoan);

            isBorrowing[_id] = true;

            // Store val in Structure of Flexible Borrow
            flexibleBorrow[flexible.flexibleId].flexibleBorrowId = _id;
            flexibleBorrow[flexible.flexibleId].nftId = flexible.nftId;
            flexibleBorrow[flexible.flexibleId].borrower = _borrower;
            flexibleBorrow[flexible.flexibleId].loanAmount = _amount;
            flexibleBorrow[flexible.flexibleId].remainingLoanAmount = remainLoan;
            flexibleBorrow[flexible.flexibleId].lender = flexible.lender;
            flexibleBorrow[flexible.flexibleId].repayLoanFee = repayLoanInterestFee;
            flexibleBorrow[flexible.flexibleId].totalRepayDebt = totalDebt;
            flexibleBorrow[flexible.flexibleId].totalBorrowerRepay = totalDebt;
            flexibleBorrow[flexible.flexibleId].cummulatedFlexibleInterest = repayWithMonthly;
            //flexibleBorrow[flexible.flexibleId].loanAmountPlusCummulatedMonthlyInterest = loanAmountPlusCummulated;
            flexibleBorrow[flexible.flexibleId].dailyFlexibleInterest  = dailyDebtFlexibleInterest;
            flexibleBorrow[flexible.flexibleId].erc20Contract = flexible.erc20Contract;
            flexibleBorrow[flexible.flexibleId].nftContract = flexible.nftContract;


        //  for(uint256 i = 0; i <= arr.length - 1;i++){

        //     if(_id != i){

        //         Fixed memory fix = fixedLoanId[i];

        //         if(flexibledLoanId[i].maxLoan != 0){
        //         IERC20(flexible.erc20Contract).transfer(flexibledLoanId[i].lender,flexibledLoanId[i].maxLoan);

        //         }

        //         if(fixedLoanId[i].maxLoan != 0){
        //         IERC20(fix.erc20Contract).transfer(fixedLoanId[i].lender,fixedLoanId[i].maxLoan);

        //         }


                
        //     }

        // }

        //    emit FlexibleBorrow(flexibleBorrow[flexible.flexibleId].borrower, flexibleBorrow[flexible.flexibleId].loanAmount, flexibleBorrow[flexible.flexibleId].lender,  flexibleBorrow[flexible.flexibleId].loanAmountPlusCummulatedMonthlyInterest, flexibleBorrow[flexible.flexibleId].cummulatedFlexibleInterest, flexibleBorrow[flexible.flexibleId].dailyFlexibleInterest);
        emit FlexibleBorrow(flexibleBorrow[flexible.flexibleId].borrower, flexibleBorrow[flexible.flexibleId].loanAmount, flexibleBorrow[flexible.flexibleId].lender,  flexibleBorrow[flexible.flexibleId].totalRepayDebt, flexibleBorrow[flexible.flexibleId].cummulatedFlexibleInterest,flexibleBorrow[flexible.flexibleId].dailyFlexibleInterest);
        }

    }


    function payBackToLenders(uint256 _id) public onlyOwner{

        //FixedBorrow memory fixedBorrowId = fixBorrow[_id];

        Fixed memory fix = fixedLoanId[_id];

        if(isFixedOffering[_id]){

            require(!isBorrowing[_id],"That's Lender fixed offer borrow by the borrower");

            IERC20(fix.erc20Contract).transfer(fix.lender,fix.maxLoan);

            delete fixedLoanId[_id];
   
        }else{

            Flexible memory flexible = flexibledLoanId[_id];

            require(!isBorrowing[_id],"That's Lender flexible offer borrow by the borrower");

            IERC20(flexible.erc20Contract).transfer(flexible.lender,flexible.maxLoan);

            delete flexibledLoanId[_id];
        }

         }


    function ownaPay(uint256 _id) public onlyOwner  {

        if(isFixedOffering[_id]){
            FixedBorrow memory fixedBorrow = fixBorrow[_id];

            uint256 repayFromOwnaToLender = fixedBorrow.loanAmount.add(fixedBorrow.cummulatedMonthlyInterest);

            IERC20(fixedBorrow.erc20Contract).transferFrom(Owner,fixedBorrow.lender,repayFromOwnaToLender);
            IERC721(fixedBorrow.nftContract).burn(fixedBorrow.nftId);

        }else{
            FlexibledBorrow memory flexibledBorrow = flexibleBorrow[_id];

            uint256 repayFromOwnaToLender = flexibledBorrow.loanAmount.add(flexibledBorrow.cummulatedFlexibleInterest);

            IERC20(flexibledBorrow.erc20Contract).transferFrom(Owner,flexibledBorrow.lender,repayFromOwnaToLender);

            IERC721(flexibledBorrow.nftContract).burn(flexibledBorrow.nftId);
 
        }

    }


    function repayFixLoan(uint256 _id,uint256 _selectAmount) internal {

        uint256 fixedSelectedAmount = _selectAmount;
        
        //Fixed Repay Loan Amount Calculation
        FixedBorrow memory fixedBorrow = fixBorrow[_id];
        //Fixed memory fix = fixedLoanId[_id];

        uint256 pendingFixedAmount = fixedBorrow.totalRepayDebt.sub(fixedSelectedAmount);
        // uint256 pendingFixedAmount = fixedBorrow.loanAmountPlusCummulatedMonthlyInterest.sub(fixedSelectedAmount);

        //FLexible Repay Loan Amount Calculation
     

        if(isFixedOffering[_id]){

            if(fixedBorrow.totalRepayDebt==fixedSelectedAmount){
            // if (fixedBorrow.loanAmountPlusCummulatedMonthlyInterest == fixedSelectedAmount){
        
        require(msg.sender==fixedBorrow.borrower,"Only Borrower can refund");

        IERC20(fixedBorrow.erc20Contract).transferFrom(fixedBorrow.borrower,address(this),fixedBorrow.totalRepayDebt);
//        IERC20(fixedBorrow.erc20Contract).transferFrom(fixedBorrow.borrower,address(this), fixedBorrow.loanAmountPlusCummulatedMonthlyInterest); // fixedBorrow.loanAmount.add(fixedBorrow.cummulatedMonthlyInterest)); // 4000 + 120 = $4120

        //Tranfer Repay Amount From Owna To Lender with Interest of 90 days
        uint256 repayFromOwnaToLender = fixedBorrow.loanAmount.add(fixedBorrow.cummulatedMonthlyInterest);
        IERC20(fixedBorrow.erc20Contract).transfer(fixedBorrow.lender,repayFromOwnaToLender);

          
         emit LoanFixRepaid (
                _id,
                fixedBorrow.borrower,
                fixedBorrow.lender,
                fixedBorrow.totalRepayDebt,
                // fixedBorrow.loanAmountPlusCummulatedMonthlyInterest,
                fixedBorrow.cummulatedMonthlyInterest,
                fixedBorrow.repayLoanFee
            );

            //burn nft Id from Borrower address
            IERC721(fixedBorrow.nftContract).burn(fixedBorrow.nftId);
            
            // delete fix.nftId;

            //Delete Structure of fixed borrowing
            delete fixBorrow[_id];
            delete fixedLoanId[_id];
    
        }else{
            uint256 newFixedRepay = pendingFixedAmount;

                fixBorrow[fixedBorrow.fixedBorrowId].totalRepayDebt = newFixedRepay;
                // fixBorrow[fixedBorrow.fixedBorrowId].loanAmountPlusCummulatedMonthlyInterest = newFixedRepay;

                IERC20(fixedBorrow.erc20Contract).transferFrom(fixedBorrow.borrower,address(this),fixedSelectedAmount);
        }
        }
    }

    function repayLoan(uint256 _id,uint256 _selectAmount) public{

        if(isFixedOffering[_id]){

            repayFixLoan(_id,_selectAmount);
        }else{

            repayFlexible(_id,_selectAmount);
        }
    }

    function repayFlexible(uint256 _id,uint256 _selectAmount) internal{
            
            uint256 flexibleSelectedAmount = _selectAmount;
            

            FlexibledBorrow memory flexibledBorrow = flexibleBorrow[_id];
        



        if(isFlexibledOffering[_id]){


             if(flexibledBorrow.totalRepayDebt == flexibleSelectedAmount){
               // if(flexibledBorrow.loanAmountPlusCummulatedMonthlyInterest == flexibleSelectedAmount){
              
                 //Flexible memory flexible = flexibledLoanId[_id];
            
            
            require(msg.sender==flexibledBorrow.borrower,"Only Borrower can refund");

            IERC20(flexibledBorrow.erc20Contract).transferFrom(flexibledBorrow.borrower,address(this),flexibledBorrow.totalRepayDebt);
            // IERC20(flexibledBorrow.erc20Contract).transferFrom(flexibledBorrow.borrower,address(this),flexibledBorrow.loanAmountPlusCummulatedMonthlyInterest);

            uint256 repayFromOwnaToLender = flexibledBorrow.loanAmount.add(flexibledBorrow.cummulatedFlexibleInterest);
            IERC20(flexibledBorrow.erc20Contract).transfer(flexibledBorrow.lender,repayFromOwnaToLender);


            IERC721(flexibledBorrow.nftContract).burn(flexibledBorrow.nftId);

           
            delete flexibleBorrow[_id];
            delete flexibledLoanId[_id];
            
             } 
            else{
                
                //Flexible memory flexible = flexibledLoanId[_id];

                //  FlexibledBorrow memory flexibledBorrow = flexibleBorrow[_id];
                // FlexibledBorrow memory flexibledBorrow = flexibleBorrow[_id];
                //require(_selectAmount<=flexibleBorrow[flexible.flexibleId].totalRepayDebt,"Selected Flexibled Loan Amount must be less than or equal to Repay Loan Amount");
                
                uint256 pendingFlexibledAmount = flexibledBorrow.totalRepayDebt.sub(flexibleSelectedAmount);
                // uint256 pendingFlexibledAmount = flexibledBorrow.loanAmountPlusCummulatedMonthlyInterest.sub(flexibleSelectedAmount);

                uint256 newFlexibledRepay = pendingFlexibledAmount;

                flexibleBorrow[flexibledBorrow.flexibleBorrowId].totalRepayDebt = newFlexibledRepay;
                // flexibleBorrow[flexibledBorrow.flexibleBorrowId].loanAmountPlusCummulatedMonthlyInterest = newFlexibledRepay;

                IERC20(flexibledBorrow.erc20Contract).transferFrom(flexibledBorrow.borrower,address(this),flexibleSelectedAmount);

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

            //require(!isFlexibledOffering[flexible.flexibleId],"Already offering loan");
            //require(!isNftOffering[flexible.nftId],"Already flexible offering  NFT ");
            require(flexible.entryFee == adminFeeInBasisPoints,"Admin fee should be 2% (200 in params) acceptable only");
            
            require(flexible.expiration == maximumExpiration,"Loan Offering time Finished");
            require(flexible.minLoan != 0,"Minimum loan should be 5000&");
            require(flexible.maxLoan > flexible.minLoan,"Maximum should be 7500&");

             flexibledLoanId[toalNoLoans] = flexible;
             toalNoLoans = toalNoLoans.add(1);

             //isNftOffering[flexible.nftId] = true;
             isFlexibledOffering[flexible.flexibleId] = true;

             if(!isNftExists[flexible.nftId]){
              IERC721(flexible.nftContract).transferFrom(_borrower, address(this), flexible.nftId);
                isNftExists[flexible.nftId] = true;    
            }

            //Transfer maximum loan amount from lender to Owna contract
            IERC20(flexible.erc20Contract).transferFrom(flexible.lender,address(this),flexible.maxLoan);
            //arr.push(fixedLoanId[fix.fixedId]);
            arr.push(flexible.flexibleId);
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