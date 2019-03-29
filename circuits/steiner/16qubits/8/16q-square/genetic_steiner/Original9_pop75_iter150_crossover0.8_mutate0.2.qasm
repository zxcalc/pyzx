// Initial wiring: [1, 15, 7, 11, 4, 9, 5, 3, 14, 6, 12, 13, 2, 8, 10, 0]
// Resulting wiring: [1, 15, 7, 11, 4, 9, 5, 3, 14, 6, 12, 13, 2, 8, 10, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[7], q[6];
cx q[10], q[9];
cx q[13], q[12];
cx q[14], q[9];
cx q[9], q[8];
cx q[13], q[14];
cx q[0], q[7];
