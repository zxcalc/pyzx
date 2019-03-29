// Initial wiring: [9, 12, 8, 0, 14, 5, 1, 15, 2, 11, 3, 4, 7, 6, 13, 10]
// Resulting wiring: [9, 12, 8, 0, 14, 5, 1, 15, 2, 11, 3, 4, 7, 6, 13, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[14], q[13];
cx q[13], q[12];
cx q[15], q[14];
cx q[14], q[13];
cx q[13], q[12];
cx q[12], q[11];
cx q[15], q[14];
cx q[11], q[12];
cx q[12], q[13];
cx q[8], q[9];
cx q[9], q[10];
cx q[10], q[11];
cx q[11], q[12];
cx q[12], q[11];
cx q[2], q[3];
