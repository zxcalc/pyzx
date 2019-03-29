// Initial wiring: [3, 19, 8, 13, 18, 7, 0, 14, 1, 2, 17, 12, 6, 5, 15, 9, 4, 11, 10, 16]
// Resulting wiring: [3, 19, 8, 13, 18, 7, 0, 14, 1, 2, 17, 12, 6, 5, 15, 9, 4, 11, 10, 16]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[0];
cx q[16], q[13];
cx q[6], q[12];
cx q[3], q[5];
