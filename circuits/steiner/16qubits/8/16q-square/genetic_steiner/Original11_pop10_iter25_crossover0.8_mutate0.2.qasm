// Initial wiring: [12, 9, 14, 2, 7, 13, 6, 10, 8, 15, 1, 5, 11, 0, 4, 3]
// Resulting wiring: [12, 9, 14, 2, 7, 13, 6, 10, 8, 15, 1, 5, 11, 0, 4, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[2], q[1];
cx q[3], q[2];
cx q[6], q[1];
cx q[13], q[12];
cx q[12], q[13];
cx q[13], q[12];
cx q[11], q[12];
cx q[12], q[13];
cx q[10], q[13];
cx q[13], q[12];
cx q[8], q[15];
cx q[4], q[5];
