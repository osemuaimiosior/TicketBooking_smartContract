// SPDX-License-Identifier: MIT
pragma solidity = 0.8.19;

contract TicketBooking {
    address owner;
    uint[] booked;
    uint[] seats  = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];

    struct details{
        uint[] _seats;
    }

    mapping (uint => bool)bookings;
    mapping (address => uint[]) userdetails;
    
    //To book seats
    function bookSeats(uint[] calldata seatNumbers) public returns(string memory){
        require(seatNumbers.length <= 4, "You can only book 4 seats");
        require(seatNumbers.length != 0, "book a seats");

        for (uint i=0; i < seatNumbers.length; i++){
            bookings[seatNumbers[i]] = true;    
        }
            userdetails[msg.sender] = seatNumbers;

            for (uint i=0; i < seatNumbers.length; i++){
                booked.push(seatNumbers[i]);
                if (seatNumbers[i]==booked[i]){
                return ("seat already booked");
                }
            }
            
    }

    //To get available seats
    function showAvailableSeats() public  returns (uint[] memory) {
        for (uint i=0; i < booked.length; i++){
            seats[booked[i]] = seats[seats.length-1];
            seats.pop();
            }
            return (seats);
    }
    
    //To check availability of a seat
    function checkAvailability(uint seatNumber) view public returns (bool) {
        require(seatNumber !=0, "seat number can not be zero");
        require(seatNumber <=20, "Seat number can ot be greater than 20");
        
        if(bookings[seatNumber] == true){
            return (false);
        } else {
            return (true);
        }
    }
    
    //To check tickets booked by the user
    function myTickets() view public returns (uint[] memory) {
        return (userdetails[msg.sender]);
    }
}

