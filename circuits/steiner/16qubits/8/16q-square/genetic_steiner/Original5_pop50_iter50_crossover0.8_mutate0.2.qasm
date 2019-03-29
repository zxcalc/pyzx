// Initial wiring: [11, 8, 1, 4, 3, 6, 2, 7, 5, 9, 13, 15, 14, 0, 10, 12]
// Resulting wiring: [11, 8, 1, 4, 3, 6, 2, 7, 5, 9, 13, 15, 14, 0, 10, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[2];
cx q[7], q[6];
cx q[6], q[5];
cx q[5], q[2];
cx q[9], q[8];
cx q[14], q[13];
cx q[2], q[5];
cx q[5], q[10];
cx q[2], q[3];
cx q[0], q[1];
