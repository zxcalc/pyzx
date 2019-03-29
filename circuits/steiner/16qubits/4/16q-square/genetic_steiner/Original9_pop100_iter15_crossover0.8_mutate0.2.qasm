// Initial wiring: [14, 9, 5, 0, 3, 1, 15, 7, 12, 2, 11, 4, 13, 6, 8, 10]
// Resulting wiring: [14, 9, 5, 0, 3, 1, 15, 7, 12, 2, 11, 4, 13, 6, 8, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[7];
cx q[10], q[9];
cx q[12], q[13];
cx q[9], q[14];
