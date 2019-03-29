// Initial wiring: [12, 7, 10, 0, 11, 3, 1, 4, 14, 2, 5, 8, 15, 9, 6, 13]
// Resulting wiring: [12, 7, 10, 0, 11, 3, 1, 4, 14, 2, 5, 8, 15, 9, 6, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[6];
cx q[13], q[10];
cx q[6], q[9];
cx q[9], q[14];
cx q[14], q[15];
cx q[4], q[11];
cx q[2], q[3];
cx q[1], q[6];
cx q[6], q[9];
cx q[6], q[7];
