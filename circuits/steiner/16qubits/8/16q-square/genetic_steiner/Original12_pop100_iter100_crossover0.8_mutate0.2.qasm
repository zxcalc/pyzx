// Initial wiring: [12, 5, 3, 10, 14, 6, 1, 11, 13, 9, 0, 4, 15, 7, 2, 8]
// Resulting wiring: [12, 5, 3, 10, 14, 6, 1, 11, 13, 9, 0, 4, 15, 7, 2, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[3], q[2];
cx q[11], q[10];
cx q[11], q[4];
cx q[13], q[12];
cx q[14], q[15];
cx q[8], q[9];
cx q[1], q[2];
