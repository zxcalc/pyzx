// Initial wiring: [10, 14, 2, 9, 8, 12, 1, 13, 7, 5, 3, 11, 0, 6, 15, 4]
// Resulting wiring: [10, 14, 2, 9, 8, 12, 1, 13, 7, 5, 3, 11, 0, 6, 15, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[0];
cx q[8], q[7];
cx q[9], q[8];
cx q[8], q[7];
cx q[9], q[8];
cx q[10], q[5];
cx q[11], q[4];
