import socket

def client():
    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    sock.setsockopt(socket.SOL_SOCKET, socket.SO_BROADCAST, 1)
    sock.bind(("", 1234))  # Bind to all interfaces on port 1234

    print("Client is listening for broadcast messages:")

    while True:
        data, addr = sock.recvfrom(1024)
        print(f"Received message: {data.decode('ascii')} from {addr}")

client()