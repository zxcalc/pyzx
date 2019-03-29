// Initial wiring: [14, 4, 10, 12, 1, 15, 5, 0, 11, 8, 13, 7, 3, 9, 2, 6]
// Resulting wiring: [14, 4, 10, 12, 1, 15, 5, 0, 11, 8, 13, 7, 3, 9, 2, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[5], q[2];
cx q[8], q[7];
cx q[14], q[9];
cx q[9], q[6];
cx q[14], q[13];
cx q[14], q[9];
cx q[13], q[14];
cx q[9], q[14];
cx q[1], q[6];
