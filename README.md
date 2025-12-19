# Chinese Whispers
A project to pass a string between as many languages as possible.

Has no practical purpose, but it's interesting to see how far we can push the idea.

If you know any languages not on the list, please add them! Each file should be named `n_[programming language]`, where n is the number of the program. It should take in a string, and append `"Hello from [programming language].\n"`. It is your resonsibility to add appropriate output IPC to the previous file, so that it can interface with your program.

Any form of IPC or API is acceptable.

Chain of messages and type of IPC:

1. NASM x86_64 Assembly
2. C (SYSV ABI)
3. Rust (SYSV ABI)
4. Python (named pipe)

## Requirements
- Linux x86_64
- Python interpreter
