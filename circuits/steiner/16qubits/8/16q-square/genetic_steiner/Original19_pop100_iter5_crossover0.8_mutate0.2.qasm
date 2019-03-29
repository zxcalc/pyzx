// Initial wiring: [6, 15, 8, 3, 5, 7, 4, 12, 11, 14, 1, 10, 2, 9, 0, 13]
// Resulting wiring: [6, 15, 8, 3, 5, 7, 4, 12, 11, 14, 1, 10, 2, 9, 0, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[5], q[2];
cx q[6], q[1];
cx q[8], q[7];
cx q[7], q[6];
cx q[6], q[5];
cx q[6], q[1];
cx q[7], q[6];
cx q[9], q[8];
cx q[8], q[7];
cx q[9], q[6];
cx q[10], q[5];
cx q[5], q[2];
cx q[10], q[5];
cx q[7], q[8];
