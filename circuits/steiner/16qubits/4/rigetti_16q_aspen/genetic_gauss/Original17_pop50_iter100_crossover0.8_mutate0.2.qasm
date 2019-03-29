// Initial wiring: [5, 13, 10, 3, 9, 8, 14, 1, 12, 7, 6, 15, 11, 2, 4, 0]
// Resulting wiring: [5, 13, 10, 3, 9, 8, 14, 1, 12, 7, 6, 15, 11, 2, 4, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[3];
cx q[15], q[3];
cx q[12], q[4];
cx q[14], q[7];
