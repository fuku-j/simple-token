/// Access control
contract Ownerable {
    address private _owner;

    constructor() {
        _owner = msg.sender;
    }

    function owner() internal view returns (address owner_) {
        owner_ = _owner;
    }

    modifier onlyOwner() {
        require(_owner == msg.sender, "caller is only owner.");
        _;
    }
}
