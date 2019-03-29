// Initial wiring: [14, 6, 19, 5, 0, 16, 15, 13, 10, 1, 2, 7, 9, 11, 12, 3, 18, 8, 4, 17]
// Resulting wiring: [14, 6, 19, 5, 0, 16, 15, 13, 10, 1, 2, 7, 9, 11, 12, 3, 18, 8, 4, 17]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[8], q[7];
cx q[12], q[6];
cx q[13], q[7];
cx q[7], q[1];
cx q[16], q[17];
cx q[3], q[6];
cx q[2], q[7];
