// Initial wiring: [12, 18, 2, 15, 4, 9, 5, 19, 8, 10, 16, 1, 3, 13, 17, 14, 11, 6, 0, 7]
// Resulting wiring: [12, 18, 2, 15, 4, 9, 5, 19, 8, 10, 16, 1, 3, 13, 17, 14, 11, 6, 0, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[0];
cx q[14], q[13];
cx q[19], q[18];
cx q[16], q[17];
cx q[14], q[15];
cx q[1], q[8];
