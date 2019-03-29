// Initial wiring: [0, 2, 11, 13, 7, 4, 1, 6, 5, 14, 3, 10, 9, 12, 15, 8]
// Resulting wiring: [0, 2, 11, 13, 7, 4, 1, 6, 5, 14, 3, 10, 9, 12, 15, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[7], q[0];
cx q[8], q[7];
cx q[7], q[0];
cx q[8], q[7];
cx q[9], q[8];
cx q[8], q[7];
cx q[9], q[8];
cx q[13], q[10];
cx q[10], q[9];
cx q[13], q[10];
cx q[14], q[15];
cx q[10], q[13];
cx q[8], q[9];
cx q[4], q[11];
