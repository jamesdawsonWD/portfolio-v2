pragma solidity 0.8.7;

import '@openzeppelin/contracts/token/ERC721/extensions/ERC721.sol';
import '@openzeppelin/contracts/utils/math/SafeMath.sol';

contract Avatars is ERC721 {
    using SafeMath for uint256;
    uint256 public lastAttempt;
    bool public isAuctionRequested;
    uint256 ATTEMPT_PRICE = 0.05 ether;
    uint256 MAXIMUM_TOTAL_ATTEMPTS = 1000000;
    modifier isParcelOwner() {
        if (msg.sender == ownerOf(1)) _;
    }

    constructor() public ERC721("Pass the MetaParcel", "PTP", address(this)) {
        _safeMint(msg.sender, 1);
    }

    function roll() private {
        // chain link random number
        if (attempt == winning) {
            distributeWinnings();
        } else {
            attemptFailed();
        }
    }

    function attempt() public payable isParcelOwner {
        require(msg.value >= ATTEMPT_PRICE, "Insufficient attempt price");
        roll();
    }

    function claim() public payable {
        require(ownerOf(1) == address(this), "The parcel is not home");
        require(msg.value >= ATTEMPT_PRICE, "Insufficient attempt price");
    }

    function requestAuction() public {
        isAuctionRequested = true;
    }

    function recover() public {
        require(lastAttempt >= 3 days, "Recover period not met");
        _transferHome(ownerOf(1), address(this), 1);
        roll();
        lastAttempt = now;
    }

    function distributeWinnings(address _winner) private {
        uint256 winnings = address(this).balance.mul(0.9);
        payable(_winner).transfer(winnings);
    }

    function attemptFailed() private {
        lastAttempt = now;
    }

    receive() external payable {
        totalPrize += msg.value;
    }
}
