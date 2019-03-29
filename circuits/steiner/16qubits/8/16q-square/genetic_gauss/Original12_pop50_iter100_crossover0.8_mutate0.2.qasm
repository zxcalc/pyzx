// Initial wiring: [12, 0, 3, 10, 15, 6, 4, 9, 14, 13, 11, 2, 5, 1, 8, 7]
// Resulting wiring: [12, 0, 3, 10, 15, 6, 4, 9, 14, 13, 11, 2, 5, 1, 8, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[9], q[7];
cx q[6], q[1];
cx q[12], q[0];
cx q[12], q[2];
cx q[15], q[4];
cx q[6], q[8];
cx q[11], q[14];
