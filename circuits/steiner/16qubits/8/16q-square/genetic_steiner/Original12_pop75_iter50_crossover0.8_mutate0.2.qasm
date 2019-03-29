// Initial wiring: [9, 10, 3, 6, 14, 5, 1, 13, 15, 7, 12, 4, 0, 11, 2, 8]
// Resulting wiring: [9, 10, 3, 6, 14, 5, 1, 13, 15, 7, 12, 4, 0, 11, 2, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[2];
cx q[7], q[0];
cx q[9], q[8];
cx q[11], q[4];
cx q[14], q[15];
cx q[11], q[12];
cx q[5], q[10];
cx q[1], q[2];
