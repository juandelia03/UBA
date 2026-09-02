import argparse
import random
import socket
import time

import common


parser = argparse.ArgumentParser()

parser.add_argument("--file", type=str, default="out.bmp", help="Archivo a guardar")
parser.add_argument(
    "--delay",
    type=float,
    default=0.0,
    help="Simula un delay al enviar frames (tanto de emisor como de receptor)",
)
parser.add_argument(
    "--loss",
    type=float,
    default=0.01,
    help="Probabilidad de pérdida de un frame",
)

args = parser.parse_args()
out_filename = args.file

sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
sock.bind(("0.0.0.0", 12002))

expected_sequence_number = 0
last_ack_sent = -1

with open(out_filename, "wb") as out:
    while True:
        raw_data, addr = sock.recvfrom(common.SLIDINGWINDOW_DATA_FRAME_SIZE)
        time.sleep(args.delay)

        is_last, sequence_number, data = common.decode_slidingwindow_data_frame(
            raw_data
        )

        if random.random() < args.loss:
            print("Simulando perdida de frame de datos")
            continue

        should_write = sequence_number == expected_sequence_number
        transfer_finished = False

        if should_write:
            last_ack_sent = sequence_number
            expected_sequence_number += 1
            transfer_finished = is_last

        # El ACK es acumulativo: confirma el último frame recibido en orden.
        # Si el frame era duplicado o llegó adelantado, se repite el ACK anterior.
        ack_sequence_number = last_ack_sent

        ack_frame = common.encode_slidingwindow_ack_frame(ack_sequence_number)
        if random.random() < args.loss:
            print("Simulando perdida de frame de acknowledgement")
        else:
            sock.sendto(ack_frame, addr)
            time.sleep(args.delay)

        if should_write:
            out.write(data)
            out.flush()

        if transfer_finished:
            print("ultimo frame -> terminamos")
            break

print(f"Descarga guardada en {out_filename}")
sock.close()
