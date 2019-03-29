// Initial wiring: [5, 14, 2, 4, 1, 0, 15, 3, 10, 13, 12, 8, 9, 11, 7, 6]
// Resulting wiring: [5, 14, 2, 4, 1, 0, 15, 3, 10, 13, 12, 8, 9, 11, 7, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[2];
cx q[2], q[1];
cx q[1], q[0];
cx q[5], q[2];
cx q[10], q[5];
cx q[14], q[13];
cx q[13], q[10];
cx q[10], q[5];
cx q[14], q[15];
cx q[2], q[3];
