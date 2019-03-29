// Initial wiring: [1, 11, 2, 14, 19, 15, 17, 18, 12, 4, 13, 7, 9, 0, 10, 3, 5, 6, 8, 16]
// Resulting wiring: [1, 11, 2, 14, 19, 15, 17, 18, 12, 4, 13, 7, 9, 0, 10, 3, 5, 6, 8, 16]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[0];
cx q[8], q[1];
cx q[16], q[15];
cx q[18], q[17];
