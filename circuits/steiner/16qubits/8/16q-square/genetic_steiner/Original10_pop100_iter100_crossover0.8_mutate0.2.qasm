// Initial wiring: [2, 7, 0, 3, 13, 6, 15, 12, 10, 1, 5, 11, 4, 14, 9, 8]
// Resulting wiring: [2, 7, 0, 3, 13, 6, 15, 12, 10, 1, 5, 11, 4, 14, 9, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[7], q[0];
cx q[10], q[5];
cx q[13], q[12];
cx q[11], q[12];
cx q[5], q[6];
cx q[2], q[5];
cx q[1], q[2];
