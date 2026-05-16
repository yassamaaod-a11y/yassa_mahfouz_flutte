import socket
import time
def server():
    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    sock.setsockopt(socket.SOL_SOCKET, socket.SO_BROADCAST, 1)

    addresses = [
        ('<broadcast>', 12345),
        ('<broadcast>', 1234)
    ]

    print("Server started:")
    while True:
        data = "Hello, client! This is a broadcast message."
        for address in addresses:
            sock.sendto(data.encode('ascii'), address)
        print("Broadcast message sent to address:", address)
        time.sleep(3)

server()