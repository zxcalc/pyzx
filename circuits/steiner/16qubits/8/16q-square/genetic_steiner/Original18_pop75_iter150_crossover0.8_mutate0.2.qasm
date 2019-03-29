// Initial wiring: [6, 4, 5, 9, 14, 8, 3, 13, 10, 15, 12, 0, 1, 2, 11, 7]
// Resulting wiring: [6, 4, 5, 9, 14, 8, 3, 13, 10, 15, 12, 0, 1, 2, 11, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[6];
cx q[6], q[1];
cx q[8], q[7];
cx q[11], q[4];
cx q[12], q[13];
cx q[11], q[12];
cx q[9], q[14];
cx q[6], q[9];
