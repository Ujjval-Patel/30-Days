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
 
        `sockid`  => The file descriptor
        `status`  => `0` if successful; -1 if error
        NOTE, This free up the port used by the socket
        
 ### Specifying Address
   ```
   struct sockaddr {
        unsigned short sa_family; /* Address family (e.g. AF_INET) */
        char sa_data[14]; /* Family-specific address information */
        }
   ```
  Particularly for TCP/IP
    
```
    struct in_addr {
        unsigned long s_addr; /* Internet address (32 bits) */
    }
    struct sockaddr_in {
        unsigned short sin_family; /* Internet protocol (AF_INET) */
        unsigned short sin_port; /* Address port (16 bits) */
        struct in_addr sin_addr; /* Internet address (32 bits) */
        char sin_zero[8]; /* Not used */
    }
```

### Bind
`int status = bind(sockid, &addrport, size);`

    Associates and reserves a port for use by the socket
    
    addrport
         => The (IP) address and port number of the machine
         => For TCP/IP server, internet address is usually set to INADDR_ANY, i.e., chooses any incoming interface
    size
        The size of addrport
    status
        On faliure -1 is returned
```
int sockid;
struct sockaddr_in addrport;
sockid = socket(PF_INET, SOCK_STREAM, 0);

addrport.sin_family = AF_INET;
addrport.sin_port = htons(5100);
addrport.sin_addr.s_addr = htonl(INADDR_ANY);
if(bind(sockid, (struct sockaddr *) &addrport, sizeof(addrport))!= -1) {
    …}
```
    Note, Bind can be skipped for both types of sockets

### Listen
`int status = listen(sockid, queueLimit);`

    Instructs TCP protocol implementation to listen for connections
    
    `queuelen` 
        integer, # of active participants that can “wait” for a connection
    `status`    
        0 if listening, -1 if error
            
    NOTE, `listen()` is non-blocking: returns immediately
        
### Connect
`int status = connect(sockid, &foreignAddr, addrlen);`

    The client establishes a connection with the server by calling `connect()`
    
    `foreignAddr`
        struct sockaddr: address of the passive participant
    `addrlen` 
        integer, sizeof(name)
    status
        0 if succesful, -1 otherwise
    Note, `connect()` is blocking
    
### Accept
`int s = accept(sockid, &clientAddr, &addrLen);`

    `s`             => Integer, the new socket(used for data-transfer)
    `clientAddr`    => struct sockaddr, address of the active participant
                       NOTE, filled in upon return
    `addrLen`       => sizeof(clientAddr)
     NOTE, Accept is blocking     
    
    
### Exchanging data with stream socket
`int count = send(sockid, msg, msgLen, flags);`

        `msg`    => const void[], message to be transmitted
        `flags`  => integer, special options, usually just 0
        `count`  => # bytes transmitted (-1 if error)
        
`int count = recv(sockid, recvBuf, bufLen, flags);`

        `recvBuf` => void[], stores received bytes
        
        NOTE, Calls are Blocking it returns only after data is sent/received
        
### Exchanging data with datagram socket
`int count = sendto(sockid, msg, msgLen, flags, &foreignAddr, addrlen);`

`int count = recvfrom(sockid, recvBuf, bufLen, flags, &clientAddr, addrlen);`
    
    
    
    
    
    
    
    
