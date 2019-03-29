// Initial wiring: [5, 10, 14, 15, 12, 1, 11, 2, 8, 0, 13, 6, 7, 9, 4, 3]
// Resulting wiring: [5, 10, 14, 15, 12, 1, 11, 2, 8, 0, 13, 6, 7, 9, 4, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[7], q[0];
cx q[8], q[7];
cx q[14], q[9];
cx q[15], q[14];
cx q[9], q[10];
cx q[1], q[6];
cx q[6], q[7];
