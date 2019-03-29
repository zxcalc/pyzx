// Initial wiring: [4, 0, 12, 10, 8, 15, 2, 11, 7, 1, 9, 13, 14, 6, 3, 5]
// Resulting wiring: [4, 0, 12, 10, 8, 15, 2, 11, 7, 1, 9, 13, 14, 6, 3, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[14], q[13];
cx q[13], q[12];
cx q[12], q[11];
cx q[11], q[10];
cx q[10], q[9];
cx q[11], q[10];
cx q[12], q[11];
cx q[13], q[12];
cx q[14], q[13];
cx q[15], q[14];
cx q[14], q[13];
cx q[13], q[12];
cx q[12], q[11];
cx q[11], q[10];
cx q[10], q[9];
cx q[11], q[10];
cx q[12], q[11];
cx q[13], q[12];
cx q[14], q[13];
cx q[11], q[12];
cx q[8], q[15];
cx q[15], q[14];
