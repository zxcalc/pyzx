// Initial wiring: [15, 3, 14, 11, 6, 12, 0, 10, 13, 7, 4, 5, 2, 8, 1, 9]
// Resulting wiring: [15, 3, 14, 11, 6, 12, 0, 10, 13, 7, 4, 5, 2, 8, 1, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[3];
cx q[15], q[12];
cx q[14], q[7];
cx q[6], q[14];
cx q[1], q[4];
cx q[0], q[5];
cx q[5], q[12];
cx q[2], q[9];
