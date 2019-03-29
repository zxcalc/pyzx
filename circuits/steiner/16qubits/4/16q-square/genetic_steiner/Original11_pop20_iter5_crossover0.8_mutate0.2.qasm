// Initial wiring: [15, 1, 4, 0, 3, 9, 6, 12, 7, 13, 11, 5, 2, 14, 8, 10]
// Resulting wiring: [15, 1, 4, 0, 3, 9, 6, 12, 7, 13, 11, 5, 2, 14, 8, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[8];
cx q[8], q[7];
cx q[15], q[8];
cx q[8], q[7];
cx q[15], q[8];
cx q[10], q[11];
cx q[3], q[4];
