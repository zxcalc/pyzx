// Initial wiring: [10, 3, 9, 6, 15, 13, 5, 12, 11, 14, 0, 7, 1, 4, 2, 8]
// Resulting wiring: [10, 3, 9, 6, 15, 13, 5, 12, 11, 14, 0, 7, 1, 4, 2, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[2];
cx q[6], q[1];
cx q[10], q[9];
cx q[11], q[4];
cx q[13], q[10];
cx q[10], q[9];
cx q[14], q[15];
cx q[6], q[7];
cx q[0], q[1];
