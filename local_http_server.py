import socket
import select

def __get_address_port()->list:
    HOST = '127.0.0.1'
    PORT = 8080
    address_port = [HOST, PORT]
    return address_port

# Get socket file descriptor as a TCP socket using the IPv4 address family
def config_listener_socket()->None:
    listener_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    listener_socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    config_address(listener_socket)

#Config address
def config_address(listener_socket)->None:
    host = __get_address_port()[0]
    port = __get_address_port()[1]
    address_port = (host, port)
    listener_socket.bind(address_port)
    listen(listener_socket)

def listen(listener_socket)->None:
    listener_socket.listen(1)
    print("The server is listening at 127.0.0.1:8080\n")
   
    while True:
        read_ready_sockets, _, _ = select.select(
            [listener_socket], [], [], 0
        )
        if read_ready_sockets:
           for ready_socket in read_ready_sockets:
               client_socket, client_addr = ready_socket.accept()

               # read up to 4096 bytes of data from the client socket
               client_msg = client_socket.recv(4096)
               print(f"Client said: {client_msg.decode('utf-8')}")

               # Responding to client browser:
               client_socket.sendall(
                    bytes(f"""HTTP/1.1 200 OK\r\nContent-type: text/html\r\nSet-Cookie: ServerName=steveserver\r
                    \r\n
                    <!doctype html>
                    <html>
                        <head/>
                        <body>
                            <h1>DataHawk</h1>
                            <h2>Server address: {__get_address_port()[0]}:{client_addr}</h2>
                            <h3>You're connected through address: {__get_address_port()[0]}:{__get_address_port()[1]}</h3>
                            <body>
                                <pre>{client_msg.decode("utf-8")}<pre>
                            </body>
                        </body>
                    </html>
                    \r\n\r\n
                    """, "utf-8")
                )

               try:
                  client_socket.close()
               except OSError:
                  # client disconnected first, nothing to do
                  raise OSError

def run_server() -> None:    
    config_listener_socket()

if __name__=="__main__":
   run_server()
