// Initial wiring: [0, 14, 2, 10, 7, 13, 3, 15, 12, 8, 6, 11, 9, 4, 5, 1]
// Resulting wiring: [0, 14, 2, 10, 7, 13, 3, 15, 12, 8, 6, 11, 9, 4, 5, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[9];
cx q[11], q[4];
cx q[4], q[3];
cx q[10], q[11];
cx q[6], q[9];
cx q[9], q[8];
cx q[2], q[3];
