// Initial wiring: [5, 12, 13, 1, 11, 9, 0, 3, 10, 4, 14, 15, 7, 6, 2, 8]
// Resulting wiring: [5, 12, 13, 1, 11, 9, 0, 3, 10, 4, 14, 15, 7, 6, 2, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[7];
cx q[9], q[6];
cx q[12], q[11];
cx q[14], q[15];
cx q[9], q[10];
cx q[2], q[5];
cx q[0], q[7];
cx q[0], q[1];
