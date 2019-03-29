// Initial wiring: [14, 11, 0, 10, 5, 1, 9, 7, 2, 8, 4, 3, 13, 6, 15, 12]
// Resulting wiring: [14, 11, 0, 10, 5, 1, 9, 7, 2, 8, 4, 3, 13, 6, 15, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[1], q[0];
cx q[13], q[10];
cx q[10], q[5];
cx q[13], q[10];
cx q[14], q[15];
cx q[9], q[14];
cx q[14], q[15];
cx q[9], q[10];
cx q[5], q[6];
