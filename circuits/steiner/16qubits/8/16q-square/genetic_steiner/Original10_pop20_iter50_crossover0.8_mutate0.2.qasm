// Initial wiring: [12, 2, 13, 1, 10, 14, 7, 8, 3, 0, 4, 11, 9, 15, 6, 5]
// Resulting wiring: [12, 2, 13, 1, 10, 14, 7, 8, 3, 0, 4, 11, 9, 15, 6, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[11], q[10];
cx q[15], q[14];
cx q[14], q[13];
cx q[8], q[9];
cx q[9], q[14];
cx q[6], q[9];
cx q[5], q[10];
cx q[0], q[1];
