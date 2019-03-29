// Initial wiring: [8, 10, 0, 6, 1, 5, 12, 15, 3, 7, 14, 2, 13, 9, 11, 4]
// Resulting wiring: [8, 10, 0, 6, 1, 5, 12, 15, 3, 7, 14, 2, 13, 9, 11, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[7], q[6];
cx q[15], q[14];
cx q[14], q[13];
