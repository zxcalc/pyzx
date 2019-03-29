// Initial wiring: [12, 6, 1, 10, 13, 14, 4, 3, 15, 7, 11, 2, 5, 0, 9, 8]
// Resulting wiring: [12, 6, 1, 10, 13, 14, 4, 3, 15, 7, 11, 2, 5, 0, 9, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[3], q[2];
cx q[9], q[8];
cx q[8], q[7];
cx q[9], q[8];
cx q[10], q[9];
cx q[9], q[8];
cx q[8], q[7];
cx q[9], q[8];
cx q[10], q[9];
cx q[8], q[9];
cx q[2], q[3];
cx q[1], q[2];
cx q[2], q[3];
cx q[3], q[2];
