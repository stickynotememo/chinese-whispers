import os
import errno

try:
    os.mkfifo('chinese_whispers_pipe')
except OSError as oe: 
    if oe.errno != errno.EEXIST:
        raise

os.system("./target/3_rust &"); # Run 3_rust in background to start writing to pipe

with open('chinese_whispers_pipe') as fifo:
    data = fifo.read()

print(data + "\nHello from Python.")



