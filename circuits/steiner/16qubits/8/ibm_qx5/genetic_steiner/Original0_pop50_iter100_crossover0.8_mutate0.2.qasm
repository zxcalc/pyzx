// Initial wiring: [7, 10, 13, 15, 12, 14, 0, 2, 11, 5, 6, 3, 8, 9, 4, 1]
// Resulting wiring: [7, 10, 13, 15, 12, 14, 0, 2, 11, 5, 6, 3, 8, 9, 4, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[6];
cx q[6], q[5];
cx q[9], q[6];
cx q[6], q[5];
cx q[11], q[4];
cx q[5], q[10];
cx q[4], q[5];
cx q[3], q[12];
cx q[0], q[1];
