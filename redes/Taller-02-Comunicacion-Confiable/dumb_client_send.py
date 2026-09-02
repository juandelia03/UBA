import socket
import os
import argparse
import common

parser = argparse.ArgumentParser()

parser.add_argument("--address", type=str, default="127.0.0.1", help="Direccion del servidor")
parser.add_argument("--file", type=str, default="tux.bmp", help="Archivo a enviar")
parser.add_argument("--disorded", type=bool, default=False, help="perder un frame a proposito")


args = parser.parse_args()

chunks = common.split_file_in_chunks(args.file)

total = len(chunks)
addr = (args.address, 12000)
sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

print(f"enviando {os.path.basename(args.file)} en {total} frames")
i = 0
disorded_chunks = [100,101]
while i < len(chunks):
    print(i)
    is_last = i == len(chunks) - 1
    data_frame = common.encode_dumb_data_frame(is_last, chunks[i])
    # desordenar el envio de dos frames
    if args.disorded and i in disorded_chunks:
        if i == 100:
            data_frame = common.encode_dumb_data_frame(is_last, chunks[101])
        if i == 101:
            data_frame = common.encode_dumb_data_frame(is_last, chunks[100])
    sock.sendto(data_frame, addr)
    i += 1

print("transferencia terminada")
sock.close()

