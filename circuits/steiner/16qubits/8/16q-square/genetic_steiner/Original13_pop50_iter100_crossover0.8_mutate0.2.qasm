// Initial wiring: [14, 2, 12, 3, 7, 0, 5, 15, 10, 6, 9, 13, 4, 11, 8, 1]
// Resulting wiring: [14, 2, 12, 3, 7, 0, 5, 15, 10, 6, 9, 13, 4, 11, 8, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[5];
cx q[5], q[2];
cx q[10], q[5];
cx q[14], q[9];
cx q[13], q[14];
cx q[11], q[12];
cx q[10], q[13];
cx q[10], q[11];
cx q[9], q[10];
cx q[10], q[13];
cx q[10], q[11];
cx q[5], q[10];
