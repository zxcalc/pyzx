// Initial wiring: [14, 9, 5, 0, 11, 4, 2, 13, 7, 6, 12, 1, 15, 8, 3, 10]
// Resulting wiring: [14, 9, 5, 0, 11, 4, 2, 13, 7, 6, 12, 1, 15, 8, 3, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[7];
cx q[9], q[6];
cx q[6], q[1];
cx q[9], q[6];
cx q[11], q[4];
cx q[4], q[3];
cx q[13], q[14];
cx q[2], q[3];
cx q[0], q[1];
