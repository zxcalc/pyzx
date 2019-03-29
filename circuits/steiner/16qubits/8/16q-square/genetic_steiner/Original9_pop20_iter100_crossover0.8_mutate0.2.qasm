// Initial wiring: [6, 10, 12, 13, 9, 2, 8, 14, 11, 4, 1, 15, 5, 3, 7, 0]
// Resulting wiring: [6, 10, 12, 13, 9, 2, 8, 14, 11, 4, 1, 15, 5, 3, 7, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[1], q[0];
cx q[2], q[1];
cx q[6], q[5];
cx q[6], q[1];
cx q[11], q[10];
cx q[13], q[12];
cx q[10], q[13];
cx q[0], q[7];
