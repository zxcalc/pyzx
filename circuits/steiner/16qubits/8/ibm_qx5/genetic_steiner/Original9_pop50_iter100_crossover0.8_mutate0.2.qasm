// Initial wiring: [14, 6, 10, 8, 15, 5, 0, 7, 9, 11, 3, 1, 2, 4, 12, 13]
// Resulting wiring: [14, 6, 10, 8, 15, 5, 0, 7, 9, 11, 3, 1, 2, 4, 12, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[3], q[2];
cx q[10], q[5];
cx q[14], q[1];
cx q[1], q[0];
cx q[4], q[11];
cx q[11], q[10];
cx q[3], q[12];
