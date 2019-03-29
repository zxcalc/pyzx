// Initial wiring: [8, 12, 13, 11, 6, 5, 3, 7, 10, 15, 14, 1, 9, 0, 4, 2]
// Resulting wiring: [8, 12, 13, 11, 6, 5, 3, 7, 10, 15, 14, 1, 9, 0, 4, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[1];
cx q[14], q[3];
cx q[3], q[12];
cx q[5], q[11];
