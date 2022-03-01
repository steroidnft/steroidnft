// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

import {StringUtils} from "./libraries/StringUtils.sol";
import {Base64} from "./libraries/Base64.sol";


contract Child is ERC721URIStorage {
    address owner;
    uint eventId=1;
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    constructor() ERC721("Ticket service","TSC"){
        _tokenIds.increment();
        owner=msg.sender;
    }
    modifier onlyOwner(){
        require(msg.sender==owner,"You are not the owner");
        _;
    }
    mapping(uint=>string) eventName;
    mapping(uint=>uint) totalEventTicket;
    // mapping(uint=>(mapping(address=>uint))) totalTicketOwn;
    mapping(uint=>mapping(address=>bool)) haveTicket;
    // mapping(address=>uint) eventOrganiserId;
    mapping(uint=>address) eventOrganiserAddress;
    mapping(uint=>uint) eventTicketPrice;
    mapping(uint=>uint) eventEndTime;
    
    string svgPartOne =
        '<svg xmlns="http://www.w3.org/2000/svg" width="270" height="270" fill="none"><path fill="url(#B)" d="M0 0h270v270H0z"/><defs><filter id="A" color-interpolation-filters="sRGB" filterUnits="userSpaceOnUse" height="270" width="270"><feDropShadow dx="0" dy="1" stdDeviation="2" flood-opacity=".225" width="200%" height="200%"/></filter></defs><path d="M72.863 42.949c-.668-.387-1.426-.59-2.197-.59s-1.529.204-2.197.59l-10.081 6.032-6.85 3.934-10.081 6.032c-.668.387-1.426.59-2.197.59s-1.529-.204-2.197-.59l-8.013-4.721a4.52 4.52 0 0 1-1.589-1.616c-.384-.665-.594-1.418-.608-2.187v-9.31c-.013-.775.185-1.538.572-2.208a4.25 4.25 0 0 1 1.625-1.595l7.884-4.59c.668-.387 1.426-.59 2.197-.59s1.529.204 2.197.59l7.884 4.59a4.52 4.52 0 0 1 1.589 1.616c.384.665.594 1.418.608 2.187v6.032l6.85-4.065v-6.032c.013-.775-.185-1.538-.572-2.208a4.25 4.25 0 0 0-1.625-1.595L41.456 24.59c-.668-.387-1.426-.59-2.197-.59s-1.529.204-2.197.59l-14.864 8.655a4.25 4.25 0 0 0-1.625 1.595c-.387.67-.585 1.434-.572 2.208v17.441c-.013.775.185 1.538.572 2.208a4.25 4.25 0 0 0 1.625 1.595l14.864 8.655c.668.387 1.426.59 2.197.59s1.529-.204 2.197-.59l10.081-5.901 6.85-4.065 10.081-5.901c.668-.387 1.426-.59 2.197-.59s1.529.204 2.197.59l7.884 4.59a4.52 4.52 0 0 1 1.589 1.616c.384.665.594 1.418.608 2.187v9.311c.013.775-.185 1.538-.572 2.208a4.25 4.25 0 0 1-1.625 1.595l-7.884 4.721c-.668.387-1.426.59-2.197.59s-1.529-.204-2.197-.59l-7.884-4.59a4.52 4.52 0 0 1-1.589-1.616c-.385-.665-.594-1.418-.608-2.187v-6.032l-6.85 4.065v6.032c-.013.775.185 1.538.572 2.208a4.25 4.25 0 0 0 1.625 1.595l14.864 8.655c.668.387 1.426.59 2.197.59s1.529-.204 2.197-.59l14.864-8.655c.657-.394 1.204-.95 1.589-1.616s.594-1.418.609-2.187V55.538c.013-.775-.185-1.538-.572-2.208a4.25 4.25 0 0 0-1.625-1.595l-14.993-8.786z" fill="#fff"/><defs><linearGradient id="B" x1="0" y1="0" x2="270" y2="270" gradientUnits="userSpaceOnUse"><stop stop-color="#cb5eee"/><stop offset="1" stop-color="#0cd7e4" stop-opacity=".99"/></linearGradient></defs><text x="32.5" y="231" font-size="27" fill="#fff" filter="url(#A)" font-family="Plus Jakarta Sans,DejaVu Sans,Noto Color Emoji,Apple Color Emoji,sans-serif" font-weight="bold">';
    string svgPartTwo = "</text></svg>";
    // function pause() public onlyOwner {
    //     _pause();
    // }

    // function unpause() public onlyOwner {
    //     _unpause();
    // }

    function bookEvent( string memory _eventName,uint amount,uint _priceOfTicket,uint _days)
        external payable returns(uint)
    {
        require(msg.value>=0.3 ether,"Not enough eth paid");
        require(eventOrganiserAddress[eventId]==address(0),"This id is already booked");
        eventName[eventId]=_eventName;
        totalEventTicket[eventId]=amount;
        eventOrganiserAddress[eventId]=msg.sender;
        eventTicketPrice[eventId]=_priceOfTicket;
        eventEndTime[eventId]=block.timestamp+( _days * 1 days);
        uint currentEventId=eventId;
        eventId++;
        return currentEventId;
    }
    function buyEventTicket(uint _eventId,string memory _name) external payable{
        require(msg.value>=eventTicketPrice[_eventId],"Not enought to buy this ticket");
        require(!haveTicket[_eventId][msg.sender],"You have already bought the ticket");
        require(totalEventTicket[_eventId]>0,"All tickets are sold");
        require(block.timestamp <= eventEndTime[_eventId],"Deadline to buy this ticket is passed");

        uint currentId=_tokenIds.current();
        string memory finalSvg=string(abi.encodePacked(svgPartOne,_name,".",Strings.toString(_eventId),"#",Strings.toString(currentId),svgPartTwo));
        
        // string memory json = Base64.encode(
        //     bytes(
        //         string(
        //             abi.encodePacked(
        //                 '{"name": "',
        //                 _name,
        //                 '", "description": "A pass for event : "',eventName[_eventId], "image": "data:image/svg+xml;base64,',
        //                 Base64.encode(bytes(finalsvg)),
        //                 '","length":"',
        //                 strLen,
        //                 '"}'
        //             )
        //         )
        //     )
        // );
        totalEventTicket[_eventId]-=1;
        haveTicket[_eventId][msg.sender]=true;
        _safeMint(msg.sender,currentId);

        _tokenIds.increment();
    }
    function getEventOrganiserAddress(uint _eventId) external view returns(address){
        return eventOrganiserAddress[_eventId];
    }
}
