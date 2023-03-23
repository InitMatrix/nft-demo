// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.9;
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract Partner is ERC721, Ownable {
    constructor(
        string memory name,
        string memory symbol,
        string memory baseTokenURI
    ) ERC721(name, symbol) {
        //todo 初始化
    }

    using Counters for Counters.Counter;
    Counters.Counter private _tokenIdTracker;

    // 事件:授权
    event Impower(address from, address to, uint level);

    struct Node {
        uint level;
        uint256 tonenId;
        address frontNode;
        address[] chains;
    }
    // 节点列表
    mapping(address => Node) _nodes;
    // 白名单列表
    mapping(address => mapping(address => bool)) _whiteList;

    // 管理员:授权一级节点
    function impower(address[] memory targets) public view onlyOwner {
        // todo
        for (uint i = 0; i < targets.length; i++) {
            // t=targets[i];
            // _nodes[t]=Node();
        }
    }

    // 增加白名单
    function addWhite() public {
        // todo
    }

    // 移除白名单
    function removeWhite(address to) public {
        // todo
    }

    // 绑定等级关系
    function mint() public {
        // 1 判断本地址是否已经是节点，如果是，跳过
        // 2 判断本地址是否位于上级节点的白名单中，如果不是，跳过
        // 3 判断父节点是否处于最大节点等级中，如果是，跳过

        _mint(_msgSender(), _tokenIdTracker.current());
        _tokenIdTracker.increment();
    }
}
