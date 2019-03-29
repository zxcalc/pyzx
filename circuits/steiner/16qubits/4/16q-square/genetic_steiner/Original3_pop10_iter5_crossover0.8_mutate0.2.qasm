// Initial wiring: [15, 0, 9, 7, 5, 14, 4, 2, 12, 10, 13, 1, 6, 3, 11, 8]
// Resulting wiring: [15, 0, 9, 7, 5, 14, 4, 2, 12, 10, 13, 1, 6, 3, 11, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[10], q[5];
cx q[11], q[10];
cx q[10], q[5];
cx q[11], q[10];
cx q[15], q[8];
cx q[0], q[7];
