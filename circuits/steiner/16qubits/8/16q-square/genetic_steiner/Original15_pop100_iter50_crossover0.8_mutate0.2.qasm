// Initial wiring: [12, 1, 6, 5, 8, 9, 4, 7, 2, 13, 15, 10, 11, 0, 3, 14]
// Resulting wiring: [12, 1, 6, 5, 8, 9, 4, 7, 2, 13, 15, 10, 11, 0, 3, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[7];
cx q[9], q[6];
cx q[13], q[12];
cx q[10], q[13];
cx q[9], q[14];
cx q[8], q[15];
cx q[4], q[11];
cx q[1], q[6];
