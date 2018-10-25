Learning `Awesome Socket Programming`in C (mainly but you might also find Python implementations).

# Socket_Programming

### Get, Set, GO!!

## Basic Theory

Reading from [this](https://www.csd.uoc.gr/~hy556/material/tutorials/cs556-3rd-tutorial.pdf) link

    => Original Name - Berkley Sockets
    => Provide generic access to interprocess communication services
    => Uniquely Identified by -  internet address + an end-to-end protocol + a port number
    
   
![s](https://user-images.githubusercontent.com/30762887/47511901-bcdc8f80-d898-11e8-97d9-d0d664db6a04.png)


    => 2 Types
    - "Stream" Sockets for TCP
    - "Datagram" Sockets foro UDP

### Wonder how they Look ?
![screenshot from 2018-10-25 21-01-10](https://user-images.githubusercontent.com/30762887/47512226-5e63e100-d899-11e8-8bd5-4b08ec3fdb09.png)

### Server

    -> Passively waits for clints and responds to them 
    -> "Passive" Socket
### Client
    -> initiates the communication
    -> must know the address and the port of the server
    -> "active" socket
    
### Most Commnly used functions

    Socket          - Create new Communication endpoint
    Bind            - Attaches local address to socket
    Listen          - Announce willingness to accept connections
    Accept          - Block caller untill connection request arrives
    Connect         - Actively attempts to establish a connection
    Send            - Send some data over the connectin
    Recieve         - Recieve some data over the connectin
    Close           - Release the Connection

![screenshot from 2018-10-25 21-19-15](https://user-images.githubusercontent.com/30762887/47513387-c4516800-d89b-11e8-827f-32e354e4884a.png)

### Socket Creation
`int sockid = socket(family, type, protocol);`

    family
        `PF_INET`   => used for IPv4 protocols, Internet addresses 
        `PF_UNIX`   => Local Communication, File Address
    type
        `SOCK_STREAM`   => Usually used for TCP,(reliable, 2-way, connection-based service)
        `SOCK_DGRAM`    => Usually used for UDP,(unreliable, connectionless, messages of maximum length)
    Protocol
        `IPPROTO_TCP`
        `IPPROTO_UDP`
    On Faliure it returns `-1`
    NOTE, this just creats interface, Nothingelse!
### Socket Closing
 `status = close(sockid);`
 
        `sockid`  => The the file descriptor
        `status`  => `0` if successful; -1 if error
    



