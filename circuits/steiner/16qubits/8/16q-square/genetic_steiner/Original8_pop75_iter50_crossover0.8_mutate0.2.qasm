// Initial wiring: [14, 13, 6, 10, 2, 3, 8, 9, 0, 1, 7, 15, 4, 12, 5, 11]
// Resulting wiring: [14, 13, 6, 10, 2, 3, 8, 9, 0, 1, 7, 15, 4, 12, 5, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[4], q[3];
cx q[3], q[2];
cx q[4], q[3];
cx q[10], q[11];
cx q[9], q[10];
cx q[10], q[13];
cx q[5], q[6];
cx q[4], q[5];
cx q[2], q[5];
