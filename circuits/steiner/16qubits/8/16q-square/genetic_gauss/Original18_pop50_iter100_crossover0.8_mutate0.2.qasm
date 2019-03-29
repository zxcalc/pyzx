// Initial wiring: [14, 3, 9, 10, 2, 5, 0, 15, 13, 4, 12, 8, 11, 1, 7, 6]
// Resulting wiring: [14, 3, 9, 10, 2, 5, 0, 15, 13, 4, 12, 8, 11, 1, 7, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[0];
cx q[8], q[1];
cx q[13], q[4];
cx q[6], q[13];
cx q[7], q[12];
cx q[1], q[9];
cx q[3], q[8];
cx q[1], q[7];
