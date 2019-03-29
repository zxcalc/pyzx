// Initial wiring: [3, 11, 14, 1, 10, 7, 5, 6, 0, 15, 9, 4, 8, 12, 2, 13]
// Resulting wiring: [3, 11, 14, 1, 10, 7, 5, 6, 0, 15, 9, 4, 8, 12, 2, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[6], q[5];
cx q[12], q[13];
cx q[9], q[14];
