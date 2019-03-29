// Initial wiring: [12, 14, 3, 2, 13, 4, 6, 0, 8, 11, 9, 15, 10, 5, 1, 7]
// Resulting wiring: [12, 14, 3, 2, 13, 4, 6, 0, 8, 11, 9, 15, 10, 5, 1, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[11], q[0];
cx q[10], q[3];
cx q[14], q[12];
cx q[7], q[14];
cx q[0], q[3];
cx q[1], q[15];
cx q[5], q[9];
cx q[2], q[6];
