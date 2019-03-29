// Initial wiring: [3, 4, 6, 14, 1, 5, 0, 13, 8, 7, 2, 10, 11, 9, 12, 15]
// Resulting wiring: [3, 4, 6, 14, 1, 5, 0, 13, 8, 7, 2, 10, 11, 9, 12, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[7];
cx q[14], q[13];
cx q[15], q[14];
cx q[10], q[13];
