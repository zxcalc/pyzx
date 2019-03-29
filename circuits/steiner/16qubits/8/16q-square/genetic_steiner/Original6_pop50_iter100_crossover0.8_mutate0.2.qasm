// Initial wiring: [7, 11, 3, 5, 12, 8, 6, 1, 4, 15, 10, 0, 9, 13, 2, 14]
// Resulting wiring: [7, 11, 3, 5, 12, 8, 6, 1, 4, 15, 10, 0, 9, 13, 2, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[1];
cx q[11], q[10];
cx q[10], q[9];
cx q[9], q[6];
cx q[13], q[12];
cx q[15], q[14];
cx q[13], q[14];
cx q[3], q[4];
