// Initial wiring: [14, 15, 12, 2, 9, 13, 0, 1, 10, 8, 5, 11, 4, 6, 3, 7]
// Resulting wiring: [14, 15, 12, 2, 9, 13, 0, 1, 10, 8, 5, 11, 4, 6, 3, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[12], q[11];
cx q[14], q[13];
cx q[7], q[8];
cx q[6], q[7];
cx q[1], q[2];
cx q[2], q[3];
cx q[0], q[15];
