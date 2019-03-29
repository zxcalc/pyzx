// Initial wiring: [5, 9, 2, 6, 4, 10, 14, 0, 11, 1, 3, 8, 12, 13, 7, 15]
// Resulting wiring: [5, 9, 2, 6, 4, 10, 14, 0, 11, 1, 3, 8, 12, 13, 7, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[2], q[1];
cx q[3], q[2];
cx q[6], q[1];
cx q[9], q[8];
cx q[8], q[7];
cx q[11], q[10];
cx q[14], q[13];
cx q[0], q[7];
