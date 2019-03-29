// Initial wiring: [4, 0, 14, 9, 12, 6, 7, 8, 5, 3, 15, 10, 13, 11, 1, 2]
// Resulting wiring: [4, 0, 14, 9, 12, 6, 7, 8, 5, 3, 15, 10, 13, 11, 1, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[14], q[15];
cx q[12], q[13];
cx q[9], q[10];
