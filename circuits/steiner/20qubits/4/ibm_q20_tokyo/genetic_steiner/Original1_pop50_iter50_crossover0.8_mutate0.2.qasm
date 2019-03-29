// Initial wiring: [1, 18, 12, 19, 11, 9, 7, 13, 6, 4, 0, 5, 15, 14, 3, 10, 8, 17, 2, 16]
// Resulting wiring: [1, 18, 12, 19, 11, 9, 7, 13, 6, 4, 0, 5, 15, 14, 3, 10, 8, 17, 2, 16]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[15], q[13];
cx q[16], q[13];
cx q[18], q[17];
cx q[2], q[8];
