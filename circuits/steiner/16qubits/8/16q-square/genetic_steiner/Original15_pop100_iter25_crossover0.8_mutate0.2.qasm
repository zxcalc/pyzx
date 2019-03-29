// Initial wiring: [12, 11, 0, 15, 7, 2, 14, 9, 5, 3, 8, 10, 6, 1, 4, 13]
// Resulting wiring: [12, 11, 0, 15, 7, 2, 14, 9, 5, 3, 8, 10, 6, 1, 4, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[3], q[2];
cx q[5], q[4];
cx q[14], q[9];
cx q[15], q[14];
cx q[14], q[9];
cx q[13], q[14];
cx q[10], q[11];
cx q[5], q[6];
