// Initial wiring: [2, 1, 0, 14, 9, 12, 8, 5, 10, 15, 11, 7, 6, 4, 3, 13]
// Resulting wiring: [2, 1, 0, 14, 9, 12, 8, 5, 10, 15, 11, 7, 6, 4, 3, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[2], q[1];
cx q[13], q[10];
cx q[15], q[14];
cx q[14], q[13];
cx q[13], q[10];
cx q[14], q[9];
cx q[9], q[10];
cx q[8], q[15];
cx q[2], q[3];
