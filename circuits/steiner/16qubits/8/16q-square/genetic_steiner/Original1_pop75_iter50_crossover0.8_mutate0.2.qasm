// Initial wiring: [8, 5, 0, 4, 11, 7, 2, 10, 13, 1, 14, 6, 15, 3, 12, 9]
// Resulting wiring: [8, 5, 0, 4, 11, 7, 2, 10, 13, 1, 14, 6, 15, 3, 12, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[10], q[9];
cx q[14], q[15];
cx q[10], q[13];
cx q[8], q[15];
cx q[6], q[9];
cx q[9], q[14];
cx q[4], q[11];
cx q[2], q[5];
