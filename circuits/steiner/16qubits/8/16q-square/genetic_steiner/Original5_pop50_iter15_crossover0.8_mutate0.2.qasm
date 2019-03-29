// Initial wiring: [12, 13, 14, 0, 10, 5, 9, 11, 8, 6, 1, 4, 15, 2, 7, 3]
// Resulting wiring: [12, 13, 14, 0, 10, 5, 9, 11, 8, 6, 1, 4, 15, 2, 7, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[6], q[5];
cx q[6], q[1];
cx q[10], q[9];
cx q[9], q[6];
cx q[6], q[1];
cx q[9], q[6];
cx q[14], q[13];
cx q[13], q[10];
cx q[10], q[11];
cx q[7], q[8];
