// Initial wiring: [15, 6, 11, 8, 1, 3, 4, 10, 0, 9, 13, 2, 14, 7, 12, 5]
// Resulting wiring: [15, 6, 11, 8, 1, 3, 4, 10, 0, 9, 13, 2, 14, 7, 12, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[7];
cx q[7], q[0];
cx q[10], q[9];
cx q[12], q[11];
cx q[15], q[14];
cx q[10], q[11];
cx q[1], q[2];
cx q[0], q[1];
