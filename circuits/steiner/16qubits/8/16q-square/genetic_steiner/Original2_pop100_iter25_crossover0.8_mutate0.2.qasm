// Initial wiring: [7, 13, 0, 1, 10, 9, 2, 14, 5, 12, 15, 8, 6, 3, 4, 11]
// Resulting wiring: [7, 13, 0, 1, 10, 9, 2, 14, 5, 12, 15, 8, 6, 3, 4, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[0];
cx q[10], q[9];
cx q[9], q[6];
cx q[13], q[12];
cx q[14], q[15];
cx q[5], q[6];
cx q[3], q[4];
cx q[2], q[3];
