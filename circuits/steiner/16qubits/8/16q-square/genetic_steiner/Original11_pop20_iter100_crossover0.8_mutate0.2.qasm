// Initial wiring: [7, 13, 0, 5, 2, 11, 1, 4, 12, 15, 14, 9, 6, 10, 3, 8]
// Resulting wiring: [7, 13, 0, 5, 2, 11, 1, 4, 12, 15, 14, 9, 6, 10, 3, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[6], q[5];
cx q[5], q[2];
cx q[12], q[11];
cx q[15], q[14];
cx q[10], q[11];
cx q[4], q[11];
cx q[0], q[1];
