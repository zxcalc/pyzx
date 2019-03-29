// Initial wiring: [1, 0, 7, 12, 5, 13, 2, 4, 15, 14, 3, 10, 6, 8, 11, 9]
// Resulting wiring: [1, 0, 7, 12, 5, 13, 2, 4, 15, 14, 3, 10, 6, 8, 11, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[14], q[6];
cx q[6], q[13];
cx q[5], q[12];
