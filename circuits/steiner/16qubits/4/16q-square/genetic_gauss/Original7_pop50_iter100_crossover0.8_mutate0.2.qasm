// Initial wiring: [0, 9, 1, 7, 5, 13, 6, 15, 2, 8, 3, 14, 12, 10, 11, 4]
// Resulting wiring: [0, 9, 1, 7, 5, 13, 6, 15, 2, 8, 3, 14, 12, 10, 11, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[2];
cx q[15], q[14];
cx q[14], q[1];
cx q[7], q[12];
