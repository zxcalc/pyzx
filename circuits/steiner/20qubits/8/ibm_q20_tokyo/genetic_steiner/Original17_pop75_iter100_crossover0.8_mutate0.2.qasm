// Initial wiring: [12, 9, 10, 14, 15, 11, 6, 16, 0, 18, 1, 4, 8, 7, 13, 17, 5, 19, 3, 2]
// Resulting wiring: [12, 9, 10, 14, 15, 11, 6, 16, 0, 18, 1, 4, 8, 7, 13, 17, 5, 19, 3, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[10], q[9];
cx q[12], q[6];
cx q[6], q[3];
cx q[16], q[15];
cx q[13], q[14];
cx q[1], q[7];
