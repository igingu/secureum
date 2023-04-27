contract USDCCollateral {
  // This is a contract that's part of a larger system implementing a lending protocol
  // This particular contract concerns itself with allowing people to deposit USDC as collateral for their loans

  // A list of all the addresses lending
  address[] lenders;
  // A mapping to allow efficient is lender checks
  mapping(address => bool) isLender;
  
  address immutable lendingPlatform;
  address token = ERC20(USDC_ADDRESS);

  // We use a mapping to store the deposits of all lenders
  mapping (address => bool) balance;

  // USDC is very stable, so for every 1 USDC you can borrow 1 DAI or 1 USD worth of the other currency
  // Similar to other lending platforms, this lending system uses an oracle to determine how much one can borrow. 
  // The following describes how the system determines the max borrow value (ignoring precision for simplicity).
  // maxBorrow = (collateralRatio * underlying * underlyingValueUSD) / otherValueUSD 
  // This encodes the margin requirement of the system.
  uint collateralRatio = 100_000_000; 

  constructor() {
      periodicFee = 1;
      
      // approved collateral contracts are deployed by the lending platform
      // assume it is implemented correctly, and doesn't allow false collateral contracts.
      lendingPlatform = msg.sender;
  }

  function deposit(uint amount) external {
      require(!isLender[msg.sender]);
      isLender[msg.sender] = true;
      lenders.push(msg.sender);

      ...
  }

  function computeFee(uint periodicFee, uint balance) internal returns (uint) {
      // Assume this is a correctly implemented function that computes the share of fees that someone should receive based on their balance.
  }
 
  // this function is called monthly by the lending platform
  // We compute how much fees the lender should receive and send it to them
  function payFees() external onlyLendingPlatform {
      for (uint i=0; i<lenders.length; i++) {
        // Compute fee uses the balance of each lender
         uint fee = computeFee(periodicFee, balance[lenders[i]])
          token.transferFrom(lendingPlatform, lenders[i], fee);
      }
  }
  ...
}

Note: Questions 5 & 6 are based on the below code snippet. You will see the same code snippet for these two questions. The question is below the code snippet.

interface Lender {
    function onLiquidation() external;
}

interface IERC20 {
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address to, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
}

contract ERC20Collateral {
    // This contract is different from the one in Questions 1 & 2, please read it carefully!!!
    // This is a contract that's part of a larger system implementing a lending protocol

    // A list of all the addresses lending
    address[] lenders;
    // A mapping to allow efficient is lender checks
    mapping(address => bool) isLender;

    address immutable lendingPlatform = msg.sender;
    IERC20 token;

    // We use a mapping to store the deposits of all lenders
    mapping (address => uint256) balance;

    event Liquidation(address indexed lender, uint256 liquidatedAmount);

    constructor(IERC20 _token) {
        // Consider this contract is now part of a new permissionless factory
    // built by the protocol. The factory behaves very much like a UniswapV2 factory
    // that allows anyone to deploy their own collateral contract
        token = _token;
    }

    function deposit(uint amount) external {
        isLender[msg.sender] = true;
        lenders.push(msg.sender);

        token.transferFrom(msg.sender, lendingPlatform, amount);
        balance[msg.sender] += amount;
    }

    function liquidate(address lender) external {
        // We call the protocol factory to check for under-collateralization conditions
        require(lendingPlatform.undercollateralized(lender, balance[lender]));

        uint256 oldDeposit = balance[lender];
        balance[lender] = 0;
      uint256 fee = oldDeposit / 1000; // fee ratio == 1/1000

        // Give the caller his liquidation execution fee
        token.transferFrom(address(this), msg.sender, fee);
        // Transfer the rest of the collateral to the platform
        token.transferFrom(address(this), lendingPlatform, oldDeposit - fee);
        
        // Now ping the liquidated lender for him to be able to react to the liquidation
        // We need to use a low-level call because the lender might not be a contract
        // and the compiler checks code size on high-level calls, reverting if it's 0
        address(lender).call(abi.encodePacked(Lender.onLiquidation.selector));

        emit Liquidation(lender, oldDeposit - balance[lender]);
    }

    ...
}

// Assume as adding to the code shown for Questions 5 & 6
contract ERC20Collateral {
  // This is a contract that's part of a larger system implementing a lending protocol
    
    ...

function transferCollateral(
    address signer,
    address receiver,
    uint256 amount,
    bytes32 sigR,
    bytes32 sigS,
    uint8 sigV
  ) external {
    require(signer != address(0), "INVALID_SIGNER");

// Check that the signer is the one who actually signed the message
    require(signer == ecrecover(
    keccak256(abi.encodePacked(receiver, amount)),
      sigV,
      sigR,
      sigS
    ));

    deposits[receiver] += amount;
    deposits[signer] -= amount;
}

    ...
}
