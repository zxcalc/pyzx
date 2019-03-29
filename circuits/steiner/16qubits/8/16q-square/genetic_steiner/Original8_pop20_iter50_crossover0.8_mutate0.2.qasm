// Initial wiring: [14, 13, 8, 4, 1, 3, 6, 10, 11, 2, 12, 7, 15, 0, 5, 9]
// Resulting wiring: [14, 13, 8, 4, 1, 3, 6, 10, 11, 2, 12, 7, 15, 0, 5, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[2];
cx q[6], q[1];
cx q[7], q[6];
cx q[6], q[5];
cx q[9], q[6];
cx q[11], q[12];
cx q[4], q[11];
cx q[11], q[10];
