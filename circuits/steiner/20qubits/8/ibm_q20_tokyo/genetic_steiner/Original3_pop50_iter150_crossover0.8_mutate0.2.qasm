// Initial wiring: [5, 1, 14, 8, 7, 10, 15, 19, 2, 0, 3, 4, 6, 12, 13, 11, 9, 16, 18, 17]
// Resulting wiring: [5, 1, 14, 8, 7, 10, 15, 19, 2, 0, 3, 4, 6, 12, 13, 11, 9, 16, 18, 17]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[4];
cx q[7], q[1];
cx q[9], q[0];
cx q[10], q[8];
cx q[16], q[17];
cx q[14], q[15];
cx q[13], q[16];
cx q[2], q[7];
